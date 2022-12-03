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
          builder: (context, postList) {
            return ListView.builder(
              itemCount:postList.data!.length,// postList.data == null ? 0 :  (RAFAEL aqui não precisava disso, pq se for null ele ja pega 0)
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        ComponentPost(
                          postUsername:
                              postList.data!.elementAt(index).name.toString(),
                          postNickname:
                              "@${postList.data!.elementAt(index).nickname}",
                          postDescription:
                              postList.data!.elementAt(index).description,
                          postImage: [
                            postList.data!.elementAt(index).postMedia[0]
                          ],
                          //LUIGGI  postList.data!.elementAt(index).postMedia[0] isso e as midias postadas, ta pegando a posição 0, tem que fazer um for dentro do componente
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
