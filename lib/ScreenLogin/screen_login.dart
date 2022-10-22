import 'package:flutter/material.dart';
import 'package:rede_social_lr/Components/comp_input.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  TextEditingController user_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: EdgeInsets.only(bottom: 20),
                  child: ComponentInput(
                      labelText: 'Usuario', controller: user_controller),
                ),
                ComponentInput(
                    labelText: 'Senha', controller: password_controller),
                Row(
                  children: const [
                    Text("Não tem uma conta? "),
                    Text("Cadastre-se"),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Text("Esqueceu sua senha?"),
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
    );
  }
}
