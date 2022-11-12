import 'package:flutter/material.dart';

import '../../Colors/customized_colors_grobal.dart';
import '../../Components/comp_tab.dart';

class ScreenPerfil extends StatefulWidget {
  const ScreenPerfil({Key? key}) : super(key: key);

  @override
  State<ScreenPerfil> createState() => _ScreenPerfilState();
}

class _ScreenPerfilState extends State<ScreenPerfil> {
  ScrollController scrollController = ScrollController();
  bool visible = false;
  double auxScroll = 0.0;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset > auxScroll) {
        auxScroll = scrollController.offset;
      }

      setState(() {
        if (auxScroll >= 240.00) {
          auxScroll = 0.0;
          visible = true;
        } else {
          visible = false;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomizedColors.darkBackground,
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor: CustomizedColors.darkBackground,
              pinned: true,
              expandedHeight: 300,
              leading: visible
                  ? Text("ssds", style: TextStyle(color: Colors.amber))
                  : null,
              title: visible
                  ? Text("data", style: TextStyle(color: Colors.amber))
                  : null,
              actions: visible
                  ? [Text("action", style: TextStyle(color: Colors.amber))]
                  : null,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          //Background image
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height * 0.20,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.075),
                          child: Center(
                            //ATENCAO modifiquei a ideia que tava daqui para baixo, botei uma borda ao inves de 2 circle avatar
                            child: Container(
                              width: 110,
                              height: 110,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 3.2,
                                      color: CustomizedColors.darkBackground),
                                  borderRadius: BorderRadius.circular(60)),
                              child: CircleAvatar(
                                backgroundColor: CustomizedColors.linkInText,
                                backgroundImage:
                                    const AssetImage("assets/image/perfil.png"),
                                //ATENCAO Imagem de Perfil (image == null ? : ,);
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Nome",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "Nickname",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Descrição akjdfaskjdghsakjdgakshdglhafghasdfjshdhjsad" +
                          "klhsafdhgashdgsahdgsadgalsgdjsadsadsagdlhsagjd",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      color: Colors.pink,
                      width: screenWidth * 0.15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "X Seguindo",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "X Seguidores",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                ComponentTab(
                  height: 0.56,
                  width: 1,
                  indicatorColor: CustomizedColors.blueBackground,
                  labelColor: CustomizedColors.blueBackground,
                  unselectedLabelColor: CustomizedColors.lightText,
                  tabsName: const [
                    Text("Postagens"),
                    Text("Curtidas"),
                  ],
                  tabs: [
                    Tab(
                      child: Container(color: Colors.transparent),
                    ),
                    Tab(
                      child: Container(color: Colors.transparent),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
