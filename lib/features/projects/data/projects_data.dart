import '../models/project.dart';

abstract final class ProjectsData {
  static const projects = [
    Project(
      name: 'CoreLog',
      description:
          'An offline-first personal productivity app that connects '
          'planning, task execution, time tracking and productivity insights '
          'in one workspace.',
      technologies: [
        'Flutter',
        'Dart',
        'Riverpod',
        'Drift/SQLite',
        'GoRouter',
        'fpdart',
      ],
      features: [
        'Task execution lifecycle',
        'Execution session and active-time tracking',
        'Activity classification',
        'Execution history',
        'Habit tracking',
        'Productivity dashboard and metrics',
        'Offline persistence',
      ],
      status: 'In Progress',
      githubUrl: 'https://github.com/sudo-melanin/corelog',
      apkUrl:
          'https://github.com/sudo-melanin/corelog/releases/download/v1.0.0/corelog-v1.0.0.apk',
    ),
    Project(
      name: 'Police Hub',
      description:
          'An offline-first professional development platform for law '
          'enforcement and security personnel, providing searchable references, '
          'training resources and mock examinations in low-connectivity environments.',
      technologies: [
        'Flutter',
        'Dart',
        'Riverpod',
        'Supabase',
        'Hive',
        'GoRouter',
      ],
      features: [
        'Offline-first content access',
        'Searchable reference library',
        'Training resources',
        'Timed mock examinations',
        'Performance breakdown',
        'Supabase authentication',
        'Local caching and network fallback',
      ],
      status: 'In Progress',
      githubUrl: 'https://github.com/sudo-melanin/npf_officer_hub',
    ),
    Project(
      name: 'AI Background Remover',
      description:
          'A Flutter mobile utility that uses the Remove.bg API to '
          'automatically remove image backgrounds, preview the result, '
          'and save or share transparent images directly from the device.',
      technologies: [
        'Flutter',
        'Dart',
        'REST API',
        'Hive',
        'image_picker',
        'share_plus',
      ],
      features: [
        'AI background removal',
        'Gallery image selection',
        'Processing and download workflow',
        'Transparent image export',
        'Native image sharing',
        'Local processing history',
        'Network and error handling',
      ],
      status: 'Completed',
      githubUrl: 'https://github.com/sudo-melanin/image-bg-remover',
      apkUrl:
          'https://github.com/sudo-melanin/image-bg-remover/releases/download/v1.0.0/bg-remover-v1.0.0.apk',
    ),
    Project(
      name: 'FitLink',
      description:
          'A location-aware fitness platform connecting people with nearby '
          'gyms and workout partners.',
      technologies: [
        'Flutter',
        'Dart',
        'Supabase',
        'PostgreSQL',
        'PostGIS',
        'Riverpod',
      ],
      features: [
        'Location-based fitness discovery',
        'Workout partner matching',
        'Like and match system',
        'Real-time chat',
        'Media and message interactions',
        'Nearby gym discovery',
        'Gym search and verification',
      ],
      status: 'In Progress',
      githubUrl: 'https://github.com/sudo-melanin/fitlink-app',
    ),
    Project(
      name: 'Weatherly',
      description:
          'A cross-platform Flutter weather application delivering adaptive '
          'weather experiences across mobile, web and desktop from a single codebase.',
      technologies: ['Flutter', 'Dart', 'OpenWeatherMap', 'Hive', 'Provider'],
      features: [
        'Real-time weather and city search',
        'Location-based weather',
        'Hourly and five-day forecasts',
        'Offline weather caching',
        'Responsive layouts',
        'Desktop menus and keyboard shortcuts',
        'Dynamic weather themes and animations',
      ],
      status: 'Completed',
      githubUrl: 'https://github.com/sudo-melanin/hng-stage-3-weatherly-app',
      apkUrl:
          'https://github.com/sudo-melanin/hng-stage-3-weatherly-app/releases/download/v1.0.0/Weatherly-v1.0.0.apk',
    ),
    Project(
      name: 'Sovereign Ledger',
      description:
          'A Flutter finance tracking application for managing income, '
          'expenses, budgets and financial insights with offline-first local storage.',
      technologies: ['Flutter', 'Dart', 'Hive', 'Provider', 'CSV'],
      features: [
        'Income and expense tracking',
        'Budget management',
        'Recurring transactions',
        'Financial insights',
        'Offline-first local storage',
        'CSV export and sharing',
        'Multi-currency support',
      ],
      status: 'Completed',
      githubUrl: 'https://github.com/sudo-melanin/hng-stage-2-sovereign-ledger',
    ),
  ];
}
