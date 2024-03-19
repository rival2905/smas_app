import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
// import 'package:lms/app/helper/config.dart';

class AuthService {
  static final client = http.Client();
  static final storage = GetStorage();
  static String accestoken = storage.read('accestoken');

  static Future<String> login(String email, String password) async {

    var newUrl = "https://smas.official.biz.id/api/login";

    try {
      final response = await client.post(
        Uri.parse(newUrl),
        body: {
          "email": email,
          "password": password,
        },
      );
      final message = json.decode(response.body)['message'];
      if (response.statusCode == 201) {
        final token = json.decode(response.body)['token'];

        await storage.write('accestoken', token);
        return 'success';
      } else {
        return message;
      }
    } catch (e) {
      print('oeoeooe $e');
      return 'Failed';
    }
  }
}