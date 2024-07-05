import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'interest_provider.dart';

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
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 10),
              for (var item in newsItems)
                NewsItem(
                  title: item['title'],
                  imageUrl: item['banner_image'] ?? '',
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  const NewsItem({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Consumer<InterestProvider>(
      builder: (context, interestProvider, child) {
        bool isInterested = interestProvider.isInterest({'title': title, 'imageUrl': imageUrl});
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isInterested ? Icons.star : Icons.star_border,
                      color: isInterested ? Colors.yellow : Colors.white,
                    ),
                    onPressed: () {
                      if (isInterested) {
                        interestProvider.removeInterest({'title': title, 'imageUrl': imageUrl});
                      } else {
                        interestProvider.addInterest({'title': title, 'imageUrl': imageUrl});
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (imageUrl.isNotEmpty)
                Image.network(imageUrl),
            ],
          ),
        );
      },
    );
  }
}
