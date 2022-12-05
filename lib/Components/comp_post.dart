// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rede_social_lr/Components/comp_icon_text.dart';
import 'package:rede_social_lr/Components/comp_text.dart';

import '../Colors/customized_colors_global.dart';
import '../Global/api_service.dart';

class ComponentPost extends StatefulWidget {
  // String perfilImage;
  List<dynamic>? postImage = List<dynamic>.empty(growable: true);
  String? profileObjectId;
  String? postObjectId;
  String? postDescription;
  String? postUsername;
  String? postNickname;
  int? numberOfLikes;
  int? numberOfReposts;
  int? numberOfComments;
  String? image;

  ComponentPost(
      {super.key,
      required this.postDescription,
      required this.postUsername,
      required this.postNickname,
      this.numberOfLikes,
      this.numberOfReposts,
      this.numberOfComments,
      this.postImage,
      this.image,
      this.profileObjectId,
      this.postObjectId});

  @override
  State<ComponentPost> createState() => _ComponentPostState();
}

class _ComponentPostState extends State<ComponentPost> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 1.0,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: widget.image != null
                    ? CircleAvatar(
                        backgroundColor: CustomizedColors.blueBackground,
                        backgroundImage: NetworkImage(widget.image.toString()))
                    : CircleAvatar(
                        backgroundColor: CustomizedColors.blueBackground,
                        backgroundImage:
                            const ExactAssetImage("assets/image/perfil.png"),
                      ),
              ),
              Flexible(
                child: Row(
                  //Nome Nickname e opções
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ComponentText(
                          fontSize: 18.0,
                          text: widget.postUsername,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: ComponentText(
                              fontSize: 14.0,
                              text: widget.postNickname,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
          //Uma imagem
          SizedBox(
            width: Get.width * 0.8,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 10),
                    child: Text(widget.postDescription!),
                  ),
                  if (widget.postImage?.length == 1)
                    Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              minHeight: Get.height * 0.05,
                              maxHeight: Get.height *
                                  0.5), //LUIGGI Altura da img de postagens
                          child: Image.network(widget.postImage!.elementAt(0)),
                        )
                      ],
                    ),
                  //Duas imagens
                  if (widget.postImage?.length == 2)
                    //RAFAEL //IMPLEMENTAR o modelo relogio aqui para testar, tem no catalogo do flutter
                    Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              minHeight: Get.height * 0.05,
                              maxHeight: Get.height *
                                  0.5), //LUIGGI Altura da img de postagens
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                    width: Get.width * 0.5,
                                    child: Image.network(
                                        widget.postImage!.elementAt(1))),
                                SizedBox(
                                    width: Get.width * 0.5,
                                    child: Image.network(
                                        widget.postImage!.elementAt(0))),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                  //Três imagens
                  //LUIGGI FAZER 3 e 4
                  if (widget.postImage?.length == 3)
                    SizedBox(
                      width: Get.width * 0.8,
                      height: 300,
                    ),
                  //Quatro imagens
                  if (widget.postImage?.length == 4)
                    SizedBox(
                      width: Get.width * 0.8,
                      height: 300,
                    ),
                ],
              ),
            ),
          ),
          Container(
            width: Get.width * 0.5,
            padding: const EdgeInsets.only(top: 10),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ComponentIconText(
                  icon: Icons.chat_bubble_outline,
                  text: widget.numberOfComments
                      .toString(), //RAFAEL colocar o numero de likes e etc aqui dps
                  iconActiveColor: CustomizedColors.greenIcon,
                  textActiveColor: CustomizedColors.greenText,
                ),
                ComponentIconText(
                  icon: Icons.change_circle_outlined,
                  text: "545", //IMPLEMENTAR
                  iconActiveColor: CustomizedColors.yellowIcon,
                  textActiveColor: CustomizedColors.yellowText,
                ),
                ComponentIconText(
                  icon: Icons.star_border,
                  text: widget.numberOfLikes.toString(),
                  iconActiveColor: CustomizedColors.blueIcon,
                  textActiveColor: CustomizedColors.blueText,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Divider(
            color: CustomizedColors.blueBackground,
            height: 4,
            thickness: 0.5,
          )
        ],
      ),
    );
  }
}
