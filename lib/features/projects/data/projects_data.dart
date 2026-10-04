import '../models/project.dart';

abstract final class ProjectsData {
  static const projects = [
    Project(
      name: 'FitLink',
      description:
          'A fitness-focused mobile application built with Flutter, '
          'designed to connect users with fitness activities and services.',
      technologies: [
        'Flutter',
        'Dart',
        'Supabase',
        'Riverpod',
      ],
      features: [
        'User authentication',
        'Fitness discovery',
        'Profile management',
        'Responsive mobile interface',
      ],
      status: 'In Progress',
      githubUrl: 'https://github.com/sudo-melanin/fitlink-app',
    ),
    Project(
      name: 'Police Hub',
      description:
          'A learning platform designed around police history, code of conduct, '
          'personnel information and examination preparation.',
      technologies: [
        'Flutter',
        'Dart',
        'Supabase',
        'Riverpod',
      ],
      features: [
        'Learning content',
        'Exam preparation',
        'Police history resources',
        'Offline data access',
      ],
      status: 'In Progress',
      githubUrl: 'https://github.com/sudo-melanin/npf_officer_hub',
    ),
    Project(
      name: 'Smart Utility Toolkit',
      description:
          'A collection of practical utilities developed during mobile '
          'development training.',
      technologies: [
        'Flutter',
        'Dart',
        'Hive',
        'Provider',
      ],
      features: [
        'Task management',
        'Local data persistence',
        'Utility tools',
        'Responsive interface',
      ],
      status: 'Completed',
      githubUrl: 'https://github.com/sudo-melanin/smart_utility_toolkit',
    ),
  ];
}