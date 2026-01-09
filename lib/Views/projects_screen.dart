import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/Components/project_container.dart';
import 'package:portfolio/Controller/controller.dart';

import '../constants/constants.dart';

class ProjectScreen extends StatelessWidget {
  final controller = Get.find<Controller>();

  ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    bool isMobile = MediaQuery.of(context).size.width <= 600;
    bool isTablet =
        MediaQuery.of(context).size.width > 600 &&
            MediaQuery.of(context).size.width <= 900;
    double width = w * 0.28;

    if (isMobile) {
      width = w * 1.1;
    }
    if (isTablet) {
      width = w * 0.7;
    }

    return Scaffold(
      backgroundColor: background_color,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Latest Projects",
              style: isMobile ? heading(size: 35) : heading(size: 45),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: isMobile ?20:10),
              width: double.maxFinite,
              child: Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: controller.projects.map((project) {
                  final index = controller.projects.indexOf(project);

                  return SizedBox(
                    width: width,
                    child: Obx(() {
                      return ProjectContainer(
                        onHover: (isHovering) {
                          controller.projects[index]["isHovered"].value =
                              isHovering;
                        },
                        blurRadius:
                        controller.projects[index]["isHovered"].value
                            ? 20
                            : 5,
                        title:
                        controller.projects[index]["title"] ?? "",
                        description:
                        controller.projects[index]["description"] ?? "",
                        onTap: () {
                          controller.openWebUrl(
                            "${controller.projects[index]["gitHuburl"]}",
                          );
                        },
                        playBtn: controller.projects[index]["video_url"]
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
                                FontAwesomeIcons
                                    .solidCirclePlay,
                                color: Colors.white,
                                size: 16,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "Video",
                                style: smallText(
                                  color: Colors.purpleAccent,
                                ),
                              ),
                            ],
                          ),
                        )
                            : SizedBox(),
                      );
                    }),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
