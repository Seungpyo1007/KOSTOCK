import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'interest_provider.dart';
import 'current_stock_page.dart';
import 'news_page.dart';
import 'interest_page.dart';
import '../BotSetting/xs_chatbot.dart'; // XsChatbotPage import

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
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
              GestureDetector(
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
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('코스피', style: TextStyle(color: Colors.white, fontSize: 18)),
                          Text('2,682.52', style: TextStyle(color: Colors.white, fontSize: 18)),
                          Text('0.00%', style: TextStyle(color: Colors.white, fontSize: 18)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('코스닥', style: TextStyle(color: Colors.white, fontSize: 18)),
                          Text('844.72', style: TextStyle(color: Colors.white, fontSize: 18)),
                          Text('0.00%', style: TextStyle(color: Colors.white, fontSize: 18)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('다우존스', style: TextStyle(color: Colors.blue, fontSize: 18)),
                          Text('38,571.03', style: TextStyle(color: Colors.blue, fontSize: 18)),
                          Text('▼115.29  0.30%', style: TextStyle(color: Colors.blue, fontSize: 18)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('나스닥', style: TextStyle(color: Colors.red, fontSize: 18)),
                          Text('16,828.67', style: TextStyle(color: Colors.red, fontSize: 18)),
                          Text('▲93.66  0.56%', style: TextStyle(color: Colors.red, fontSize: 18)),
                        ],
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
    );
  }
}

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<dynamic> newsItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    final apiKey = 'G33Z7BXADP0BNI70';
    final url = 'https://www.alphavantage.co/query?function=NEWS_SENTIMENT&tickers=AAPL&apikey=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          newsItems = data['feed'] ?? [];
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching news: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '뉴스',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: newsItems.length,
                itemBuilder: (context, index) {
                  final newsItem = newsItems[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailPage(newsItem: newsItem),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            newsItem['title'],
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          Image.network(newsItem['banner_image']),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  final dynamic newsItem;

  const NewsDetailPage({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('뉴스 상세', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(newsItem['title'], style: const TextStyle(color: Colors.white, fontSize: 24)),
              const SizedBox(height: 20),
              Text(newsItem['summary'], style: const TextStyle(color: Colors.white, fontSize: 18)),
              const SizedBox(height: 20),
              Image.network(newsItem['banner_image']),
              const SizedBox(height: 20),
              Text('작성일: ${newsItem['time_published']}', style: const TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrentStockPage extends StatefulWidget {
  const CurrentStockPage({super.key});

  @override
  _CurrentStockPageState createState() => _CurrentStockPageState();
}

class _CurrentStockPageState extends State<CurrentStockPage> {
  Map<String, dynamic> stockData = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchStockData();
  }

  Future<void> fetchStockData() async {
    final apiKey = 'G33Z7BXADP0BNI70';
    final symbols = ['005930.KS', 'AAPL']; // 예시 심볼들
    final responses = await Future.wait(symbols.map((symbol) =>
        http.get(Uri.parse('https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=$symbol&interval=5min&apikey=$apiKey'))));

    setState(() {
      for (var i = 0; i < symbols.length; i++) {
        if (responses[i].statusCode == 200) {
          final data = jsonDecode(responses[i].body);
          stockData[symbols[i]] = data['Time Series (5min)']?.values?.first;
        }
      }
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('현재 주식 정보', style: TextStyle(color: Colors.white, fontSize: 24)),
              const SizedBox(height: 20),
              Column(
                children: stockData.entries.map((entry) {
                  final symbol = entry.key;
                  final data = entry.value;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(symbol, style: const TextStyle(color: Colors.white, fontSize: 18)),
                        const SizedBox(height: 10),
                        Text('현재가: ${data['4. close']}', style: const TextStyle(color: Colors.white)),
                        Text('고가: ${data['2. high']}', style: const TextStyle(color: Colors.white)),
                        Text('저가: ${data['3. low']}', style: const TextStyle(color: Colors.white)),
                        Text('거래량: ${data['5. volume']}', style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
