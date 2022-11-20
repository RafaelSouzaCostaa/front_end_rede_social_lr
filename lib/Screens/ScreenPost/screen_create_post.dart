import 'package:flutter/material.dart';
import 'package:rede_social_lr/Components/comp_input.dart';

import '../../Colors/customized_colors_grobal.dart';
import '../../Components/comp_appBar.dart';

class ScreenCreatePost extends StatefulWidget {
  const ScreenCreatePost({super.key});

  @override
  State<ScreenCreatePost> createState() => _ScreenCreatePostState();
}

class _ScreenCreatePostState extends State<ScreenCreatePost> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomizedColors.darkBackground,
      appBar: ComponentAppBar(hasDrawer: false),
      body: Center(
        child: Column(
          children: [
            ComponentInput(
              labelText: "",
              controller: _textController,
              maxLines: 5,
              minLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
