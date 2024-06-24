import 'package:flutter/material.dart';

class ApiProvider extends InheritedWidget {
  final String apiKey;

  const ApiProvider({
    Key? key,
    required this.apiKey,
    required Widget child,
  }) : super(key: key, child: child);

  static ApiProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ApiProvider>();
  }

  @override
  bool updateShouldNotify(ApiProvider oldWidget) {
    return apiKey != oldWidget.apiKey;
  }
}
