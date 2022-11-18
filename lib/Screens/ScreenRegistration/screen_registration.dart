import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Colors/customized_colors_grobal.dart';
import '../../Components/comp_appBar.dart';
import '../../Components/comp_button.dart';
import '../../Components/comp_input.dart';
import '../../Global/api_service.dart';
import '../../Models/model_profile.dart';

class ScreenRegistration extends StatefulWidget {
  const ScreenRegistration({Key? key}) : super(key: key);

  @override
  State<ScreenRegistration> createState() => _ScreenRegistrationState();
}

class _ScreenRegistrationState extends State<ScreenRegistration> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomizedColors.darkBackground,
        appBar: ComponentAppBar(hasDrawer: false),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Flexible(
              flex: 3,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ComponentInput(
                        labelText: 'Usuario',
                        controller: _nameController,
                        validator: true,
                      ),
                      const SizedBox(height: 20),
                      ComponentInput(
                        labelText: 'Email',
                        controller: _emailController,
                        validator: true,
                      ),
                      const SizedBox(height: 20),
                      ComponentInput(
                        labelText: '@nickname',
                        controller: _nicknameController,
                        validator: true,
                      ),
                      const SizedBox(height: 20),
                      ComponentInput(
                        labelText: 'Senha',
                        controller: _passwordController,
                        validator: true,
                        suffixIcon: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: _visiblePassword == true
                              ? const Icon(
                                  Icons.visibility_sharp,
                                )
                              : const Icon(
                                  Icons.visibility_off_sharp,
                                ),
                          color: Colors.white70,
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
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 50),
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Já tem uma Conta?",
                        style: TextStyle(
                            color: CustomizedColors.lightText,
                            fontFamily: 'Imprima-Regular'),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Get.toNamed("/login");
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: CustomizedColors.linkInText,
                              fontFamily: 'Imprima-Regular'),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: ComponentButton(
                      text: "Cadastro",
                      width: 25,
                      height: 6,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          Profile newProfile = Profile(
                            name: _nameController.text,
                            nickname: _nicknameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            creationDate: DateTime.now().millisecondsSinceEpoch,
                          );
                          await ApiService.createProfile(newProfile);
                          Get.toNamed("/home");
                        }
                      }, //IMPLEMENTAR
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
