import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection axisDirection;

  CustomPageRoute({
    required this.child,
    required this.axisDirection,
  }) : super(
    transitionDuration: Duration(milliseconds: 700),
    reverseTransitionDuration: Duration(milliseconds: 700),
    pageBuilder: (context, animation, secondaryAnimation) => child,
  );

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    var curve = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
    );

    return SlideTransition(
      position: Tween(begin: _offSetBegin(), end: Offset.zero).animate(curve),
      child: child,
    );
  }

  Offset _offSetBegin() {
    switch (axisDirection) {
      case AxisDirection.up:
        return Offset(0, 1);
      case AxisDirection.down:
        return Offset(0, -1);
      case AxisDirection.right:
        return Offset(1, 0);
      case AxisDirection.left:
        return Offset(-1, 0);
    }
  }
}
