import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginWebService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://student.valuxapps.com/api/login'),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
