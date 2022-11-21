// ignore_for_file: unnecessary_null_comparison

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

  @override
  Widget build(BuildContext context) {
    String? urlImageProfile = profileAuthenticated.profileAuthentic.value.image;
    return Drawer(
      backgroundColor: CustomizedColors.darkBackground,
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 5),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              width: 100,
              height: 100,
              child: urlImageProfile != null
                  ? CircleAvatar(backgroundImage: NetworkImage(urlImageProfile))
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
                  color: Colors.white),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 22),
              child: Text(
                //ATENCAO descomentar posteriormente
                "@${profileAuthenticated.profileAuthentic.value.nickname}",
                style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Imprima-Regular',
                    color: Colors.white70),
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
                text: "Perfil",
                icon: Icons.person,
                mainAxisAlignment: MainAxisAlignment.start,
                onPressed: () {
                  Get.toNamed("/profile");
                },
              ),
            ]),
          ),
        ),
        const Divider(
          color: Colors.white30,
          thickness: 0.5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
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
          ],
        ),
        // Expanded(
      ]),
    );
  }
}
