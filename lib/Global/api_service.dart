import 'package:rede_social_lr/Global/api_constants.dart';

class ApiService {
  Future createProfile(name, nickname, email, image) async {
    try {
      var url = Uri.parse(APIConstants.apiUrl + APIConstants.createProfile);
      var response = await 
    } catch (e) {}
  }
}
