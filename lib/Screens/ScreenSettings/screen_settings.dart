import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rede_social_lr/Components/comp_edit_button.dart';
import 'package:rede_social_lr/Components/comp_open_input_button.dart';

import '../../Colors/customized_colors_global.dart';
import '../../Components/comp_app_bar.dart';
import '../../Components/comp_button.dart';
import '../../Components/comp_text_button.dart';
import '../../Global/profile_authenticated.dart';

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({super.key});

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  ProfileAuthenticated profileAuthenticated = Get.put(ProfileAuthenticated());

  @override
  Widget build(BuildContext context) {
    String? urlImageProfile = profileAuthenticated.profileAuthentic.value.image;
    Color themeColor = Theme.of(context).scaffoldBackgroundColor;
    File? _image;
    TextEditingController controllerName = TextEditingController(
      text: 'profileAuthenticated.profileAuthentic.value.name',
    );
    TextEditingController controllerNickname = TextEditingController(
      text: "profileAuthenticated.profileAuthentic.value.nickname}",
    );
    TextEditingController controllerEmail = TextEditingController(
      text: 'profileAuthenticated.profileAuthentic.value.email',
    );
    TextEditingController controllerBirthDate = TextEditingController(
      text: 'profileAuthenticated.profileAuthentic.value.birthDate',
    );

    return SafeArea(
      child: Scaffold(
        appBar: const ComponentAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      Container(
                        //Background image
                        color: Colors.yellow,
                        height: Get.height * 0.175,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(
                          top: Get.height * 0.10,
                          right: 12,
                        ),
                        child: ComponentEditButton(
                          icon: Icons.image,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: Get.height * 0.11),
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 3.2,
                                color: themeColor,
                              ),
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: urlImageProfile != null
                                ? CircleAvatar(
                                    backgroundColor:
                                        CustomizedColors.blueBackground,
                                    backgroundImage:
                                        NetworkImage(urlImageProfile))
                                : CircleAvatar(
                                    backgroundColor:
                                        CustomizedColors.blueBackground,
                                    backgroundImage: const ExactAssetImage(
                                        "assets/image/perfil.png"),
                                  ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: Get.height * 0.10,
                              left: 70,
                            ),
                            child: ComponentEditButton(
                              icon: Icons.add_a_photo,
                              onPressed: () async {
                                final ImagePicker picker = ImagePicker();
                                final XFile? pickedFile = await picker
                                    .pickImage(source: ImageSource.camera);
                                if (pickedFile != null) {
                                  File image = File(pickedFile.path);
                                  Directory directory =
                                      await getApplicationDocumentsDirectory();
                                  String localPath = directory.path;

                                  String uniqueID = UniqueKey().toString();

                                  final File savedImage = await image
                                      .copy('$localPath/image_$uniqueID.png');

                                  setState(() {
                                    _image = savedImage;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.07,
              ),
              Column(
                children: [
                  ComponentOpenInputButton(
                    text: "${'change'.tr} ${'name'.tr}",
                    icon: Icons.person,
                    subText: 'profileAuthenticated.profileAuthentic.value.name',
                    inputCotroller: controllerName,
                    onPressed: () async {
                      await Get.toNamed("/login");
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  ComponentOpenInputButton(
                    icon: Icons.alternate_email,
                    text: "${'change'.tr} ${'nickname'.tr}",
                    subText:
                        "profileAuthenticated.profileAuthentic.value.nickname}",
                    inputCotroller: controllerNickname,
                    onPressed: () async {
                      await Get.toNamed("/login");
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  ComponentOpenInputButton(
                    icon: Icons.mail,
                    text: "${'change'.tr} Email",
                    subText:
                        'profileAuthenticated.profileAuthentic.value.email',
                    inputCotroller: controllerBirthDate,
                    onPressed: () async {
                      await Get.toNamed("/login");
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  ComponentOpenInputButton(
                    icon: Icons.mail,
                    text: "${'change'.tr} ${'birthDate'.tr}",
                    subText:
                        'profileAuthenticated.profileAuthentic.value.birthDate',
                    inputCotroller: controllerEmail,
                    onPressed: () async {
                      await Get.toNamed("/login");
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  ComponentTextButton(
                    icon: Icons.date_range_outlined,
                    text: "${'change'.tr} ${'birthDate'.tr}",
                    width: Get.width * 0.98,
                    onPressed: () async {
                      await Get.toNamed("/login");
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  ComponentTextButton(
                    icon: Icons.key,
                    text: "${'change'.tr} ${'password'.tr}",
                    width: Get.width * 0.98,
                    onPressed: () async {
                      await Get.toNamed("/login");
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 15),
                    child: ComponentButton(
                        text: 'Salvar',
                        onPressed: () {
                          //RAFAEL coloca o put de profile aqui
                        }),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
