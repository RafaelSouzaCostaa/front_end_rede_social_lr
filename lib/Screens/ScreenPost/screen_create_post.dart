import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rede_social_lr/Global/api_service.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import '../../Components/comp_app_bar.dart';
import '../../Components/comp_button.dart';
import '../../Components/comp_input.dart';

class ScreenCreatePost extends StatefulWidget {
  const ScreenCreatePost({super.key});

  @override
  State<ScreenCreatePost> createState() => _ScreenCreatePostState();
}

class _ScreenCreatePostState extends State<ScreenCreatePost> {
  final TextEditingController _descriptionController = TextEditingController();

  List<String> listImage = List.empty(growable: true);

  addImage(String imageEncode) {
    listImage.add(imageEncode);
  }

  Future<File> processImageCamera(XFile pickedFile) async {
    File img = File(pickedFile.path);
    Directory directory = await getApplicationDocumentsDirectory();
    String localPath = directory.path;
    String uniqueID = UniqueKey().toString();

    return await img.copy('$localPath/image_$uniqueID.png');
  }

  Future<String> imageCompressEncodeBase64(File image) async {
    Uint8List imageBytes = image.readAsBytesSync();

    Uint8List compress =
        await FlutterImageCompress.compressWithList(imageBytes, quality: 50);

    return base64Encode(compress);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ComponentAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 15, right: 15),
                    child: ComponentButton(
                      height: 40,
                      width: 80,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                      text: "Kitterar",
                      onPressed: () async {
                        if (listImage.isNotEmpty &&
                            _descriptionController.text != "") {
                          await ApiService.createPost(
                              _descriptionController.text, listImage);
                          Get.offAndToNamed("/home");
                        }
                      },
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.white,
                thickness: 0.2,
              ),
              if (listImage.isNotEmpty)
                SizedBox(
                  width: Get.width - 10,
                  height: Get.height * 0.6,
                  child: ListView.builder(
                    itemCount: listImage.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Image(
                        image: MemoryImage(
                          Uint8List.fromList(
                            base64Decode(
                              listImage[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              GestureDetector(
                child: const Icon(Icons.add_a_photo),
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? pickedFile =
                      await picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    File image = await processImageCamera(pickedFile);
                    String imgEncode = await imageCompressEncodeBase64(image);
                    addImage(imgEncode);
                  }
                  setState(() {});
                },
              ),
              const Divider(
                color: Colors.white,
                thickness: 0.2,
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: ComponentInput(
                  hintText: 'anygossip'.tr,
                  controller: _descriptionController,
                  focusedBorderColor: Colors.transparent,
                  unfocusedBorderColor: Colors.transparent,
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
      ),
    );
  }
}
