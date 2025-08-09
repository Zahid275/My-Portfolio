import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Components/project_container.dart';
import 'package:portfolio/Controller/controller.dart';

import '../constants/constants.dart';

class ProjectScreen extends StatelessWidget {
  final controller = Get.find<Controller>();

  ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h =   MediaQuery.of(context).size.height;
    double w =   MediaQuery.of(context).size.width;
    bool isMobile =   MediaQuery.of(context).size.width <= 600;
    bool isTablet =   MediaQuery.of(context).size.width > 600 &&   MediaQuery.of(context).size.width <= 900;
    double height = h * 0.33;
    double width = w * 0.28;

    if (isMobile) {
      width = w * 1.1;
    }
    if (isTablet) {
      width = w * 0.7;
    }

    return Scaffold(
      backgroundColor: background_color,
      body: Column(
        children: [
          Text("Latest Projects", style:isMobile ? heading(size: 35):heading(size: 45)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
              child: GridView.builder(
                itemCount: controller.projects.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: width,
                  mainAxisExtent: height,
                  childAspectRatio: width / height,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Obx(() {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8,
                        top: 15,
                        bottom: 10
                      ),
                      child: ProjectContainer(
                        onHover: (isHovering) {
                          controller.projects[index]["isHovered"].value =
                              isHovering;
                        },
                        blurRadius:
                            controller.projects[index]["isHovered"].value
                                ? 20
                                : 5,
                        title: controller.projects[index]["title"] ?? "",
                        description:
                            controller.projects[index]["description"] ?? "",
                        onTap: () {
                          controller.openWebUrl(
                            "${controller.projects[index]["gitHuburl"]}",
                          );
                        },
                        playBtn:
                            controller.projects[index]["video_url"]
                                        .toString() !=
                                    "null"
                                ? TextButton(
                                  onPressed: () {
                                    controller.openWebUrl(
                                      controller.projects[index]["video_url"]
                                          .toString(),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.solidCirclePlay,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        "Video",
                                        style: GoogleFonts.poppins(
                                          color: Colors.purpleAccent,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                : SizedBox(),
                      ),
                    );
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
