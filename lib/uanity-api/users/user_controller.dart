import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:uanity/uanity-api/api_specs.dart';

class UserController {
  Future<Response> listAll() async {
    Uri finalUri = Uri.parse('${ApiSpecs.apiHost}/user');
    return await http.get(finalUri, headers: await ApiSpecs().getHeaders());
  }
}
