import 'package:flutter/material.dart';

import '../Colors/customized_colors_grobal.dart';
import 'comp_text_button.dart';

class ComponentDrawer extends StatefulWidget {
  const ComponentDrawer({super.key});

  @override
  State<ComponentDrawer> createState() => _ComponentDrawerState();
}

class _ComponentDrawerState extends State<ComponentDrawer> {
  @override
  Widget build(BuildContext context) {
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
              child: const CircleAvatar(
                backgroundImage: ExactAssetImage("assets/image/perfil.png"),
              ),
            ),
            const Text(
              "Nome do Usuario",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Imprima-Regular',
                  color: Colors.white),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 22),
              child: const Text(
                "@nickname",
                style: TextStyle(
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
                  Navigator.pushNamed(context, "/profile");
                },
              ),
            ]),
          ),
        ),
        const Divider(
          color: Colors.white30,
          thickness: 0.5,
        ),
        Container(
          padding: const EdgeInsets.only(top: 1, bottom: 1),
          child: ComponentTextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/setting");
            },
            text: "",
            icon: Icons.settings,
            iconColor: CustomizedColors.icons,
            textColor: CustomizedColors.lightText,
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ),
        // Expanded(
      ]),
    );
  }
}
