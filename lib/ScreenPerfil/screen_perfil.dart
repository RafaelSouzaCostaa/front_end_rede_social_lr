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
          Container(
              child: Column(
            children: [
              Row(
                //Posts e Curtidas
                children: [],
              ),
              Column(
                children: [
                  ListView(
                    children: [
                      ComponentPost(),
                    ],
                  )
                ],
              )
            ],
          )),
        ],
      ),
    );
  }
}
