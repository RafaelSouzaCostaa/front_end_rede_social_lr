import 'package:flutter/material.dart';
import 'package:rede_social_lr/Global/api_service.dart';

import '../../Colors/customized_colors_grobal.dart';
import '../../Components/comp_appBar.dart';
import '../../Components/comp_drawer.dart';
import '../../Components/comp_ftbutton_post.dart';
import '../../Models/model_post.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<Post> postsFollow = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    carregarPosts() async {
      postsFollow = await ApiService.getAllPostByFollow();
      setState(() {});
    }

    carregarPosts();

    return SafeArea(
      child: Scaffold(
        floatingActionButton: const ComponentFloatingButtonPost(),
        backgroundColor: CustomizedColors.darkBackground,
        drawer: const ComponentDrawer(),
        appBar: ComponentAppBar(hasDrawer: false),
        body: ListView.builder(
          itemCount: postsFollow.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  width: width * 0.90,
                  child: Image.network(postsFollow[index].postMedia[0]),
                ),
                Text(
                  postsFollow[index].description,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20)
              ],
            );
          },
        ),
      ),
    );
  }
}
