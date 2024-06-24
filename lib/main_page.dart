import 'package:flutter/material.dart';
import 'MainMenu/home_page.dart';
import 'MainMenu/news_page.dart';
import 'MainMenu/interest_page.dart';
import 'MainMenu/stock_order_page.dart';
import 'MainMenu/my_assets_page.dart';
import 'MainMenu/current_stock_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const NewsPage(),
    const InterestPage(),
    const StockOrderPage(),
    const MyAssetsPage(),
    const CurrentStockPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/logo.png',
          height: 40,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationPage()),
              );
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.red,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, color: Colors.red),
            label: '메뉴',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article, color: Colors.red),
            label: '뉴스',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star, color: Colors.red),
            label: '관심종목',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up, color: Colors.red),
            label: '주식 주문',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet, color: Colors.red),
            label: 'MY 자산',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart, color: Colors.red),
            label: '주식 현재가',
          ),
        ],
      ),
    );
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('최근 알림 내역', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const ListTile(
            leading: Icon(Icons.notifications, color: Colors.red),
            title: Text('KOSTOCK 가입을 축하드립니다!', style: TextStyle(color: Colors.white)),
            subtitle: Text('앞으로 KOSTOCK에서 제공하는 다양한 혜택을 받아보세요.', style: TextStyle(color: Colors.grey)),
            trailing: Icon(Icons.circle, color: Colors.red, size: 10),
          ),
        ),
      ),
    );
  }
}
