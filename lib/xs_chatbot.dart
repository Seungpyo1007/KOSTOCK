import 'package:flutter/material.dart';

class XsChatbotPage extends StatelessWidget {
  const XsChatbotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('동엽쌤 챗봇 beta'),
      ),
      body: const Center(
        child: Text('챗봇 페이지 내용'),
      ),
    );
  }
}
