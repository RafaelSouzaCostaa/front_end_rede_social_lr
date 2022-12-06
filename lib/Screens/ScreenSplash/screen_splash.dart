import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Colors/pattern_colors.dart';
import '../../Global/profile_authenticated.dart';
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
    sharedPreferences.getThemeStatus();
    sharedPreferences.getToken();
    _navigateToHome();
    super.initState();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 1304), () {});

    //RAFAEL quando iniciar verificar o token e ir pra home
    if (sharedPreferences.getToken() == "") {
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
