import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  BottomBar({
    this.child,
    this.color,
  });
  final Widget child;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: color,
            blurRadius: 4.0,
          ),
        ],
      ),
      child: BottomAppBar(
        child: child,
      ),
    );
  }
}
