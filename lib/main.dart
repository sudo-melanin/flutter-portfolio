import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp(const FlutterPortfolioApp());
}

class FlutterPortfolioApp extends StatelessWidget {
  const FlutterPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amos Emmanuel | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      home: const Scaffold(
        body: Center(
          child: Text('Flutter Portfolio'),
        ),
      ),
    );
  }
}