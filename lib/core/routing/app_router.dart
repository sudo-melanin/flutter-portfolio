import 'package:go_router/go_router.dart';

import '../../features/contact/contact_page.dart';
import '../../features/experience/experience_page.dart';
import '../../features/home/home_page.dart';
import '../../features/projects/models/project.dart';
import '../../features/projects/project_details_page.dart';
import '../../features/projects/projects_page.dart';

abstract final class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/projects',
        builder: (context, state) => const ProjectsPage(),
      ),
      GoRoute(
        path: '/projects/details',
        builder: (context, state) {
          final project = state.extra;

          if (project is Project) {
            return ProjectDetailsPage(
              project: project,
            );
          }

          return const ProjectsPage();
        },
      ),
      GoRoute(
        path: '/experience',
        builder: (context, state) => const ExperiencePage(),
      ),
      GoRoute(
        path: '/contact',
        builder: (context, state) => const ContactPage(),
      ),
    ],
  );
}