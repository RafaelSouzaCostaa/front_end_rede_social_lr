import 'package:flutter/material.dart';

import '../../Colors/customized_colors_grobal.dart';
import '../../Components/comp_appBar.dart';
import '../../Components/comp_button.dart';
import '../../Components/comp_input.dart';

class ScreenRegistration extends StatefulWidget {
  const ScreenRegistration({Key? key}) : super(key: key);

  @override
  State<ScreenRegistration> createState() => _ScreenRegistrationState();
}

class _ScreenRegistrationState extends State<ScreenRegistration> {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dataBirthController = TextEditingController();

  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    //double altura = MediaQuery.of(context).size.height;

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
              flex: 10,
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: [
                      ComponentInput(
                        labelText: 'Usuario',
                        controller: userController,
                        validator: true,
                      ),
                      const SizedBox(height: 20),
                      ComponentInput(
                        labelText: 'Email',
                        controller: passwordController,
                      ),
                      const SizedBox(height: 20),
                      ComponentInput(
                        labelText: 'Telefone',
                        controller: passwordController,
                      ),
                      const SizedBox(height: 20),
                      ComponentInput(
                        labelText: '@nickname',
                        controller: userController,
                        validator: true,
                      ),
                      const SizedBox(height: 20),
                      ComponentInput(
                        labelText: 'Data Nascimento',
                        controller: passwordController,
                      ),
                      const SizedBox(height: 20),
                      ComponentInput(
                        labelText: 'Senha',
                        controller: passwordController,
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
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              width: MediaQuery.of(context).size.width * 1,
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
                        onTap: () {
                          Navigator.pushNamed(context, "/login");
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
                      //ATENCAO passando tamanho em porcentagem para btn ficar responsivo
                      width: 0.25,
                      height: 0.04,
                      onPressed: () {}, //IMPLEMENTAR
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
