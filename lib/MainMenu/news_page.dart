import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '뉴스',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 10),
            NewsItem(
              title: '한화오션:HD현대, 조선박람회 \'포시도니아\'서 친환경 기술 선봬',
              imagePath: 'assets/news_image_1.png',
            ),
            SizedBox(height: 10),
            NewsItem(
              title: '주식 가치 하락에 따라 재평가하는 테슬라 투자자들',
              imagePath: 'assets/news_image_2.png',
            ),
            SizedBox(height: 10),
            NewsItem(
              title: 'UBS: 미국 주식보다 유럽 주식 선호',
              imagePath: 'assets/news_image_3.png',
            ),
          ],
        ),
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  final String title;
  final String imagePath;

  NewsItem({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          Image.asset(imagePath),
        ],
      ),
    );
  }
}
