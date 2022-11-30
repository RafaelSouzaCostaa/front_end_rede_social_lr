import 'package:flutter/material.dart';

import '../../Components/comp_app_bar.dart';
import '../../Components/comp_drawer.dart';
import '../../Components/comp_ftbutton_post.dart';
import '../../Components/comp_post.dart';
import '../../Global/api_service.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: const ComponentFloatingButtonPost(),
        drawer: const ComponentDrawer(),
        appBar: const ComponentAppBar(),
        body: FutureBuilder(
          future: ApiService.getAllPostByFollow(),
          builder: (context, listPost) {
            return ListView.builder(
              itemCount: listPost.data == null ? 0 : listPost.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        ComponentPost(
                          postUsername:
                              listPost.data!.elementAt(index).name.toString(),
                          postNickname:
                              "@${listPost.data!.elementAt(index).nickname}",
                          postDescription:
                              listPost.data!.elementAt(index).description,
                        )
                      ],
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
