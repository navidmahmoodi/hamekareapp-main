// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/controller/main_controller.dart';
import 'package:hamekare_app/controller/splash_controller.dart';
import 'package:hamekare_app/screen/Intro/intro.dart';
import 'package:hamekare_app/screen/home.dart';
import 'package:hamekare_app/tools/tools.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);

  final _splashController = Get.put(SplashController());
  final _mainController = Get.put(MainController());

  init() async {
    _mainController.init();
    await _splashController.getSplash();
    // toMain();
    if (_splashController.splashModel.isSuccess == true) {
      Get.to(HomeScreen());
    } else {
      await Get.to(IntroScreen());
    }
    // if (_splashController.splashResponse.isError) {
    //   Get.offNamed("/intro");
    // } else {
    //   Get.offNamed("/home");
    // }
  }

  @override
  Widget build(BuildContext context) {
    init();

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyThemes.secondryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 120),
              child: Image.asset(
                imagePath("hamekareh.png"),
                scale: 2.5,
              ),
            ),
            const Spacer(),
            Container(
                margin: const EdgeInsets.only(bottom: 130),
                child: simpleLoading())
          ],
        ),
      ),
    );
  }
}
