import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/Components/bird_box.dart';
import 'package:portfolio/Components/picture_widget.dart';
import 'package:portfolio/Components/skill_bar.dart';
import 'package:portfolio/Controller/controller.dart';
import 'package:portfolio/constants/constants.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body:  LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 700) {
            return mobileLayout_aboutScreen(context);
          } else {
            return webLayout_AboutScreen(context);
          }
        },
      ),
    );
  }
}

Widget webLayout_AboutScreen(context) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;

  final controller = Get.find<Controller>();
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PictureWidget(boxFit: BoxFit.contain,height: h*0.4,width: w*0.4,),
          SizedBox(height: h*0.026),

          Text("Zahid Rasheed", style: heading()),
          Text("Flutter Developer", style: greyText2(size: 22)),
        ],
      ),
      SizedBox(width: w * 0.063),

      BirdBox(
        borderRadius: w * 0.02,
        height: h * 0.63,
        width: w * 0.27,
        child: Padding(
          padding: EdgeInsets.all(w * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Skills",
                style: heading2(size: 30)
              ),
              SizedBox(height: h * 0.02),
              SkillBar(skill: "💠 Flutter", percentage: 0.9),
              SkillBar(skill: "💙 Dart", percentage: 0.80),
              SkillBar(skill: "🔥 Firebase", percentage: 0.75),
              SkillBar(skill: "🌐 REST APIs", percentage: 0.90),
              SkillBar(skill: "⚙️ GetX", percentage: 0.85),
              SkillBar(skill: "📦 Provider", percentage: 0.77),
              SkillBar(skill: "🧱Clean Architecture", percentage: 0.80),
              Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.openWebUrl(
                        "https://www.linkedin.com/in/zahidrasheed287/",
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            "assets/icons/linkedin.png",
                            height: h * 0.034,
                            width: w * 0.034,
                          ),
                        ),
                        Text(
                          "Linkedin",
                          style: TextStyle(
                            fontSize: w * 0.01,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: w * 0.001),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.openWebUrl("https://github.com/Zahid275");
                    },
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            "assets/icons/github.png",
                            height: h * 0.034,
                            width: w * 0.034,
                          ),
                        ),
                        Text(
                          "Github",
                          style: TextStyle(
                            fontSize: w * 0.01,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget mobileLayout_aboutScreen(context) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;

  return SingleChildScrollView(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PictureWidget(boxFit: BoxFit.cover,height: h*0.3,width: w*0.3,),
          Text("Zahid Rasheed", style: heading2(size: 26)),
          Text("Flutter Developer", style: greyText2()),
          SizedBox(height: h*0.05),

          BirdBox(
            borderRadius: w * 0.07,
            width: w * 0.66,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w*0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h*0.01,),
                  Center(
                    child: Text(
                      "Skills",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SkillBar(skill: "💠Flutter", percentage: 0.9),
                  SkillBar(skill: "💙 Dart", percentage: 0.80),
                  SkillBar(skill: "🔥 Firebase", percentage: 0.75),
                  SkillBar(skill: "🌐 REST APIs", percentage: 0.90),
                  SkillBar(skill: "⚙️ GetX", percentage: 0.85),
                  SkillBar(skill: "📦 Provider", percentage: 0.77),
                  SkillBar(skill: "🧱 Clean Architecture", percentage: 0.80),
                  SizedBox(height: h*0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {

                      Get.find<Controller>().openWebUrl(
                        "https://www.linkedin.com/in/zahidrasheed287/",
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            "assets/icons/linkedin.png",
                            height: h * 0.034,
                            width: w * 0.034,
                          ),
                        ),
                        SizedBox(width: w*0.01,),

                        Text(
                          "Linkedin",style: midText(),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {

                      Get.find<Controller>().openWebUrl("https://github.com/Zahid275");
                    },
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            "assets/icons/github.png",
                            height: h * 0.034,
                            width: w * 0.034,
                          ),
                        ),
                        SizedBox(width: w*0.01,),
                        Text(
                          "Github",
                          style: midText()
                        ),
                      ],
                    ),
                  ),
                ],
              ),

                ],
              ),
            ),
          ),SizedBox(height: h*0.05,)
        ],
      ),
    ),
  );
}
