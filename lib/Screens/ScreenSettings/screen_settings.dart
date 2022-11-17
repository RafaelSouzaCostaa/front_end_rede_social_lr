import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Colors/customized_colors_grobal.dart';
import '../../Components/comp_appBar.dart';
import '../../Components/comp_text_button.dart';

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({super.key});

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomizedColors.darkBackground,
      appBar: ComponentAppBar(hasDrawer: false),
      // backgroundColor: CustomizedColors.darkBackground,
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.transparent,
      //   child: Icon(Icons.person),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ComponentTextButton(
              text: "Alterar Nome",
              onPressed: () async {
                await Get.toNamed("/login");
              },
            ),
            ComponentTextButton(
              text: "Alterar Apelido",
              onPressed: () async {
                await Get.toNamed("/login");
              },
            ),
            ComponentTextButton(
              text: "Alterar Senha",
              onPressed: () async {
                await Get.toNamed("/login");
              },
            ),
            ComponentTextButton(
              text: "Alterar Email",
              onPressed: () async {
                await Get.toNamed("/login");
              },
            ),
            ComponentTextButton(
              text: "Sair",
              icon: Icons.logout,
              iconColor: Colors.red,
              textColor: Colors.red,
              onPressed: () async {
                //apagar token
                await Get.toNamed("/login");
              },
            ),
          ],
        ),
      ),
    );
  }
}
