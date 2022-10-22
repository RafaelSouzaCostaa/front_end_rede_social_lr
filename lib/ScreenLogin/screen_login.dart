import 'package:flutter/material.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
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
                SizedBox(
                  width: 250,
                  height: 40,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Usuario",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Color.fromARGB(26, 2, 19, 255),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  height: 40,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Senha",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Color.fromARGB(26, 2, 19, 255),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
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
