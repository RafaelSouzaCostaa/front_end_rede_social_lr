import 'package:flutter/material.dart';

import '../../Colors/customized_colors_grobal.dart';
import '../../Components/comp_appBar.dart';
import '../../Components/comp_button.dart';
import '../../Components/comp_input.dart';

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
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: ComponentInput(
                hintText: "Alguma fofoca nova?",
                controller: _textController,
                focusedBorderColor: Colors.transparent,
                unfocusedBorderColor: Colors.transparent,
                validator: true,
                maxLines: 5,
                minLines: 5,
                maxLenght: 280,
              ),
            ),
            ComponentButton(
              text: "Kitterar",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
