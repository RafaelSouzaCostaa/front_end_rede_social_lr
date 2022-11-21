import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rede_social_lr/Colors/customized_colors_global.dart';

class Testes extends StatefulWidget {
  const Testes({super.key});

  @override
  State<Testes> createState() => _TestesState();
}

class _TestesState extends State<Testes> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                expandedHeight: 380,
                pinned: true,
                backgroundColor: CustomizedColors.darkBackground,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            //Background image
                            color: Colors.white,
                            height: Get.height * 0.20,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.11),
                            child: Center(
                              child: Container(
                                width: 110,
                                height: 110,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3.2,
                                        color: CustomizedColors.darkBackground),
                                    borderRadius: BorderRadius.circular(60)),
                                child: CircleAvatar(
                                  backgroundColor: CustomizedColors.blueText,
                                  backgroundImage: const AssetImage(
                                      "assets/image/profile.png"),
                                  //ATENCAO Imagem de Profile (image == null ? : ,);
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: const Text(
                          "Nome",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "@Nickname",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 15),
                        child: const Text(
                          "Descriçãojdfaskjdghsakjdgakshdglhafghasdfjshdhjsadklhsafdhgashdgsahdgsadgalsgdjsadsadsagdlhsagjdasdsadasdsajdfsjdgsdgsagjadgasdsagdgsajdgsjdgsjdgsjgdjsagdjsg",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 200,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
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
                bottom: TabBar(
                  indicatorColor: CustomizedColors.blueBackground,
                  labelColor: CustomizedColors.blueBackground,
                  unselectedLabelColor: CustomizedColors.greyText,
                  tabs: const [
                    Tab(text: "Postagens"),
                    Tab(text: "Curtidas"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Text(
                  "dagsdsdajsdgjsashdgdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahs"),
              Text("dsjjsa")
            ],
          ),
        ),
      ),
    );
  }
}
