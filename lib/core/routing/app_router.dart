import 'package:flutter/material.dart';

import '../../features/contact/contact_page.dart';
import '../../features/experience/experience_page.dart';
import '../../features/home/home_page.dart';
import '../../features/projects/projects_page.dart';
import 'app_routes.dart';

abstract final class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );

      case AppRoutes.projects:
        return MaterialPageRoute(
          builder: (_) => const ProjectsPage(),
        );

      case AppRoutes.experience:
        return MaterialPageRoute(
          builder: (_) => const ExperiencePage(),
        );

      case AppRoutes.contact:
        return MaterialPageRoute(
          builder: (_) => const ContactPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}