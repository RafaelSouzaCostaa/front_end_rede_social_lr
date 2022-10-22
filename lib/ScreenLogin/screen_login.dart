import 'package:flutter/material.dart';
import 'package:rede_social_lr/Components/comp_input.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Safe Area e para não ficar atras da barra de notificação, relogio, bateria, livra acamera frontal
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset("assets/image/logo.png"),
              ),
              const SizedBox(height: 100),
              Form(
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ComponentInput(
                        labelText: 'Usuario', controller: userController),
                  ),
                  ComponentInput(
                      labelText: 'Senha', controller: passwordController),
                  Row(
                    children: const [
                      Text("Não tem uma conta? "),
                      Text("Cadastre-se"),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      const Text("Esqueceu sua senha?"),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Login"),
                      ),
                    ],
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
