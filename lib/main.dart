import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'LoginMenu/login_page.dart';
import 'MainMenu/home_page.dart';
import 'BotSetting/xs_chatbot.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ChatGPT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/chat': (context) => const XsChatbotPage(),
      },
    );
  }
}
