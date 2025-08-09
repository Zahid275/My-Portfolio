import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/controller.dart';
import 'Views/main_layout.dart';

void main() {
  runApp(MyApp());
  Get.put(Controller());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainLayout(),
    );
  }
}
