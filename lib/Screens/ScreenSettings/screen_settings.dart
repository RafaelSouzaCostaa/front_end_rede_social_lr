import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Colors/customized_colors_global.dart';
import '../../Components/comp_appBar.dart';
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
      appBar: ComponentAppBar(hasDrawer: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                ComponentTextButton(
                  text: "Alterar Nome",
                  onPressed: () async {
                    await Get.toNamed("/login");
                  },
                ),
                Text(
                  "@${profileAuthenticated.profileAuthentic.value.name}",
                ),
              ],
            ),
            Column(
              children: [
                ComponentTextButton(
                  text: "Alterar Apelido",
                  onPressed: () async {
                    await Get.toNamed("/login");
                  },
                ),
                Text(
                  "@${profileAuthenticated.profileAuthentic.value.nickname}",
                ),
              ],
            ),
            Column(
              children: [
                ComponentTextButton(
                  text: "Alterar Senha",
                  onPressed: () async {
                    await Get.toNamed("/login");
                  },
                ),
                Text(
                  "@${profileAuthenticated.profileAuthentic.value.password}",
                ),
              ],
            ),
            Column(
              children: [
                ComponentTextButton(
                  text: "Alterar Email",
                  onPressed: () async {
                    await Get.toNamed("/login");
                  },
                ),
                Text(
                  "@${profileAuthenticated.profileAuthentic.value.email}",
                ),
              ],
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
