import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiSpecs {
  static const String apiHost = 'https://uanity-api.herokuapp.com';
  final Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<Map<String, String>> getHeaders() async {
    const storage = FlutterSecureStorage();
    Map<String, String> authHeaders = headers;
    String? token = await storage.read(key: 'token');

    if (token != null) {
      authHeaders.putIfAbsent('Authorization', () => 'Bearer $token');
      return authHeaders;
    }

    return headers;
  }
}
