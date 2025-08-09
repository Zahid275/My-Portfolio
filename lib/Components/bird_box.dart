import 'package:flutter/material.dart';

class BirdBox extends StatelessWidget {
  double borderRadius;
  double? height;
  double width;
  Widget? child;


   BirdBox({super.key, required this.width, this.height,required this.borderRadius, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.pink, Colors.blue]),
        borderRadius: BorderRadius.circular(borderRadius),

        boxShadow: [
          BoxShadow(color: Colors.pink, blurRadius: 20, spreadRadius: 2),
        ],
      ),

      child: Container(
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      child: child,
      )
    );
  }
}
