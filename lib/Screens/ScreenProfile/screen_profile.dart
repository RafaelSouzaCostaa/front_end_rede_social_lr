import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Colors/customized_colors_global.dart';
import '../../Components/comp_edit_button.dart';
import '../../Components/comp_post.dart';
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
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset > auxScroll) {
        auxScroll = scrollController.offset;
      }
      if (auxScroll >= 100) {
        auxScroll = 0.0;
        visible = true;
      } else {
        visible = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color themeColor = Theme.of(context).scaffoldBackgroundColor;
    String? urlImageProfile = profileAuthenticated.profileAuthentic.value.image;
    String numberfollowing = profileAuthenticated
        .profileAuthentic.value.getLengthFollowingObjectId
        .toString();
    String numberFollowers = profileAuthenticated
        .profileAuthentic.value.getLengthFollowersObjectId
        .toString();

    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            controller: scrollController,
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  leading: visible
                      ? IconButton(
                          onPressed: () {
                            Get.toNamed("/home");
                          },
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
                              color: Colors.yellow,
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
                                      color: themeColor, //aqiu
                                    ),
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: urlImageProfile != null
                                      ? CircleAvatar(
                                          backgroundColor:
                                              CustomizedColors.blueBackground,
                                          backgroundImage: MemoryImage(
                                            Uint8List.fromList(
                                              base64Decode(
                                                urlImageProfile,
                                              ),
                                            ),
                                          ),
                                        )
                                      : CircleAvatar(
                                          backgroundColor:
                                              CustomizedColors.blueBackground,
                                          backgroundImage:
                                              const ExactAssetImage(
                                            "assets/image/perfil.png",
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed("/setting");
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(
                                  top: Get.height * 0.19,
                                  right: 12,
                                ),
                                child: ComponentEditButton(
                                  icon: Icons.settings,
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
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, right: 15),
                          child: Text(
                            //FIX mudar para description quando implementar
                            profileAuthenticated
                                .profileAuthentic.value.description
                                .toString(),
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: 'Imprima-Regular',
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "$numberfollowing ${'following'.tr}",
                              ),
                              Text(
                                "$numberFollowers ${'followers'.tr}",
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
                FutureBuilder(
                  future: ApiService.getAllPostsByProfileId(),
                  builder: ((context, posts) {
                    return ListView.builder(
                      cacheExtent: Get.height * 5,
                      itemCount: posts.data == null ? 0 : posts.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ComponentPost(
                          postUsername:
                              posts.data!.elementAt(index).name.toString(),
                          postNickname:
                              "@${posts.data?.elementAt(index).nickname}",
                          postDescription:
                              posts.data!.elementAt(index).description,
                          postImage: posts.data!.elementAt(index).postMedia,
                          numberOfReposts:
                              posts.data!.elementAt(index).numberOfReposts,
                          numberOfLikes:
                              posts.data!.elementAt(index).numberOfLikes,
                          numberOfComments:
                              posts.data!.elementAt(index).numberOfComments,
                          image: posts.data!.elementAt(index).image,
                          postObjectId: posts.data!.elementAt(index).id,
                        );
                      },
                    );
                  }),
                ),
                const Text("sdsd"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
