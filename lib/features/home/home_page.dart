import 'package:flutter/material.dart';

import '../../core/widgets/app_shell.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShell(
      child: Center(
        child: Text('Home'),
      ),
    );
  }
}