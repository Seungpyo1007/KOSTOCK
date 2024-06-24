import 'package:flutter/material.dart';
import 'LoginMenu/login_page.dart';
import 'BotSetting/xs_chatbot.dart';
import 'BotSetting/ApiProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String _apiKey = 'YOUR_API_KEY_HERE'; // 여기에 API 키를 하드코딩합니다.

  @override
  Widget build(BuildContext context) {
    return ApiProvider(
      apiKey: _apiKey,
      child: MaterialApp(
        title: 'Flutter ChatGPT',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        routes: {
          '/chat': (context) => const XsChatbotPage(),
        },
      ),
    );
  }
}
