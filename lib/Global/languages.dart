import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'pt_BR': {
          'user': 'Usuario',
          'password': 'Senha',
          'name': 'Nome',
          'nickname': 'Apelido',
          'nullaccount': 'Não tem uma conta?',
          'register': 'Cadastre-se',
          'forgotpassword': 'Esqueceu sua senha?',
          'alreadyhaveaccount': 'Ja tem uma conta?',
          'recover': 'Recuperar',
          'profile': 'Perfil',
          'change': 'Alterar',
          'logout': 'Sair',
          'anygossip': 'Alguma fofoca?',
        },
        'en_US': {
          'user': 'User',
          'password': 'Password',
          'name': 'Name',
          'nickname': 'Nickname',
          'nullaccount': 'Dont have an account?',
          'register': 'Register',
          'forgotpassword': 'Forgot your password?',
          'alreadyhaveaccount': 'Already have an account?',
          'recover': 'Recover',
          'profile': 'Profile',
          'change': 'Change',
          'logout': 'Logout',
          'anygossip': 'Any gossip?',
        },
      };
}
