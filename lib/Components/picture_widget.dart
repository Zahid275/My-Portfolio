import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PictureWidget extends StatelessWidget {
  final double height;
  final double width;
  final BoxFit boxFit;

  PictureWidget({
    super.key,
    required this.height,
    required this.width,
    required this.boxFit,
  });

  RxBool onHover = false.obs;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        onHover.value = true;
      },
      onExit: (_) {
        onHover.value = false;
      },
      child: Obx(() {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [Colors.pink, Colors.blueAccent]),
            boxShadow: [
              BoxShadow(
                color: Colors.pinkAccent,
                blurRadius: onHover.value ?10:5,
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
                  fit: boxFit,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      }),
    );
  }
}
