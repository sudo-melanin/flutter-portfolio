import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/app_shell.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.section,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Experience',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'A background that combines software development with engineering '
                  'and analytical problem-solving.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxl),

                const _ExperienceSection(
                  title: 'Mobile Application Development',
                  experiences: [
                    _ExperienceItem(
                      role: 'Mobile Application Developer',
                      company: 'Share Studios',
                      period: 'Jul 2025 - Present',
                      description:
                          'Developing and maintaining cross-platform mobile '
                          'applications with Flutter and Dart, with a focus on '
                          'clean architecture, maintainability and scalable '
                          'application structure.',
                      highlights: [
                        'Flutter and Dart application development',
                        'Feature-based application architecture',
                        'State management with Riverpod',
                        'Supabase and Firebase integration',
                        'REST API integration and local data persistence',
                      ],
                    ),
                    _ExperienceItem(
                      role: 'Mobile Development Intern',
                      company: 'HNG Internship 14',
                      period: 'Mar 2026 - May 2026',
                      description:
                          'Built practical Flutter applications as part of an '
                          'intensive software development internship, working '
                          'with APIs, local persistence and application state.',
                      highlights: [
                        'Built Flutter mobile applications',
                        'Worked with REST APIs and local storage',
                        'Applied Provider and Flutter application patterns',
                        'Collaborated through Git and GitHub workflows',
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.section),

                const _ExperienceSection(
                  title: 'Process Engineering & Analysis',
                  experiences: [
                    _ExperienceItem(
                      role: 'Process Engineering & Analysis',
                      company: 'Manufacturing & Production Environment',
                      period: '6 Years',
                      description:
                          'Applied engineering analysis and production '
                          'experience to improve process performance, equipment '
                          'reliability, quality and operational efficiency.',
                      highlights: [
                        'Production and process performance analysis',
                        'KPI monitoring and performance improvement',
                        'Root cause analysis and troubleshooting',
                        'Process optimisation and waste reduction',
                        'Cross-functional technical problem-solving',
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.section),

                const _WhatIBring(),

                const SizedBox(height: AppSpacing.section),

                _ExperienceCta(
                  onPressed: () {
                    context.go('/contact');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ExperienceSection extends StatelessWidget {
  const _ExperienceSection({required this.title, required this.experiences});

  final String title;
  final List<_ExperienceItem> experiences;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: AppSpacing.lg),
        for (final experience in experiences) ...[
          experience,
          if (experience != experiences.last)
            const SizedBox(height: AppSpacing.lg),
        ],
      ],
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  const _ExperienceItem({
    required this.role,
    required this.company,
    required this.period,
    required this.description,
    required this.highlights,
  });

  final String role;
  final String company;
  final String period;
  final String description;
  final List<String> highlights;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      role,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      company,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.primaryLight,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Text(
                period,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          for (final highlight in highlights)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.check_circle_outline,
                      size: 17,
                      color: AppColors.primaryLight,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      highlight,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _WhatIBring extends StatelessWidget {
  const _WhatIBring();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What I Bring',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'I bring a combination of software development skills and an '
            'engineering mindset to building practical, reliable applications. '
            'My background in process engineering and analysis has strengthened '
            'the way I approach problem-solving, systems thinking and continuous '
            'improvement in software development.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceCta extends StatelessWidget {
  const _ExperienceCta({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Interested in working together?',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Let’s talk about your next mobile application.',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),
          FilledButton(onPressed: onPressed, child: const Text('Get in Touch')),
        ],
      ),
    );
  }
}
