import 'package:flutter_test/flutter_test.dart';
import 'package:rede_social_lr/Global/api_service.dart';
import 'package:rede_social_lr/Models/model_profile.dart';

void main() {
  group("Profile:", () {
    Profile profileCadastro = Profile(
        name: 'Jose',
        nickname: 'Joses',
        email: "jose@jose.com",
        password: "profilepassword",
        creationDate: 151513155153);
    Profile? profile;
    test('Testando Criação de Profile', () async {
      var newProfile = await ApiService.createProfile(profileCadastro);

      expect(newProfile.name, profileCadastro.name);
      expect(newProfile.nickname, profileCadastro.nickname);
      expect(newProfile.email, profileCadastro.email);

      profile = newProfile;
    });

    test("Logando", () async {
      int statusCode = await ApiService.login(
          profileCadastro.email, profileCadastro.password);

      expect(statusCode, 200);
    });

    test("Buscar perfil por nickname", () async {
      var auxProfile = await ApiService.getProfileByNick(profile!.nickname);

      expect(auxProfile.email, profileCadastro.email);
      expect(auxProfile.name, profileCadastro.name);
    });

    test("Deletando Profile", () async {
      bool auxProfile = false;
      if (profile != null) {
        auxProfile = await ApiService.deleteProfile(profile!.id!);
      }

      expect(auxProfile, true);
    });
  });
}
