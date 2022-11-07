import 'package:flutter/material.dart';
import 'package:rede_social_lr/Colors/customized_colors_grobal.dart';
import 'package:rede_social_lr/Components/comp_appBar.dart';
import 'package:rede_social_lr/Components/comp_text_button.dart';

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
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
            ),
            ComponentTextButton(
              text: "Alterar Apelido",
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
            ),
            ComponentTextButton(
              text: "Alterar Senha",
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
            ),
            ComponentTextButton(
              text: "Alterar Email",
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
            ),
            ComponentTextButton(
              text: "Sair",
              icon: Icons.logout,
              iconColor: Colors.red,
              textColor: Colors.red,
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
            ),
          ],
        ),
      ),
    );
  }
}
