import 'package:flutter/material.dart';
import 'package:rede_social_lr/Components/comp_button.dart';

import '../Components/comp_input.dart';

class ScreenCadastro extends StatefulWidget {
  const ScreenCadastro({Key? key}) : super(key: key);

  @override
  State<ScreenCadastro> createState() => _ScreenCadastroState();
}

class _ScreenCadastroState extends State<ScreenCadastro> {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dataBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    //double largura = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0E1010),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset("assets/image/logo.png"),
                ),
                const SizedBox(height: 100),
                Form(
                  child: Column(
                    children: [
                      ComponentInput(
                        labelText: 'Usuario',
                        controller: userController,
                        validator: true,
                      ),
                      const SizedBox(height: 20),
                      ComponentInput(
                        labelText: 'Email ou Telefone',
                        controller: passwordController,
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
                      ),
                      SizedBox(
                        height: altura * 0.33,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 35, right: 35),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(children: [
                                const Text(
                                  "Já tem uma Conta?",
                                  style: TextStyle(
                                      color: Color(0xFFC2B7B7),
                                      fontFamily: 'Imprima-Regular'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Color(0xFF26F4E8),
                                        fontFamily: 'Imprima-Regular'),
                                  ),
                                ),
                              ]),
                            ),
                            ComponentButton(
                              text: "Cadastro",
                              onPressed: () {},
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
