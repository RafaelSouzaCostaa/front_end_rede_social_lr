import 'package:flutter/material.dart';

import '../Colors/customized_colors_grobal.dart';
import '../Components/comp_appBar.dart';

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
                height: MediaQuery.of(context).size.height * 0.14,
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.08),
                child: Center(
                  //ATENCAO modifiquei a ideia que tava daqui para baixo, botei uma borda ao inves de 2 circle avatar
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 3.2, color: CustomizedColors.darkBackground),
                        borderRadius: BorderRadius.circular(60)),
                    child: const CircleAvatar(
                      backgroundImage:
                          ExactAssetImage("assets/image/perfil.jpg"),
                      //ATENCAO Imagem de Perfil (image == null ? : ,);
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
                  const Center(
                    child: Text(
                      "Matilde Alone", //NomePerfil
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    child: const Center(
                      child: Text(
                        "@Placeholder", //NomePerfil
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
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
                children: [
                  // ListView(
                  //   children: [
                  //     ComponentPost(),
                  //   ],
                  // )
                  Row()
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
