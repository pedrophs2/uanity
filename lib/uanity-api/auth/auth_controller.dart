import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'package:uanity/dtos/login_dto.dart';
import 'package:uanity/uanity-api/api_specs.dart';
import 'package:http/http.dart' as http;

class AuthController {
  Future<Response> login(LoginDTO loginDto) async {
    try {
      EasyLoading.show();
      Uri finalUri = Uri.parse('${ApiSpecs.apiHost}/auth/login');
      return await http.post(
        finalUri,
        body: loginDto.toJson(),
        headers: await ApiSpecs().getHeaders(),
      );
    } finally {
      EasyLoading.dismiss();
    }
  }
}
