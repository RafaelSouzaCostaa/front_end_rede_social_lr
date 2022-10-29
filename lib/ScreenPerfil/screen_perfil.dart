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
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Center(
                  //ATENCAO modifiquei a ideia que tava daqui para baixo, botei uma borda ao inves de 2 circle avatar
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4, color: CustomizedColors.darkBackground),
                        borderRadius: BorderRadius.circular(60)),
                    child: const CircleAvatar(
                      backgroundImage:
                          ExactAssetImage("assets/image/perfil.jpg"),
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
                      "Matilde Alone", //NomePerfil
                      style: TextStyle(
                          color: CustomizedColors.lightText, fontSize: 20),
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
                    //const CompTabBar()
                  ],
                ),
              ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: 2,
              //     itemBuilder: (context, index) {
              //       return ComponentPost();
              //     },
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
