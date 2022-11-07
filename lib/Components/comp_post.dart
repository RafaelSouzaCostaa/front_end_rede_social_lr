import 'package:flutter/material.dart';

import '../Colors/customized_colors_grobal.dart';

class ComponentPost extends StatefulWidget {
  // String perfilImage;
  // List<String> postImage = new List<String>.empty(growable: true);
  String? postText;
  String? postUserName;
  String? postNickName; //nojo
  int? numberOfLikes;
  int? numberOfReposts;
  int? numberOfComments;

  ComponentPost(
      {super.key,
      this.postText,
      this.postUserName,
      this.postNickName,
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
              CircleAvatar(
                radius: 10,
                backgroundColor: CustomizedColors.pinkBackground,
                //IMPLEMENTAR trocar foto pelo do perfil quando implementar
                child: const Icon(Icons.add_a_photo),
              ),
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '${widget.postUserName} ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CustomizedColors.lightText,
                          ),
                        ),
                        TextSpan(
                          text: '${widget.postNickName}',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: CustomizedColors.lightText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(),
                ],
              ),
            ],
          ),
          Row(),
        ],
      ),
    );
  }
}
