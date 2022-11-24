import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Colors/customized_colors_global.dart';
import '../../Components/comp_app_bar.dart';
import '../../Components/comp_text_button.dart';
import '../../Global/profile_authenticated.dart';

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({super.key});

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  @override
  Widget build(BuildContext context) {
    ProfileAuthenticated profileAuthenticated = Get.put(ProfileAuthenticated());

    return Scaffold(
      backgroundColor: CustomizedColors.darkBackground,
      appBar: ComponentAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                ComponentTextButton(
                  text: "Alterar Nome",
                  icon: Icons.person,
                  onPressed: () async {
                    await Get.toNamed("/login");
                  },
                ),
                Container(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        profileAuthenticated.profileAuthentic.value.name,
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Column(
              children: [
                ComponentTextButton(
                  icon: Icons.alternate_email,
                  text: "Alterar Apelido",
                  onPressed: () async {
                    await Get.toNamed("/login");
                  },
                ),
                Container(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "@${profileAuthenticated.profileAuthentic.value.nickname}",
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Column(
              children: [
                ComponentTextButton(
                  icon: Icons.mail,
                  text: "Alterar Email",
                  onPressed: () async {
                    await Get.toNamed("/login");
                  },
                ),
                Container(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        profileAuthenticated.profileAuthentic.value.email,
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Column(
              children: [
                ComponentTextButton(
                  icon: Icons.key,
                  text: "Alterar Senha",
                  onPressed: () async {
                    await Get.toNamed("/login");
                  },
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            ComponentTextButton(
              text: "Sair",
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
      ),
    );
  }
}
