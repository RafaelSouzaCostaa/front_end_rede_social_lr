import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Colors/customized_colors_grobal.dart';
import '../../Components/comp_appBar.dart';
import '../../Components/comp_button.dart';
import '../../Components/comp_input.dart';
import '../../Global/api_service.dart';
import '../../Global/token.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    //double screenHeight = MediaQuery.of(context).size.height;
    //double screenWidth = MediaQuery.of(context).size.width;
    Token globalToken = Get.put(Token());

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: CustomizedColors.darkBackground,
        appBar: ComponentAppBar(hasDrawer: false),
        body: Column(children: [
          Flexible(
            child: Container(),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                ComponentInput(
                  labelText: 'Usuario',
                  controller: _userController,
                  validator: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                ComponentInput(
                  //Senha
                  obscureText: !_visiblePassword,
                  labelText: 'Senha',
                  controller: _passwordController,
                  validator: true,
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
                    color: Colors.white70,
                    // style: const ButtonStyle(),
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
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Não tem uma conta? ",
                      style: TextStyle(
                          color: CustomizedColors.lightText,
                          fontFamily: 'Imprima-Regular'),
                    ),
                    GestureDetector(
                      child: Text(
                        "Cadastre-se",
                        style: TextStyle(
                            color: CustomizedColors.linkInText,
                            fontFamily: 'Imprima-Regular'),
                      ),
                      onTap: () async {
                        await Get.toNamed("/cadastro");
                      },
                    ),
                  ],
                ),
              )
            ],
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
                      "Esqueceu sua senha?",
                      style: TextStyle(
                          color: CustomizedColors.lightText,
                          fontFamily: 'Imprima-Regular'),
                    ),
                    GestureDetector(
                        child: Text(
                          "  Recuperar",
                          style: TextStyle(
                              color: CustomizedColors.linkInText,
                              fontFamily: 'Imprima-Regular'),
                        ),
                        onTap: () {
                          //IMPLEMENTAR Navigator para pagina de trocar senha
                        }),
                  ],
                ),
                ComponentButton(
                  text: "Login",
                  width: 20,
                  height: 6,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (await ApiService.login(
                        _userController.text,
                        _passwordController.text,
                      )) {
                        if (await ApiService.buscarDadosProfile()) {
                          Get.toNamed("/home");
                        }
                      } else {
                        Get.snackbar(
                          "Erro ao fazer login",
                          "Email ou Senha invalidos",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: const Color.fromARGB(255, 138, 8, 8),
                          colorText: Colors.white,
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
