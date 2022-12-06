import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../Colors/customized_colors_global.dart';

class ComponentFloatingButtonPost extends StatefulWidget {
  const ComponentFloatingButtonPost({super.key});

  @override
  State<ComponentFloatingButtonPost> createState() =>
      _ComponentFloatingButtonPostState();
}

class _ComponentFloatingButtonPostState
    extends State<ComponentFloatingButtonPost> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.toNamed('/createPost');
      },
      backgroundColor: CustomizedColors.blueBackground,
      child: const Icon(
        Icons.add,
        color: Colors.black,
      ),
    );
  }
}
