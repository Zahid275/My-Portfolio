import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Components/bird_box.dart';
import '../Components/gradientContainer.dart';
import '../Controller/controller.dart';
import '../constants/constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 900) {
            return MobileLayoutHomeScreen();
          } else {
            return WebLayoutHomeScreen();
          }
        },
      ),
    );
  }
}

class MobileLayoutHomeScreen extends StatelessWidget {
  MobileLayoutHomeScreen({super.key});

  final controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal:w * 0.03,vertical: h*0.01),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MediaQuery.of(context).size.width <=600 ? GradientContainer(
                  onTap: () {
                    controller.openWebUrl("https://wa.me/923202211840");
                  },
                  children: [
                    SizedBox(
                      width: 14,
                      height: 14,
                      child: Image.asset("assets/icons/whatsapp.png"),
                    ),
                    SizedBox(width: 5),
                    Text("Whatsapp", style: smallText(size: 12)),
                  ],
                ):SizedBox()

              ],
            ),
            SizedBox(height: h * 0.06),

            Center(
              child: BirdBox(
                borderRadius: w * 0.05,
                height: h * 0.27,
                width: w * 0.27,
                child: Image.asset("assets/image.png"),
              ),
            ),
            SizedBox(height: h * 0.1),
            Text("My Personal Portfolio", style: heading(size: 35)),
            Row(
              children: [
                Text("Flutter ", style: heading(size: 35)),
                ShaderMask(
                  shaderCallback:
                      (bounds) => LinearGradient(
                        colors: [Colors.pink, Colors.blue],
                      ).createShader(bounds),
                  child: Text('Developer', style: heading(size: 35)),
                ),
              ],
            ),
            SizedBox(height: h * 0.02),
            Text(
              "I'm capable of creating excellent mobile apps, handling every step from concept to deployment.",
              style: greyText()
            ),
            SizedBox(height: h * 0.06),
            GradientContainer(
              onTap: () {
                controller.openWebUrl(
                  "https://drive.google.com/drive/folders/1vz9mFADCtbMyCgvCEMaVWd7CVqskhR0L?usp=drive_link",
                );
              },
              children: [
                Text("Download CV", style: smallText(size: 12)),
                SizedBox(width: 8),
                Icon(FontAwesomeIcons.download, size: 16, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WebLayoutHomeScreen extends StatelessWidget {
  WebLayoutHomeScreen({super.key});

  final controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(height: h * 0.2),

        Row(
          children: [
            SizedBox(width: w * 0.15, height: h * 0.3),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("My Personal Portfolio", style: heading()),
                    Row(
                      children: [
                        Text("Flutter ", style: heading()),
                        ShaderMask(
                          shaderCallback:
                              (bounds) => LinearGradient(
                                colors: [Colors.pink, Colors.blue],
                              ).createShader(bounds),
                          child: Text('Developer', style: heading()),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: w * 0.39,
                      child: Text(
                        "I'm capable of creating excellent mobile apps"
                        ",handling every step from concept to deployment.",
                        style: greyText(size: 17)
                      ),
                    ),
                    SizedBox(height: h * 0.05),
                    GradientContainer(
                      onTap: () {
                        controller.openWebUrl(
                          "https://drive.google.com/drive/folders/1vz9mFADCtbMyCgvCEMaVWd7CVqskhR0L?usp=drive_link",
                        );
                      },
                      children: [
                        Text("Download CV", style: smallText()),
                        SizedBox(width: w * 0.006),
                        Icon(
                          FontAwesomeIcons.download,
                          size: w * 0.01,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(left: w * 0.12, top: h * 0.02),
              child: BirdBox(
                borderRadius: w * 0.02,
                height: h * 0.41,
                width: w * 0.18,
                child: Center(
                  child: SizedBox(
                    height: h * 0.23,
                    width: h * 6,
                    child: Image.asset(
                      "assets/image.png",

                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
