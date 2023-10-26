import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/core/extensions/index.dart';
import 'package:hikki_ui_kit/hikki_ui_kit.dart';

const _trashHoldHeight = 50;

class ExpandedDescription extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final EdgeInsets textPadding;

  const ExpandedDescription({
    required this.text,
    required this.textStyle,
    required this.textPadding,
    super.key,
  });

  @override
  ExpandedDescriptionState createState() => ExpandedDescriptionState();
}

class ExpandedDescriptionState extends State<ExpandedDescription>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool isCollapsed = true;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    _animation = Tween(begin: 0.0, end: .5).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.decelerate));
  }

  @override
  Widget build(BuildContext context) {
    final measuredHeight = widget.text
        .measureTextHeight(const TextStyle(color: Colors.black), context);
    if (measuredHeight > _trashHoldHeight) {
      return _buildWithButton();
    }
    return _buildLimitlessText();
  }

  Widget _buildWithButton() => Column(
        children: [
          AnimatedCrossFade(
            sizeCurve: Curves.fastEaseInToSlowEaseOut,
            duration: const Duration(milliseconds: 400),
            firstChild: _buildLimitText(),
            secondChild: _buildLimitlessText(),
            crossFadeState: isCollapsed
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
          _buildVisibilityButton(),
        ],
      );

  Widget _buildVisibilityButton() => InkWell(
        onTap: () {
          if (_animationController.isDismissed) {
            _animationController.forward();
            setState(() {
              isCollapsed = false;
            });
          } else {
            _animationController.reverse();
            setState(() {
              isCollapsed = true;
            });
          }
        },
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: RotationTransition(
            turns: _animation,
            child: HikkiAssets.icons.shevron.svg(
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      );

  Widget _buildLimitText() => Padding(
        padding: widget.textPadding,
        child: Text(
          widget.text,
          style: widget.textStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          textAlign: TextAlign.start,
        ),
      );

  Widget _buildLimitlessText() => Padding(
        padding: widget.textPadding,
        child: Text(
          widget.text,
          style: widget.textStyle,
          textAlign: TextAlign.start,
        ),
      );
}
