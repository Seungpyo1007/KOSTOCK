import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'current_stock_page.dart';
import 'news_page.dart';
import 'interest_page.dart';
import '../BotSetting/xs_chatbot.dart'; // XsChatbotPage import

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> stockData = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchStockData();
  }

  Future<void> fetchStockData() async {
    setState(() {
      isLoading = true;
    });

    final apiKey = 'A8AO82O605EHGS5G';
    final symbols = ['AAPL', 'MSFT']; // 코스피, 코스닥 심볼

    try {
      final responses = await Future.wait(symbols.map((symbol) =>
          http.get(Uri.parse('https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=$symbol&apikey=$apiKey'))));

      setState(() {
        for (var i = 0; i < symbols.length; i++) {
          if (responses[i].statusCode == 200) {
            final data = jsonDecode(responses[i].body);
            stockData[symbols[i]] = data['Global Quote'] ?? {};
          }
        }
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching stock data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: RefreshIndicator(
        onRefresh: fetchStockData,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '동엽쌤 Pick!',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
                const SizedBox(height: 5),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '한화오션',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      '29,900',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                    Text(
                      '▼1,200  3.86%',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('국내주식', style: TextStyle(color: Colors.white)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('해외주식(현재 미지원)', style: TextStyle(color: Colors.grey)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: '종목을 검색해주세요',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[850],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                  children: stockData.entries.map((entry) {
                    final symbol = entry.key;
                    final data = entry.value;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CurrentStockPage()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[850],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(symbol == 'AAPL' ? '애플' : '마소',
                                    style: const TextStyle(color: Colors.white, fontSize: 18)),
                                Text(data != null ? '${data['05. price']}' : 'N/A',
                                    style: const TextStyle(color: Colors.white, fontSize: 18)),
                                Text(data != null ? '${data['10. change percent']}' : 'N/A',
                                    style: const TextStyle(color: Colors.white, fontSize: 18)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewsPage()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('뉴스', style: TextStyle(color: Colors.white, fontSize: 18)),
                        const SizedBox(height: 10),
                        const Text(
                          '한화오션:HD현대, 조선박람회 \'포시도니아\'서 친환경 기술 선봬',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Image.asset('assets/news_image.png'), // 뉴스 이미지 경로
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const InterestPage()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('관심종목', style: TextStyle(color: Colors.white, fontSize: 18)),
                        SizedBox(height: 10),
                        Center(
                          child: Column(
                            children: [
                              Icon(Icons.star, color: Colors.grey, size: 50),
                              SizedBox(height: 10),
                              Text(
                                '관심종목을 등록해주세요',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const XsChatbotPage()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('동엽쌤 챗봇 beta', style: TextStyle(color: Colors.white, fontSize: 18)),
                        SizedBox(height: 10),
                        Center(
                          child: Column(
                            children: [
                              Icon(Icons.chat, color: Colors.grey, size: 50),
                              SizedBox(height: 10),
                              Text(
                                '챗봇을 사용해보세요!',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
