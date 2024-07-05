import 'package:flutter/material.dart';

class InterestProvider with ChangeNotifier {
  final List<Map<String, String>> _interests = [];

  List<Map<String, String>> get interests => _interests;

  void addInterest(Map<String, String> newsItem) {
    _interests.add(newsItem);
    notifyListeners();
  }

  void removeInterest(Map<String, String> newsItem) {
    _interests.removeWhere((item) => item['title'] == newsItem['title']);
    notifyListeners();
  }

  bool isInterest(Map<String, String> newsItem) {
    return _interests.any((item) => item['title'] == newsItem['title']);
  }
}
