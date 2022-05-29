import 'package:http/http.dart';
import 'package:uanity/uanity-api/api_specs.dart';
import 'package:http/http.dart' as http;

class AuthController {
  Future<Response> login(data) async {
    Uri finalUri = Uri.parse(ApiSpecs.apiHost + "/auth/login");
    return await http.post(finalUri, body: data, headers: ApiSpecs.headers);
  }
}
