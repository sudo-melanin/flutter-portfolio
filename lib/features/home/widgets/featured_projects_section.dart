import 'package:flutter/material.dart';

import '../../../core/routing/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import 'package:go_router/go_router.dart';

class FeaturedProjectsSection extends StatelessWidget {
  const FeaturedProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.lg,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Featured Projects',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'A selection of applications I have built with Flutter and Dart.',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: AppSpacing.lg),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 700;

                  final projects = [
                    const _ProjectCard(
                      name: 'FitLink',
                      description:
                          'A fitness-focused mobile application built with Flutter.',
                      technologies: ['Flutter', 'Dart', 'Supabase', 'Riverpod'],
                    ),
                    const _ProjectCard(
                      name: 'Police Hub',
                      description:
                          'A learning platform designed for police history, '
                          'code of conduct and exam preparation.',
                      technologies: ['Flutter', 'Dart', 'Supabase', 'Riverpod'],
                    ),
                    const _ProjectCard(
                      name: 'Smart Utility Toolkit',
                      description:
                          'A collection of practical utilities built during '
                          'mobile development training.',
                      technologies: ['Flutter', 'Dart', 'Hive', 'Provider'],
                    ),
                  ];

                  if (isMobile) {
                    return Column(
                      children: [
                        for (final project in projects) ...[
                          project,
                          const SizedBox(height: AppSpacing.md),
                        ],
                      ],
                    );
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var i = 0; i < projects.length; i++) ...[
                        Expanded(child: projects[i]),
                        if (i < projects.length - 1)
                          const SizedBox(width: AppSpacing.md),
                      ],
                    ],
                  );
                },
              ),
              const SizedBox(height: AppSpacing.xl),
              Center(
                child: OutlinedButton(
                  onPressed: () => context.go(AppRoutes.projects),
                  child: const Text('View All Projects'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.name,
    required this.description,
    required this.technologies,
  });

  final String name;
  final String description;
  final List<String> technologies;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Icon(
                Icons.phone_android_rounded,
                size: 48,
                color: AppColors.primaryLight,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            name,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              for (final technology in technologies)
                Text(
                  technology,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.primaryLight,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
