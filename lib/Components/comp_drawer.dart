// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Colors/customized_colors_global.dart';
import '../Colors/themes.dart';
import '../Global/profile_authenticated.dart';
import '../Global/shared_preferences.dart';
import '../Global/token.dart';
import 'comp_text_button.dart';

class ComponentDrawer extends StatefulWidget {
  const ComponentDrawer({super.key});

  @override
  State<ComponentDrawer> createState() => _ComponentDrawerState();
}

class _ComponentDrawerState extends State<ComponentDrawer> {
  ProfileAuthenticated profileAuthenticated = Get.put(ProfileAuthenticated());
  InstanceSharedPreference sharedPreferences = InstanceSharedPreference();
  Themes theme = Get.put(Themes());
  Token token = Get.put(Token());

  bool themeSwitch = false;
  bool languageSwitch = false;

  @override
  Widget build(BuildContext context) {
    String? urlImageProfile = profileAuthenticated.profileAuthentic.value.image;
    String numberfollowing = profileAuthenticated
        .profileAuthentic.value.getLengthFollowingObjectId
        .toString();
    String numberFollowers = profileAuthenticated
        .profileAuthentic.value.getLengthFollowersObjectId
        .toString();

    return Drawer(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 5),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                width: 100,
                height: 100,
                child: urlImageProfile != null
                    ? CircleAvatar(
                        backgroundImage: MemoryImage(
                          Uint8List.fromList(
                            base64Decode(
                              urlImageProfile,
                            ),
                          ),
                        ),
                      )
                    : const CircleAvatar(
                        backgroundImage:
                            ExactAssetImage("assets/image/perfil.png"),
                      ),
              ),
              Text(
                profileAuthenticated.profileAuthentic.value.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Imprima-Regular',
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5, bottom: 22),
                child: Text(
                  "@${profileAuthenticated.profileAuthentic.value.nickname}",
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Imprima-Regular',
                      color: Colors.grey),
                ),
              ),
              Container(
                width: 180,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$numberfollowing ${'following'.tr}",
                    ),
                    Text(
                      "$numberFollowers ${'followers'.tr}",
                    )
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ],
          ),
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Column(children: [
              ComponentTextButton(
                text: 'profile'.tr,
                icon: Icons.person,
                spaceBetweenIconAndText: 5,
                onPressed: () {
                  Get.toNamed("/profile");
                },
              ),
              ComponentTextButton(
                text: 'theme'.tr,
                icon: Icons.brush,
                spaceBetweenIconAndText: 5,
                onPressed: () {
                  setState(() {
                    themeSwitch = !themeSwitch;
                  });
                },
              ),
              if (themeSwitch)
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      ComponentTextButton(
                        text: 'lightTheme'.tr,
                        icon: Icons.sunny,
                        textColor: Colors.yellowAccent.shade400,
                        iconColor: Colors.yellowAccent.shade400,
                        spaceBetweenIconAndText: 5,
                        onPressed: () {
                          theme.isLightTheme.value = true;
                          Get.changeThemeMode(ThemeMode.light);
                          sharedPreferences.saveThemeStatus();
                        },
                      ),
                      ComponentTextButton(
                        text: 'darkTheme'.tr,
                        icon: Icons.mode_night_sharp,
                        textColor: CustomizedColors.darkBlueText,
                        iconColor: CustomizedColors.darkBlueIcon,
                        spaceBetweenIconAndText: 5,
                        onPressed: () {
                          theme.isLightTheme.value = false;
                          Get.changeThemeMode(ThemeMode.dark);
                          sharedPreferences.saveThemeStatus();
                        },
                      ),
                    ],
                  ),
                ),
              ComponentTextButton(
                text: 'language'.tr,
                icon: Icons.public,
                spaceBetweenIconAndText: 7,
                onPressed: () {
                  setState(() {
                    languageSwitch = !languageSwitch;
                  });
                },
              ),
              if (languageSwitch)
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      ComponentTextButton(
                        text: 'en'.tr,
                        icon: Icons.flag,
                        textColor: Colors.blueAccent,
                        iconColor: Colors.blueAccent,
                        spaceBetweenIconAndText: 5,
                        onPressed: () {
                          Get.updateLocale(const Locale('en', 'US'));
                        },
                      ),
                      ComponentTextButton(
                        text: 'pt'.tr,
                        icon: Icons.flag,
                        textColor: Colors.greenAccent.shade400,
                        iconColor: Colors.greenAccent.shade400,
                        spaceBetweenIconAndText: 5,
                        onPressed: () {
                          Get.updateLocale(const Locale('pt', 'BR'));
                        },
                      ),
                      ComponentTextButton(
                        text: 'es'.tr,
                        icon: Icons.flag,
                        textColor: Colors.redAccent.shade200,
                        iconColor: Colors.redAccent.shade200,
                        spaceBetweenIconAndText: 5,
                        onPressed: () {
                          Get.updateLocale(const Locale('es', 'ES'));
                        },
                      ),
                    ],
                  ),
                ),
              ComponentTextButton(
                icon: Icons.logout,
                spaceBetweenIconAndText: 10,
                iconColor: Colors.red,
                textColor: Colors.red,
                text: 'logout'.tr,
                width: Get.width * 0.98,
                onPressed: () {
                  token.deleteToken();
                  sharedPreferences.saveTokenStatus();
                  Get.offAndToNamed("/login");
                },
              ),
            ]),
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 0.5,
        ),
      ]),
    );
  }
}
