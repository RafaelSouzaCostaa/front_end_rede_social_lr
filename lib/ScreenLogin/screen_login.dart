import 'package:flutter/material.dart';
import 'package:rede_social_lr/Components/comp_appBar.dart';

import '../Colors/customized_colors_grobal.dart';
import '../Components/comp_button.dart';
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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: CustomizedColors.darkBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: ComponentAppBar(
            hasDrawer: false,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10),
          child: Column(children: [
            SizedBox(
              height: screenHeight * 0.19,
            ),
            Form(
              child: Column(
                children: [
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
                        onTap: () {
                          Navigator.pushNamed(context, "/cadastro");
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.39,
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 5,
              ),
              child: Row(
                children: [
                  Container(
                    width: screenWidth * 0.75,
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
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
                            Navigator.pushNamed(context,
                                "/barralateral"); //ATENCAO apagar, e so teste
                          },
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: ComponentButton(
                      text: "Login",
                      widthDouble: 0.20,
                      maxWidth: 170,
                      onPressed: () {
                        Navigator.pushNamed(context, "/cadastro");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
