import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Colors/customized_colors_global.dart';
import '../../Components/comp_app_bar.dart';
import '../../Components/comp_drawer.dart';
import '../../Components/comp_text_button.dart';
import '../../Components/comp_textsub_button.dart';
import '../../Global/profile_authenticated.dart';

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({super.key});

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  ProfileAuthenticated profileAuthenticated = Get.put(ProfileAuthenticated());

  @override
  Widget build(BuildContext context) {
    String? urlImageProfile = profileAuthenticated.profileAuthentic.value.image;
    Color themeColor = Theme.of(context).scaffoldBackgroundColor;
    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerNickname = TextEditingController();
    TextEditingController controllerEmail = TextEditingController();

    return SafeArea(
      child: Scaffold(
        drawer: const ComponentDrawer(),
        appBar: const ComponentAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    //Background image
                    color: Colors.yellow,
                    height: Get.height * 0.175,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: Get.height * 0.11),
                    child: Center(
                      child: Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3.2,
                            color: themeColor,
                          ),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: urlImageProfile != null
                            ? CircleAvatar(
                                backgroundColor:
                                    CustomizedColors.blueBackground,
                                backgroundImage: NetworkImage(urlImageProfile))
                            : CircleAvatar(
                                backgroundColor:
                                    CustomizedColors.blueBackground,
                                backgroundImage: const ExactAssetImage(
                                    "assets/image/perfil.png"),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  ComponentTextButtonWithSubtext(
                    text: "${'change'.tr} ${'name'.tr}",
                    icon: Icons.person,
                    subText: 'profileAuthenticated.profileAuthentic.value.name',
                    inputCotroller: controllerName,
                    onPressed: () async {
                      await Get.toNamed("/login");
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  ComponentTextButtonWithSubtext(
                    icon: Icons.alternate_email,
                    text: "${'change'.tr} ${'nickname'.tr}",
                    inputCotroller: controllerNickname,
                    subText:
                        "profileAuthenticated.profileAuthentic.value.nickname}",
                    onPressed: () async {
                      await Get.toNamed("/login");
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  ComponentTextButtonWithSubtext(
                    icon: Icons.mail,
                    text: "${'change'.tr} Email",
                    inputCotroller: controllerEmail,
                    inputHintText: 'rafaelsafadinha69@estudante.edu.br',
                    subText:
                        'profileAuthenticated.profileAuthentic.value.email',
                    onPressed: () async {
                      await Get.toNamed("/login");
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  ComponentTextButton(
                    icon: Icons.key,
                    text: "${'change'.tr} ${'password'.tr}",
                    onPressed: () async {
                      await Get.toNamed("/login");
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  ComponentTextButton(
                    text: 'logout'.tr,
                    icon: Icons.logout,
                    iconColor: Colors.red,
                    textColor: Colors.red,
                    onPressed: () async {
                      //apagar token
                      Get.offAllNamed('/login');
                    },
                  ),
                ],
              ),
              //input
            ],
          ),
        ),
      ),
    );
  }
}
