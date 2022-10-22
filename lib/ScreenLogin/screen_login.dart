import 'package:flutter/material.dart';

import '../Components/comp_input.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0E1010),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/image/logo.png"),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Form(
                  //user
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ComponentInput(
                        labelText: 'Usuario',
                        controller: userController,
                        validator: true,
                      ),
                    ),
                    ComponentInput(
                      //Senha
                      obscureText: !_visiblePassword,
                      labelText: 'Senha',
                      controller: passwordController,
                      suffixIcon: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: _visiblePassword
                            ? const Icon(Icons.visibility_sharp)
                            : const Icon(Icons.visibility_off_sharp),
                        color: Colors.white70,
                        style: const ButtonStyle(),
                        onPressed: () {
                          setState(() {
                            _visiblePassword = !_visiblePassword;
                          });
                        },
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
                              const Text(
                                "Não tem uma conta? ",
                                style: TextStyle(color: Colors.white),
                              ),
                              GestureDetector(
                                child: const Text(
                                  "Cadastre-se",
                                  style: TextStyle(color: Color(0xFF26F4E8)),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, "/cadastro");
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          padding: const EdgeInsets.only(left: 35),
                          child: GestureDetector(
                            child: const Text(
                              "Esqueceu sua senha?",
                              style: TextStyle(
                                color: Color(
                                    0xFF26F4E8), //ATENCAO Luiggi e essa cor mesmo?
                              ),
                            ),
                            onTap: () {
                              //IMPLEMENTAR Navigator para pagina de trocar senha
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF26F4E8),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
