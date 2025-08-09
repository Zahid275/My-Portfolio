import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Views/aboutscreen.dart';
import 'package:portfolio/Views/home_screen.dart';
import '../Components/gradientContainer.dart';
import '../Controller/controller.dart';
import '../constants/CustomRouting.dart';
import '../Views/projects_screen.dart';
import '../constants/constants.dart';

class MainLayout extends StatelessWidget {

  final GlobalKey<NavigatorState> bodyNavigatorKey = GlobalKey<NavigatorState>();
  final controller = Get.find<Controller>();
   double currentScreen = 0;

  MainLayout({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Column(
        children: [
          SizedBox(height:   MediaQuery.of(context).size.height*0.04,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(),
              Row(
                children: [
                  TextButton(
                    child: Text(
                      "Home",
                      style: smallText(size: 14)
                    ),
                    onPressed: () {
                      if (currentScreen != 0) {
                        bodyNavigatorKey.currentState?.pushNamed('/home');
                        currentScreen = 0;

                      }
                    },
                  ),
                  SizedBox(width:   MediaQuery.of(context).size.width * 0.007),
                  TextButton(
                    child: Text(
                      "Projects",
                      style:smallText(size: 14)
                    ),
                    onPressed: () {
                      if (currentScreen != 1) {
                        bodyNavigatorKey.currentState?.pushNamed('/projects');
                        currentScreen=1;

                      }
                    },
                  ),
                  SizedBox(width:   MediaQuery.of(context).size.width * 0.007),
                  // TextButton(
                  //   child: Text(
                  //     "Certificates",
                  //     style: GoogleFonts.poppins(
                  //       color: Colors.white,
                  //       fontSize: 12,
                  //     ),
                  //   ),
                  //   onPressed: () {
                  //     // onPressed: () => bodyNavigatorKey.currentState?.pushNamed('/'),
                  //   },
                  // ),
                  // SizedBox(width:   MediaQuery.of(context).size.width * 0.007),
                  TextButton(
                    child: Text(
                      "About me",
                      style: smallText(size: 14)
                    ),
                    onPressed: () {
                      if(currentScreen !=3){
                        bodyNavigatorKey.currentState?.pushNamed('/about');
                        currentScreen=3;

                      }
                    },
                  ),
                ],
              ),
                 MediaQuery.of(context).size.width >600 ? GradientContainer(
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
          SizedBox(height:   MediaQuery.of(context).size.height*0.02,),

          // Content area (nested navigator)
          Expanded(
            child: Navigator(
              key: bodyNavigatorKey,
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case '/projects':
                    return currentScreen !=3 ?CustomPageRoute(
                      child: ProjectScreen(),
                      axisDirection: AxisDirection.up
                    ): CustomPageRoute(
                child: ProjectScreen(),
                axisDirection: AxisDirection.down
                );
                  case '/home':
                    return CustomPageRoute(
                      child: HomeScreen(),
                      axisDirection: AxisDirection.down,
                    );
                  case '/about':
                    return CustomPageRoute(
                      child: AboutScreen(),
                      axisDirection: AxisDirection.up,
                    );

                  default:
                    return MaterialPageRoute(builder: (_) => HomeScreen());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
