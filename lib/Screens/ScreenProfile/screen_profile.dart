import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Colors/customized_colors_global.dart';
import '../../Global/api_service.dart';
import '../../Global/profile_authenticated.dart';
import '../../Models/model_post.dart';

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

  List<Post> auxPost = List.empty(growable: true);

  @override
  initState() {
    getMyPosts() async {
      auxPost = await ApiService.getAllPostsByProfileId();
    }

    getMyPosts();

    scrollController.addListener(() {
      if (scrollController.offset > auxScroll) {
        auxScroll = scrollController.offset;
      }

      setState(() {
        if (auxScroll >= 100) {
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

    double width = MediaQuery.of(context).size.width;
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
                            color: Colors.black,
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
                            color: Colors.grey,
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
                          profileAuthenticated
                              .profileAuthentic.value.description
                              .toString(),
                          style: const TextStyle(
                            color: Colors.grey,
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
                              "$numberfollowing ${'following'.tr}",
                              style: const TextStyle(color: Colors.black),
                            ),
                            Text(
                              "$numberFollowers ${'followers'.tr}",
                              style: const TextStyle(color: Colors.black),
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
                  tabs: [
                    Tab(text: 'posts'.tr),
                    Tab(text: 'likes'.tr),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: auxPost.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      SizedBox(
                        width: width * 0.90,
                        child: Image.network(auxPost[index].postMedia[0]),
                      ),
                      Text(
                        auxPost[index].description,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      const SizedBox(height: 20)
                    ],
                  );
                },
              ),
              const Text("sdsd"),
            ],
          ),
        ),
      ),
    );
  }
}
