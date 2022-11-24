import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Components/comp_app_bar.dart';
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
      appBar: const ComponentAppBar(),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 15, right: 15),
                  child: ComponentButton(
                    height: 7,
                    width: 20,
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    text: "Kitterar",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.white,
              thickness: 0.2,
            ),
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
                fontSize: 19,
                width: Get.width,
              ),
            ),
            const Divider(
              color: Colors.white,
              thickness: 0.2,
            ),
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
