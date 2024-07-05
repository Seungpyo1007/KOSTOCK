import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'LoginMenu/login_page.dart';
import 'MainMenu/home_page.dart';
import 'BotSetting/xs_chatbot.dart';
import 'MainMenu/news_page.dart' as news_page;
import 'MainMenu/interest_page.dart';
import 'MainMenu/interest_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InterestProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter ChatGPT',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        routes: {
          '/login': (context) => const LoginPage(),
          '/home': (context) => const HomePage(),
          '/chat': (context) => const XsChatbotPage(),
          '/news': (context) => const news_page.NewsPage(),
          '/interest': (context) => const InterestPage(),
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'News'),
              Tab(text: 'Interest'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            news_page.NewsPage(),
            InterestPage(),
          ],
        ),
      ),
    );
  }
}
