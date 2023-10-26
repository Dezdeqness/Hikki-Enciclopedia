import 'package:flutter/material.dart';

class InkWellWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const InkWellWrapper({
    required this.child,
    required this.onTap,
    super.key,
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
