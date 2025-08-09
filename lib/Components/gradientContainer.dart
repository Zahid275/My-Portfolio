import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {

  List<Widget> children;
  void Function()? onTap;
  BoxShape? shape;


  GradientContainer({super.key, 
    required this.onTap,
    required this.children,
     shape,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width:135,
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.pink, Colors.blueAccent]),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(color: Colors.pink, blurRadius: 5, spreadRadius: 0.5),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
