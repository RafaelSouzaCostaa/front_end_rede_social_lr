import 'package:flutter/material.dart';

import '../Colors/customized_colors_grobal.dart';
import '../Components/comp_appBar.dart';
import '../Components/comp_post.dart';

class ScreenPerfil extends StatefulWidget {
  const ScreenPerfil({Key? key}) : super(key: key);

  @override
  State<ScreenPerfil> createState() => _ScreenPerfilState();
}

class _ScreenPerfilState extends State<ScreenPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ComponentAppBar(
          hasDrawer: false,
        ),
      ),
      backgroundColor: CustomizedColors.darkBackground,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                //Background image
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.24,
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.19),
                child: Center(
                  child: CircleAvatar(
                    radius: 43.5,
                    backgroundColor: CustomizedColors.darkBackground,
                    child: CircleAvatar(
                      radius: 41,
                      //CustomizedColors.darkBackground,
                      backgroundColor: Colors.white10,
                      child: Icon(
                        Icons.add_a_photo,
                        size: 20,
                        color: CustomizedColors.iconsBlue,
                      ),
                      //ATENCAO Imagem de Perfil (image == null ? : ,)
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: Column(children: [
                  Center(
                    child: Text(
                      "PlaceHolder Nome", //NomePerfil
                      style: TextStyle(color: CustomizedColors.lightText),
                    ),
                  ),
                  Center(
                    child: Text(
                      "@Placeholder", //NomePerfil
                      style: TextStyle(color: CustomizedColors.lightText),
                    ),
                  ),
                ]),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  //Posts e Curtidas
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Center(
                        child: Text(
                          "Postagens",
                          style: TextStyle(color: CustomizedColors.lightText),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Center(
                        child: Text(
                          "Curtidas",
                          style: TextStyle(color: CustomizedColors.lightText),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [],
              )
            ],
          ),
        ],
      ),
    );
  }
}
