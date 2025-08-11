import 'package:flutter/material.dart';
class PictureWidget extends StatelessWidget {
  final double height;
  final double width;
  final BoxFit boxFit;

  const PictureWidget({super.key,required this.height,required this.width,required this.boxFit});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Colors.pink, Colors.blueAccent],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.pinkAccent,
            blurRadius: 6,
            spreadRadius: 3,
          ),
        ],
      ),

      child: Center(
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white70,
            image: DecorationImage(
              image: AssetImage("assets/profile.jpg"),
              fit: boxFit
            ),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
