import 'package:flutter/material.dart';

class CallbackScrollView extends StatefulWidget {
  final bool isTransparentToolbar;
  final Function(bool) onTransparentToolbarChanged;
  final List<Widget> children;

  const CallbackScrollView({
    required this.isTransparentToolbar,
    required this.onTransparentToolbarChanged,
    required this.children,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _CallbackScrollViewState();
}

class _CallbackScrollViewState extends State<CallbackScrollView> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _scrollListener() {
    if (_controller.offset >= 280) {
      if (!widget.isTransparentToolbar) {
        return;
      }
      widget.onTransparentToolbarChanged(false);
    }
    if (_controller.offset <= 280) {
      if (widget.isTransparentToolbar) {
        return;
      }
      widget.onTransparentToolbarChanged(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: widget.children,
    );
  }
}
