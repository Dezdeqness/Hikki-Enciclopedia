import 'package:flutter/material.dart';

class InkWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const InkWrapper({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Positioned.fill(
          child: Material(
            color: Colors.white.withOpacity(0.0),
            child: InkWell(
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
