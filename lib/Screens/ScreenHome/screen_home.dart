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
                          Text(listPost.data!
                              .elementAt(index)
                              .nameProfile
                              .toString()),
                          const SizedBox(
                            width: 20,
                          ),
                          Text("@${listPost.data!.elementAt(index).nickname}"),
                        ]),
                        SizedBox(
                          width: width * 0.90,
                          child: Image.network(
                              listPost.data!.elementAt(index).postMedia[0]),
                        ),
                        Text(
                          listPost.data!.elementAt(index).description,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 20)
                      ],
                    );
                  },
                );
              })),
    );
  }
}
