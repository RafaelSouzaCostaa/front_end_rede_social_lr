import 'package:flutter/material.dart';

import '../Colors/customized_colors_grobal.dart';

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
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: const Icon(
              Icons.add_a_photo,
              color: Colors.white,
            ),
          ),
          Text(
            "Luiggi Rafaela, 45",
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Imprima-Regular',
                color: CustomizedColors.lightText),
          ),
          Text(
            "@placeHolder",
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Imprima-Regular',
                color: CustomizedColors.lightText),
          ),
          Container(
            color: const Color.fromARGB(255, 41, 68, 39),
            height: MediaQuery.of(context).size.height * 0.60,
          ),
          Container(
            color: const Color.fromARGB(255, 2, 29, 2),
            height: MediaQuery.of(context).size.height * 0.10,
            child: Container(
              padding: const EdgeInsets.only(bottom: 30, left: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout_outlined,
                      color: CustomizedColors.iconLogout,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "LOGOUT",
                      style: TextStyle(color: CustomizedColors.lightText),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
