import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'interest_provider.dart';

class InterestPage extends StatelessWidget {
  const InterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InterestProvider>(
      builder: (context, interestProvider, child) {
        if (interestProvider.interests.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star_border, color: Colors.grey, size: 100),
                SizedBox(height: 20),
                Text(
                  '관심종목을 등록해주세요',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          itemCount: interestProvider.interests.length,
          itemBuilder: (context, index) {
            final newsItem = interestProvider.interests[index];
            return InterestItem(
              title: newsItem['title']!,
              imageUrl: newsItem['imageUrl']!,
            );
          },
        );
      },
    );
  }
}

class InterestItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  const InterestItem({super.key, required this.title, required this.imageUrl});

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
