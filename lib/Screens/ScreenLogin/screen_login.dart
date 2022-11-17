import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Colors/customized_colors_grobal.dart';
import '../../Components/comp_appBar.dart';
import '../../Components/comp_button.dart';
import '../../Components/comp_input.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _form_key = GlobalKey<FormState>();

  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    //double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
            key: _form_key,
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
                    FocusScope.of(context).unfocus();

                    if (_form_key.currentState!.validate()) {
                      // await Navigator.pushNamed(context, "/home");
                      await Get.toNamed("/home");
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
