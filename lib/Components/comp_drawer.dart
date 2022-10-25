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
          Container(
            color: Colors.white10,
            height: MediaQuery.of(context).size.height * 0.73,
          ),
          Container(
            // color: const Color.fromARGB(255, 2, 29, 2),
            height: MediaQuery.of(context).size.height * 0.07,
            child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.logout_outlined,
                      color: CustomizedColors.iconLogout,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 15, left: 10),
                      child: Text(
                        "LOGOUT",
                        style: TextStyle(color: CustomizedColors.lightText),
                      ),
                    ),
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
