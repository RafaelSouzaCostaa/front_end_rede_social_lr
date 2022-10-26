import 'package:flutter/material.dart';

import '../Colors/customized_colors_grobal.dart';
import 'comp_textButton.dart';

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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: const Icon(
                Icons.add_a_photo,
                color: Colors.white,
                size: 30,
              ),
            ),
            Container(
              child: const Text(
                "Luiggi Rafaela",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Imprima-Regular',
                    color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 22),
              child: const Text(
                "@placeHolder",
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
            Container(
              //Container Geral
              height: MediaQuery.of(context).size.height * 0.77,
              child: Column(
                children: [
                  Container(
                    //Container sem o Logout, pra ele ficar no fim da lista
                    height: MediaQuery.of(context).size.height * 0.71,
                    child: Column(
                      children: [
                        ComponentTextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/perfil");
                          },
                          text: "PERFIL",
                          icon: Icons.person,
                          iconColor: CustomizedColors.iconLogout,
                          textColor: CustomizedColors.lightText,
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ],
                    ),
                  ),
                  ComponentTextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    text: "LOGOUT",
                    icon: Icons.logout_outlined,
                    iconColor: CustomizedColors.iconLogout,
                    textColor: CustomizedColors.lightText,
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
