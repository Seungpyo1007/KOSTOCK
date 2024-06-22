import 'package:flutter/material.dart';
import 'login_page.dart'; // LoginPage 파일 임포트
import 'main_page.dart'; // MainPage 파일 임포트

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
