import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ApiProvider.dart';

class XsChatbotPage extends StatefulWidget {
  const XsChatbotPage({super.key});

  @override
  _XsChatbotPageState createState() => _XsChatbotPageState();
}

class _XsChatbotPageState extends State<XsChatbotPage> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  late String apiKey;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final apiProvider = ApiProvider.of(context);
    apiKey = apiProvider?.apiKey ?? '';
  }

  Future<void> _sendMessage(String message) async {
    setState(() {
      _messages.add({'role': 'user', 'content': message});
    });

    try {
      final response = await _sendToApi(message);
      setState(() {
        _messages.add({'role': 'bot', 'content': response});
      });
    } catch (e) {
      setState(() {
        _messages.add({'role': 'bot', 'content': 'Failed to get response: $e'});
      });
    }
  }

  Future<String> _sendToApi(String message) async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatGPT'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(
                    message['content']!,
                    style: TextStyle(color: message['role'] == 'user' ? Colors.blue : Colors.red),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _sendMessage(_controller.text);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
