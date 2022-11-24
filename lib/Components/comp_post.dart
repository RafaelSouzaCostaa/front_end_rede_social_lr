// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../Colors/customized_colors_global.dart';

class ComponentPost extends StatefulWidget {
  // String perfilImage;
  // List<String> postImage = new List<String>.empty(growable: true);
  String? postText;
  String? postUsername;
  String? postNickname; //nojo
  int? numberOfLikes;
  int? numberOfReposts;
  int? numberOfComments;

  ComponentPost(
      {super.key,
      this.postText,
      this.postUsername,
      this.postNickname,
      this.numberOfLikes,
      this.numberOfReposts,
      this.numberOfComments});

  @override
  State<ComponentPost> createState() => _ComponentPostState();
}

class _ComponentPostState extends State<ComponentPost> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 25, right: 15),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: CustomizedColors.blueBackground,
                      //IMPLEMENTAR trocar foto pelo do perfil quando implementar
                      child: const Icon(
                        Icons.add_a_photo,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    //Nome Nickname e opções
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: "Ablueblue",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Imprima-Regular',
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: ' @iojfsdhfsd',
                              style: TextStyle(
                                fontSize: 16,
                                color: CustomizedColors.greyText,
                                fontFamily: 'Imprima-Regular',
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Container(), //imagens do Post
                  const Divider(
                    color: Colors.white30,
                    thickness: 0.5,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
