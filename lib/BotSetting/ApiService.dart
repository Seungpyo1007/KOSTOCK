import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey;

  ApiService({required this.apiKey});

  Future<String> sendMessage(String message) async {
    final url = Uri.parse('https://api.openai.com/v1/engines/davinci-codex/completions');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };
    final body = jsonEncode({
      'prompt': message,
      'max_tokens': 150,
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['text'];
    } else {
      throw Exception('Failed to connect to GPT-3 API');
    }
  }
}
