import 'package:flutter/material.dart';

import '../../core/widgets/app_shell.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShell(
      child: Center(
        child: Text('Projects'),
      ),
    );
  }
}