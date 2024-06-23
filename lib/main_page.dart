import 'package:flutter/material.dart';
import 'MainMenu/home_page.dart';
import 'MainMenu/news_page.dart';
import 'MainMenu/interest_page.dart';
import 'MainMenu/stock_order_page.dart';
import 'MainMenu/my_assets_page.dart';
import 'MainMenu/current_stock_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
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

  List<Widget> _pages = [
    HomePage(),
    NewsPage(),
    InterestPage(),
    StockOrderPage(),
    MyAssetsPage(),
    CurrentStockPage(),
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
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
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
        items: [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('최근 알림 내역', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
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
