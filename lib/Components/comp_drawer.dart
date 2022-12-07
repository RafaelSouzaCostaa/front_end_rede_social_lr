// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Colors/customized_colors_global.dart';
import '../Global/profile_authenticated.dart';
import 'comp_text_button.dart';

class ComponentDrawer extends StatefulWidget {
  const ComponentDrawer({super.key});

  @override
  State<ComponentDrawer> createState() => _ComponentDrawerState();
}

class _ComponentDrawerState extends State<ComponentDrawer> {
  ProfileAuthenticated profileAuthenticated = Get.put(ProfileAuthenticated());
  bool themeSwitch = false;

  @override
  Widget build(BuildContext context) {
    String? urlImageProfile = profileAuthenticated.profileAuthentic.value.image;
    return Drawer(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 5),
          child: Column(children: [
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
              "profileAuthenticated.profileAuthentic.value.name",
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Imprima-Regular',
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 22),
              child: Text(
                "@\${profileAuthenticated.profileAuthentic.value.nickname}",
                style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Imprima-Regular',
                    color: Colors.grey),
              ),
            ),
            const Divider(
              color: Colors.white30,
              thickness: 0.5,
            ),
          ]),
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Column(children: [
              ComponentTextButton(
                text: 'profile'.tr,
                icon: Icons.person,
                mainAxisAlignment: MainAxisAlignment.start,
                onPressed: () {
                  Get.toNamed("/profile");
                },
              ),
              ComponentTextButton(
                text: 'theme'.tr,
                icon: Icons.person,
                mainAxisAlignment: MainAxisAlignment.start,
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
                        icon: Icons.person,
                        mainAxisAlignment: MainAxisAlignment.start,
                        onPressed: () {},
                      ),
                      ComponentTextButton(
                        text: 'darkTheme'.tr,
                        icon: Icons.person,
                        mainAxisAlignment: MainAxisAlignment.start,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
            ]),
          ),
        ),
        const Divider(
          color: Colors.white30,
          thickness: 0.5,
        ),
        const Divider(
          color: Colors.white30,
          thickness: 0.5,
        ),

        Container(
          alignment: Alignment.centerRight,
          width: 50,
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: ComponentTextButton(
            onPressed: () {
              Get.toNamed('/setting');
            },
            icon: Icons.settings,
            iconColor: CustomizedColors.lightGreyIcon,
            textColor: CustomizedColors.blueText,
            hoverAnimation: false,
          ),
        ),
        // Expanded(
      ]),
    );
  }
}
