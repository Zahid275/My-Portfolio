import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';

class ProjectContainer extends StatelessWidget {
  final void Function()? onTap;
  final void Function(bool)? onHover;
  final double blurRadius;
  final String title;
  final Widget playBtn;
  final String description;

  const ProjectContainer({super.key,
    required this.playBtn,
    required this.title,
    required this.description,
    required this.onTap,
    playVideo,
    isHovered,
    required this.blurRadius,
    required this.onHover,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h= MediaQuery.of(context).size.height;

    return InkWell(
      onHover: onHover,
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: h*0.02),
        padding: EdgeInsets.all(3),
        alignment: Alignment.center,

        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.purpleAccent]),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.purple,
              blurRadius: blurRadius,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.only(
            top :10,
            right: 10,
            left: 10,
            bottom: 5,

          ),
          width: w,
          decoration: BoxDecoration(
            color: background_color,

            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(color: Colors.pink, blurRadius: 5, spreadRadius: 0.5),
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(title, style: heading2()),
              SizedBox(height: 10,),
              Text(
                style: greyText(),
                description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/github.png",
                        width: 20,
                        height: 20
                      ),
                      SizedBox(width: 3,),
                      Text("Github", style: smallText()),
                    ],
                  ),

                  playBtn

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
