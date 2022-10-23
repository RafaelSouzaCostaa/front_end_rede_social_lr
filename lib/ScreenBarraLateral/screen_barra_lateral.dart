import 'package:flutter/material.dart';

import '../Colors/customized_colors_grobal.dart';

class ScreenBarraLateral extends StatefulWidget {
  const ScreenBarraLateral({super.key});

  @override
  State<ScreenBarraLateral> createState() => _ScreenBarraLateralState();
}

class _ScreenBarraLateralState extends State<ScreenBarraLateral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: const Color.fromARGB(255, 2, 29, 2),
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 25),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: const CircleAvatar(),
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
                    ],
                  ),
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
                      child: Row(
                        children: [
                          Icon(Icons.logout_outlined,
                              color: CustomizedColors.iconLogout),
                          const SizedBox(width: 10),
                          Text("LOGOUT",
                              style:
                                  TextStyle(color: CustomizedColors.lightText)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// Container(
//                 margin: const EdgeInsets.only(top: 40, bottom: 30),
//                 child: const SizedBox(
//                   height: 130,
//                   width: 130,
//                   child: CircleAvatar(),
//                 ),
//               ),
//               const Text(
//                 "Luiggi Rafaela, 45",
//                 style: TextStyle(fontSize: 30, fontFamily: 'Imprima-Regular'),
//               ),
//               const Text(
//                 "@placeHolder",
//                 style: TextStyle(fontSize: 18, fontFamily: 'Imprima-Regular'),
//               ),
//               Container(
//                 alignment: Alignment.bottomCenter,
//                 child: const Text("sdsd"),
//               ),