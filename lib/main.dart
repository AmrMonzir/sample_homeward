import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_homeward/modules/app_binding.dart';
import 'package:sample_homeward/modules/login/login.dart';
import 'package:sample_homeward/routes/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        initialBinding: AppBinding(),
        initialRoute: Routes.LOGIN,
        defaultTransition: Transition.fade,
        getPages: AppPages.pages,
        home: LoginPage(),
    );
  }
}
