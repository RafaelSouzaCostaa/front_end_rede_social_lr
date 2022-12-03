import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rede_social_lr/Components/comp_app_bar.dart';
import 'package:rede_social_lr/Components/comp_post.dart';

class Testes extends StatefulWidget {
  const Testes({super.key});

  @override
  State<Testes> createState() => _TestesState();
}

class _TestesState extends State<Testes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ComponentAppBar(),
        body: ComponentPost(
          postDescription: "postDescription",
          postUsername: "postUsername",
          postNickname: "postNickname",
          postImage: ["a", "a"],
        ),
      ),
    );
  }
}
