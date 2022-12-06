import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rede_social_lr/Components/comp_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Colors/customized_colors_global.dart';
import '../../Colors/pattern_colors.dart';
import '../../Global/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  InstanceSharedPreference sharedPreferences = InstanceSharedPreference();

  @override
  void initState() {
    super.initState();
    sharedPreferences.getThemeStatus();
    sharedPreferences.getToken();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 1304), () {});

    if (sharedPreferences.getToken()) {
      Get.offAndToNamed('/home');
    } else {
      Get.offAndToNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: Get.height * 0.9,
              child: SizedBox(
                width: 150,
                height: 150,
                child: Image.asset("assets/image/logo.png"),
              ),
            ),
            SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                strokeWidth: 4,
                color: PatternColors.fluorescentBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
