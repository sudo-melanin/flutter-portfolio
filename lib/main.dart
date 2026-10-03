import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';
import 'core/routing/app_routes.dart';
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
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}