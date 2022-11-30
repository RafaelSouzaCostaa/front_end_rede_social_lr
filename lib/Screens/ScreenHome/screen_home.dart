import 'package:flutter/material.dart';

import '../../Colors/customized_colors_global.dart';
import '../../Components/comp_app_bar.dart';
import '../../Components/comp_drawer.dart';
import '../../Components/comp_ftbutton_post.dart';
import '../../Global/api_service.dart';
import '../../Models/model_post.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<Post> postsFollow = List.empty(growable: true);

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    buscarPosts() async {
      postsFollow = await ApiService.getAllPostByFollow();
      setState(() {});
    }

    buscarPosts();

    return SafeArea(
      child: Scaffold(
        floatingActionButton: const ComponentFloatingButtonPost(),
        drawer: const ComponentDrawer(),
        appBar: const ComponentAppBar(),
        body: ListView.builder(
          itemCount: postsFollow.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Row(children: [
                  const SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                      backgroundColor: CustomizedColors.blueText,
                      child: const Icon(Icons.add_a_photo)),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(postsFollow[index].nameProfile.toString()),
                  const SizedBox(
                    width: 20,
                  ),
                  Text("@${postsFollow[index].nickname}"),
                ]),
                SizedBox(
                  width: width * 0.90,
                  child: Image.network(postsFollow[index].postMedia[0]),
                ),
                Text(
                  postsFollow[index].description,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20)
              ],
            );
          },
        ),
      ),
    );
  }
}
