import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Colors/customized_colors_global.dart';
import '../../Components/comp_app_bar.dart';
import '../../Components/comp_button.dart';
import '../../Components/comp_input.dart';
import '../../Components/comp_text_button.dart';
import '../../Global/api_service.dart';
import '../../Global/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  //ATENCAO retirar os valores padrão - quando produção
  InstanceSharedPreference sharedPreferences = InstanceSharedPreference();
  final TextEditingController _userController =
      TextEditingController(text: "teste");
  final TextEditingController _passwordController =
      TextEditingController(text: "teste");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _visiblePassword = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const ComponentAppBar(),
        body: Column(children: [
          Flexible(
            child: Container(),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                ComponentInput(
                  labelText: 'user'.tr,
                  controller: _userController,
                ),
                const SizedBox(
                  height: 20,
                ),
                ComponentInput(
                  //Senha
                  obscureText: !_visiblePassword,
                  labelText: 'password'.tr,
                  controller: _passwordController,

                  suffixIcon: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: _visiblePassword
                        ? const Icon(
                            Icons.visibility_sharp,
                            size: 23,
                          )
                        : const Icon(
                            Icons.visibility_off_sharp,
                            // size: 23,
                          ),
                    color: Colors.grey,
                    onPressed: () {
                      setState(
                        () {
                          _visiblePassword = !_visiblePassword;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                Container(
                  width: Get.width,
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'nullaccount'.tr,
                        style: const TextStyle(fontFamily: 'Imprima-Regular'),
                      ),
                      ComponentTextButton(
                        text: 'register'.tr,
                        hoverAnimation: false,
                        textColor: CustomizedColors.blueText,
                        onPressed: () async {
                          await Get.toNamed("/cadastro");
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: Container(),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Row(
              //Texto e Botao
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  //Texto
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'forgotpassword'.tr,
                      style: const TextStyle(fontFamily: 'Imprima-Regular'),
                    ),
                    ComponentTextButton(
                      text: 'recover'.tr,
                      hoverAnimation: false,
                      textColor: CustomizedColors.blueText,
                      onPressed: () async {
                        await Get.toNamed("/cadastro");
                      },
                    ),
                  ],
                ),
                ComponentButton(
                  text: 'login'.tr,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      int statusCode = await ApiService.login(
                        _userController.text,
                        _passwordController.text,
                      );

                      if (statusCode == 200) {
                        if (await ApiService.getProfileData()) {
                          sharedPreferences.saveTokenStatus();
                          Get.offAndToNamed("/home");
                        }
                      } else {
                        Get.snackbar(
                          'loginError'.tr,
                          'validData'.tr,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: const Color.fromARGB(255, 138, 8, 8),
                          borderRadius: 2,
                          duration: const Duration(milliseconds: 3000),
                          isDismissible: true,
                          dismissDirection: DismissDirection.horizontal,
                          forwardAnimationCurve: Curves.easeOutBack,
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
