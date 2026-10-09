import 'dart:convert';

import 'package:http/http.dart' as http;

class ContactService {
  static const _endpoint = 'https://formspree.io/f/mvkzplva';

  Future<void> sendMessage({
    required String name,
    required String email,
    required String message,
  }) async {
    final response = await http.post(
      Uri.parse(_endpoint),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'name': name, 'email': email, 'message': message}),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Unable to send message.');
    }
  }
}
