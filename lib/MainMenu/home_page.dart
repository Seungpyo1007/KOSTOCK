import 'package:flutter/material.dart';
import 'current_stock_page.dart';
import 'news_page.dart';
import 'interest_page.dart';
import '../BotSetting/xs_chatbot.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
