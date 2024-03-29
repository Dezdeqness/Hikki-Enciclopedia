import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show clampDouble;
import 'package:flutter/material.dart';

const double _kDragContainerExtentPercentage = 0.25;

const double _kDragSizeFactorLimit = 1.5;

const Duration _kIndicatorSnapDuration = Duration(milliseconds: 150);

const Duration _kIndicatorScaleDuration = Duration(milliseconds: 200);

typedef RefreshCallback = Function();

enum _RefreshIndicatorMode {
  drag, // Pointer is down.
  armed, // Dragged far enough that an up event will run the onRefresh callback.
  snap, // Animating to the indicator's final "displacement".
  refresh, // Running the refresh callback.
  done, // Animating the indicator's fade-out after refreshing.
  canceled, // Animating the indicator's fade-out after not arming.
}

enum RefreshIndicatorTriggerMode {
  anywhere,
  onEdge,
}

enum _IndicatorType { material, adaptive }

class RefreshIndicator1 extends StatefulWidget {
  const RefreshIndicator1({
    super.key,
    required this.child,
    required this.isRefreshing,
    this.displacement = 40.0,
    this.edgeOffset = 0.0,
    required this.onRefresh,
    this.color,
    this.backgroundColor,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.semanticsLabel,
    this.semanticsValue,
    this.strokeWidth = RefreshProgressIndicator.defaultStrokeWidth,
    this.triggerMode = RefreshIndicatorTriggerMode.onEdge,
  }) : _indicatorType = _IndicatorType.material;

  const RefreshIndicator1.adaptive({
    super.key,
    required this.child,
    this.displacement = 40.0,
    this.edgeOffset = 0.0,
    required this.onRefresh,
    required this.isRefreshing,
    this.color,
    this.backgroundColor,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.semanticsLabel,
    this.semanticsValue,
    this.strokeWidth = RefreshProgressIndicator.defaultStrokeWidth,
    this.triggerMode = RefreshIndicatorTriggerMode.onEdge,
  }) : _indicatorType = _IndicatorType.adaptive;

  final bool isRefreshing;
  final Widget child;
  final double displacement;
  final double edgeOffset;
  final RefreshCallback onRefresh;
  final Color? color;
  final Color? backgroundColor;
  final ScrollNotificationPredicate notificationPredicate;
  final String? semanticsLabel;
  final String? semanticsValue;
  final double strokeWidth;
  final _IndicatorType _indicatorType;
  final RefreshIndicatorTriggerMode triggerMode;

  @override
  RefreshIndicatorState createState() => RefreshIndicatorState();
}

class RefreshIndicatorState extends State<RefreshIndicator1>
    with TickerProviderStateMixin<RefreshIndicator1> {
  late AnimationController _positionController;
  late AnimationController _scaleController;
  late Animation<double> _positionFactor;
  late Animation<double> _scaleFactor;
  late Animation<double> _value;
  late Animation<Color?> _valueColor;

  _RefreshIndicatorMode? _mode;
  late Future<void> _pendingRefreshFuture;
  bool? _isIndicatorAtTop;
  double? _dragOffset;

  static final Animatable<double> _threeQuarterTween =
      Tween<double>(begin: 0.0, end: 0.75);
  static final Animatable<double> _kDragSizeFactorLimitTween =
      Tween<double>(begin: 0.0, end: _kDragSizeFactorLimit);
  static final Animatable<double> _oneToZeroTween =
      Tween<double>(begin: 1.0, end: 0.0);

  @override
  void initState() {
    super.initState();
    _positionController = AnimationController(vsync: this);
    _positionFactor = _positionController.drive(_kDragSizeFactorLimitTween);
    _value = _positionController.drive(
        _threeQuarterTween); // The "value" of the circular progress indicator during a drag.

    _scaleController = AnimationController(vsync: this);
    _scaleFactor = _scaleController.drive(_oneToZeroTween);

    _showOrDismissAccordingToIsRefreshing();
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    _valueColor = _positionController.drive(
      ColorTween(
        begin: (widget.color ?? theme.colorScheme.primary).withOpacity(0.0),
        end: (widget.color ?? theme.colorScheme.primary).withOpacity(1.0),
      ).chain(CurveTween(
        curve: const Interval(0.0, 1.0 / _kDragSizeFactorLimit),
      )),
    );
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant RefreshIndicator1 oldWidget) {
    _showOrDismissAccordingToIsRefreshing();
    super.didUpdateWidget(oldWidget);
    if (oldWidget.color != widget.color) {
      final ThemeData theme = Theme.of(context);
      _valueColor = _positionController.drive(
        ColorTween(
          begin: (widget.color ?? theme.colorScheme.primary).withOpacity(0.0),
          end: (widget.color ?? theme.colorScheme.primary).withOpacity(1.0),
        ).chain(CurveTween(
          curve: const Interval(0.0, 1.0 / _kDragSizeFactorLimit),
        )),
      );
    }
  }

  @override
  void dispose() {
    _positionController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _showOrDismissAccordingToIsRefreshing() {
    if (widget.isRefreshing) {
      if (_mode != _RefreshIndicatorMode.refresh) {
        // Doing this work immediately triggers an assertion failure in the case when the refresh indicator is visible
        // upon first display:
        //
        //    I/flutter (21441): The following assertion was thrown building SandvikRefreshIndicator(state:
        //    I/flutter (21441): SandvikRefreshIndicatorState#26328(tickers: tracking 2 tickers)):
        //    I/flutter (21441): 'package:flutter/src/rendering/object.dart': Failed assertion: line 1792 pos 12: '() {
        //    I/flutter (21441):       final AbstractNode parent = this.parent;
        //    I/flutter (21441):       if (parent is RenderObject)
        //    I/flutter (21441):         return parent._needsCompositing;
        //    I/flutter (21441):       return true;
        //    I/flutter (21441):     }()': is not true.
        //
        // Therefore, we schedule it via a future instead.

        Future(() {
          _start(AxisDirection.down);
          _show();
        });
      }
    } else {
      if (_mode != null && _mode != _RefreshIndicatorMode.done) {
        _dismiss(_RefreshIndicatorMode.done);
      }
    }
  }

  bool _shouldStart(ScrollNotification notification) {
    // If the notification.dragDetails is null, this scroll is not triggered by
    // user dragging. It may be a result of ScrollController.jumpTo or ballistic scroll.
    // In this case, we don't want to trigger the refresh indicator.
    return ((notification is ScrollStartNotification &&
                notification.dragDetails != null) ||
            (notification is ScrollUpdateNotification &&
                notification.dragDetails != null &&
                widget.triggerMode == RefreshIndicatorTriggerMode.anywhere)) &&
        ((notification.metrics.axisDirection == AxisDirection.up &&
                notification.metrics.extentAfter == 0.0) ||
            (notification.metrics.axisDirection == AxisDirection.down &&
                notification.metrics.extentBefore == 0.0)) &&
        _mode == null &&
        _start(notification.metrics.axisDirection);
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (!widget.notificationPredicate(notification)) {
      return false;
    }
    if (_shouldStart(notification)) {
      setState(() {
        _mode = _RefreshIndicatorMode.drag;
      });
      return false;
    }
    bool? indicatorAtTopNow;
    switch (notification.metrics.axisDirection) {
      case AxisDirection.down:
      case AxisDirection.up:
        indicatorAtTopNow = true;
      case AxisDirection.left:
      case AxisDirection.right:
        indicatorAtTopNow = null;
    }
    if (indicatorAtTopNow != _isIndicatorAtTop) {
      if (_mode == _RefreshIndicatorMode.drag ||
          _mode == _RefreshIndicatorMode.armed) {
        _dismiss(_RefreshIndicatorMode.canceled);
      }
    } else if (notification is ScrollUpdateNotification) {
      if (_mode == _RefreshIndicatorMode.drag ||
          _mode == _RefreshIndicatorMode.armed) {
        if ((notification.metrics.axisDirection == AxisDirection.down &&
                notification.metrics.extentBefore > 0.0) ||
            (notification.metrics.axisDirection == AxisDirection.up &&
                notification.metrics.extentAfter > 0.0)) {
          _dismiss(_RefreshIndicatorMode.canceled);
        } else {
          if (notification.metrics.axisDirection == AxisDirection.down) {
            _dragOffset = _dragOffset! - notification.scrollDelta!;
          } else if (notification.metrics.axisDirection == AxisDirection.up) {
            _dragOffset = _dragOffset! + notification.scrollDelta!;
          }
          _checkDragOffset(notification.metrics.viewportDimension);
        }
      }
      if (_mode == _RefreshIndicatorMode.armed &&
          notification.dragDetails == null) {
        // On iOS start the refresh when the Scrollable bounces back from the
        // overscroll (ScrollNotification indicating this don't have dragDetails
        // because the scroll activity is not directly triggered by a drag).
        _show();
      }
    } else if (notification is OverscrollNotification) {
      if (_mode == _RefreshIndicatorMode.drag ||
          _mode == _RefreshIndicatorMode.armed) {
        if (notification.metrics.axisDirection == AxisDirection.down) {
          _dragOffset = _dragOffset! - notification.overscroll;
        } else if (notification.metrics.axisDirection == AxisDirection.up) {
          _dragOffset = _dragOffset! + notification.overscroll;
        }
        _checkDragOffset(notification.metrics.viewportDimension);
      }
    } else if (notification is ScrollEndNotification) {
      switch (_mode) {
        case _RefreshIndicatorMode.armed:
          _show();
        case _RefreshIndicatorMode.drag:
          _dismiss(_RefreshIndicatorMode.canceled);
        case _RefreshIndicatorMode.canceled:
        case _RefreshIndicatorMode.done:
        case _RefreshIndicatorMode.refresh:
        case _RefreshIndicatorMode.snap:
        case null:
          // do nothing
          break;
      }
    }
    return false;
  }

  bool _handleIndicatorNotification(
      OverscrollIndicatorNotification notification) {
    if (notification.depth != 0 || !notification.leading) {
      return false;
    }
    if (_mode == _RefreshIndicatorMode.drag) {
      notification.disallowIndicator();
      return true;
    }
    return false;
  }

  bool _start(AxisDirection direction) {
    assert(_mode == null);
    assert(_isIndicatorAtTop == null);
    assert(_dragOffset == null);
    switch (direction) {
      case AxisDirection.down:
      case AxisDirection.up:
        _isIndicatorAtTop = true;
      case AxisDirection.left:
      case AxisDirection.right:
        _isIndicatorAtTop = null;
        // we do not support horizontal scroll views.
        return false;
    }
    _dragOffset = 0.0;
    _scaleController.value = 0.0;
    _positionController.value = 0.0;
    return true;
  }

  void _checkDragOffset(double containerExtent) {
    assert(_mode == _RefreshIndicatorMode.drag ||
        _mode == _RefreshIndicatorMode.armed);
    double newValue =
        _dragOffset! / (containerExtent * _kDragContainerExtentPercentage);
    if (_mode == _RefreshIndicatorMode.armed) {
      newValue = math.max(newValue, 1.0 / _kDragSizeFactorLimit);
    }
    _positionController.value =
        clampDouble(newValue, 0.0, 1.0); // this triggers various rebuilds
    if (_mode == _RefreshIndicatorMode.drag &&
        _valueColor.value!.alpha == 0xFF) {
      _mode = _RefreshIndicatorMode.armed;
    }
  }

  Future<void> _dismiss(_RefreshIndicatorMode newMode) async {
    await Future<void>.value();
    assert(newMode == _RefreshIndicatorMode.canceled ||
        newMode == _RefreshIndicatorMode.done);
    setState(() {
      _mode = newMode;
    });
    switch (_mode!) {
      case _RefreshIndicatorMode.done:
        await _scaleController.animateTo(1.0,
            duration: _kIndicatorScaleDuration);
      case _RefreshIndicatorMode.canceled:
        await _positionController.animateTo(0.0,
            duration: _kIndicatorScaleDuration);
      case _RefreshIndicatorMode.armed:
      case _RefreshIndicatorMode.drag:
      case _RefreshIndicatorMode.refresh:
      case _RefreshIndicatorMode.snap:
        assert(false);
    }
    if (mounted && _mode == newMode) {
      _dragOffset = null;
      _isIndicatorAtTop = null;
      setState(() {
        _mode = null;
      });
    }
  }

  void _show() {
    assert(_mode != _RefreshIndicatorMode.refresh);
    assert(_mode != _RefreshIndicatorMode.snap);
    final Completer<void> completer = Completer<void>();
    _pendingRefreshFuture = completer.future;
    _mode = _RefreshIndicatorMode.snap;
    _positionController
        .animateTo(1.0 / _kDragSizeFactorLimit,
            duration: _kIndicatorSnapDuration)
        .then<void>((void value) {
      if (mounted && _mode == _RefreshIndicatorMode.snap) {
        setState(() {
          // Show the indeterminate progress indicator.
          _mode = _RefreshIndicatorMode.refresh;
        });
        widget.onRefresh();
      }
    });
  }

  Future<void> show({bool atTop = true}) {
    if (_mode != _RefreshIndicatorMode.refresh &&
        _mode != _RefreshIndicatorMode.snap) {
      if (_mode == null) {
        _start(atTop ? AxisDirection.down : AxisDirection.up);
      }
      _show();
    }
    return _pendingRefreshFuture;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final Widget child = NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: _handleIndicatorNotification,
        child: widget.child,
      ),
    );
    assert(() {
      if (_mode == null) {
        assert(_dragOffset == null);
        assert(_isIndicatorAtTop == null);
      } else {
        assert(_dragOffset != null);
        assert(_isIndicatorAtTop != null);
      }
      return true;
    }());

    final bool showIndeterminateIndicator =
        _mode == _RefreshIndicatorMode.refresh ||
            _mode == _RefreshIndicatorMode.done;

    return Stack(
      children: <Widget>[
        child,
        if (_mode != null)
          Positioned(
            top: _isIndicatorAtTop! ? widget.edgeOffset : null,
            bottom: !_isIndicatorAtTop! ? widget.edgeOffset : null,
            left: 0.0,
            right: 0.0,
            child: SizeTransition(
              axisAlignment: _isIndicatorAtTop! ? 1.0 : -1.0,
              sizeFactor: _positionFactor, // this is what brings it down
              child: Container(
                padding: _isIndicatorAtTop!
                    ? EdgeInsets.only(top: widget.displacement)
                    : EdgeInsets.only(bottom: widget.displacement),
                alignment: _isIndicatorAtTop!
                    ? Alignment.topCenter
                    : Alignment.bottomCenter,
                child: ScaleTransition(
                  scale: _scaleFactor,
                  child: AnimatedBuilder(
                    animation: _positionController,
                    builder: (BuildContext context, Widget? child) {
                      final Widget materialIndicator = RefreshProgressIndicator(
                        semanticsLabel: widget.semanticsLabel ??
                            MaterialLocalizations.of(context)
                                .refreshIndicatorSemanticLabel,
                        semanticsValue: widget.semanticsValue,
                        value: showIndeterminateIndicator ? null : _value.value,
                        valueColor: _valueColor,
                        backgroundColor: widget.backgroundColor,
                        strokeWidth: widget.strokeWidth,
                      );

                      final Widget cupertinoIndicator =
                          CupertinoActivityIndicator(
                        color: widget.color,
                      );

                      switch (widget._indicatorType) {
                        case _IndicatorType.material:
                          return materialIndicator;

                        case _IndicatorType.adaptive:
                          {
                            final ThemeData theme = Theme.of(context);
                            switch (theme.platform) {
                              case TargetPlatform.android:
                              case TargetPlatform.fuchsia:
                              case TargetPlatform.linux:
                              case TargetPlatform.windows:
                                return materialIndicator;
                              case TargetPlatform.iOS:
                              case TargetPlatform.macOS:
                                return cupertinoIndicator;
                            }
                          }
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
