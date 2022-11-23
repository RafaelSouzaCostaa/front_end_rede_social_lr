import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Colors/customized_colors_global.dart';
import '../../Global/profile_authenticated.dart';

class ScreenProfile extends StatefulWidget {
  const ScreenProfile({super.key});

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  ProfileAuthenticated profileAuthenticated = Get.put(ProfileAuthenticated());

  ScrollController scrollController = ScrollController();
  bool visible = false;
  double auxScroll = 0.0;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset > auxScroll) {
        auxScroll = scrollController.offset;
      }

      setState(() {
        if (auxScroll >= ((25 * 80) / 100)) {
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
    String? urlImageProfile = profileAuthenticated.profileAuthentic.value.image;
    String numberfollowing = profileAuthenticated
        .profileAuthentic.value.getLengthFollowingObjectId
        .toString();
    String numberFollowers = profileAuthenticated
        .profileAuthentic.value.getLengthFollowersObjectId
        .toString();
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                leading: visible
                    ? IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back),
                      )
                    : null,
                expandedHeight: 400,
                pinned: true,
                backgroundColor: CustomizedColors.darkBackground,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            //Background image
                            color: Colors.white,
                            height: Get.height * 0.175,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: Get.height * 0.11),
                            child: Center(
                              child: Container(
                                width: 110,
                                height: 110,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 3.2,
                                    color: CustomizedColors.darkBackground,
                                  ),
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: urlImageProfile != null
                                    ? CircleAvatar(
                                        backgroundColor:
                                            CustomizedColors.blueBackground,
                                        backgroundImage:
                                            NetworkImage(urlImageProfile))
                                    : CircleAvatar(
                                        backgroundColor:
                                            CustomizedColors.blueBackground,
                                        backgroundImage: const ExactAssetImage(
                                            "assets/image/perfil.png"),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          profileAuthenticated.profileAuthentic.value.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'Imprima-Regular',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "@${profileAuthenticated.profileAuthentic.value.nickname}",
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontFamily: 'Imprima-Regular',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          //FIX mudar para description quando implementar
                          profileAuthenticated.profileAuthentic.value.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Imprima-Regular',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 200,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Seguindo: $numberfollowing",
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Seguidores: $numberFollowers",
                              style: const TextStyle(color: Colors.white),
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
          body: const TabBarView(
            children: [
              Text(
                  "dagsdsdajsdgjsashdgdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsddgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsdagsdsdajsdgjsashdgaljshaljahsefesfeswfewsfewf"),
              Text("sdsd"),
            ],
          ),
        ),
      ),
    );
  }
}
