import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'package:uanity/uanity-api/api_specs.dart';
import 'package:http/http.dart' as http;

class AuthController {
  Future<Response> login(data) async {
    try {
      EasyLoading.show();
      Uri finalUri = Uri.parse('${ApiSpecs.apiHost}/auth/login');
      return await http.post(
        finalUri,
        body: data,
        headers: await ApiSpecs().getHeaders(),
      );
    } finally {
      EasyLoading.dismiss();
    }
  }
}
