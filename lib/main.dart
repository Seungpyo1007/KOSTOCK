import 'package:flutter/material.dart';
import 'LoginMenu/login_page.dart'; // LoginPage 파일 임포트
// MainPage 파일 임포트

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
