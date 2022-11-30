import 'package:flutter/material.dart';

import '../../Colors/customized_colors_global.dart';
import '../../Components/comp_app_bar.dart';
import '../../Components/comp_drawer.dart';
import '../../Components/comp_ftbutton_post.dart';
import '../../Components/comp_post.dart';
import '../../Global/api_service.dart';
import '../../Models/model_post.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<Post> followingUsersPosts = List.empty(growable: true);

  @override
  initState() {
    super.initState();
    buscarPosts();
  }

  buscarPosts() async {
    followingUsersPosts = await ApiService.getAllPostByFollow();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: const ComponentFloatingButtonPost(),
        drawer: const ComponentDrawer(),
        appBar: const ComponentAppBar(),
        body: ListView.builder(
          itemCount: followingUsersPosts.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ComponentPost(
                  postUsername: followingUsersPosts[index].name,
                  postNickname: followingUsersPosts[index].nickname,
                  postDescription: followingUsersPosts[index].description,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
