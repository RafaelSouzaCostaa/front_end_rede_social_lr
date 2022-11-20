import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Colors/customized_colors_grobal.dart';
import '../../Colors/pattern_colors.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();

    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 1304), () {});
    Get.offAndToNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomizedColors.darkBackground,
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.9,
              child: SizedBox(
                width: 60,
                height: 60,
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
