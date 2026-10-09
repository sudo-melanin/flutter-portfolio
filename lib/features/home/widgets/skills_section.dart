import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
                'Skills',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 700;

                  final cards = [
                    _SkillCard(
                      title: 'Flutter & Dart',
                      skills: ['Flutter', 'Dart', 'Responsive UI', 'REST APIs'],
                    ),
                    _SkillCard(
                      title: 'State & Architecture',
                      skills: [
                        'Riverpod',
                        'Clean Architecture',
                        'Feature-First',
                        'MVVM',
                      ],
                    ),
                    _SkillCard(
                      title: 'Backend & Data',
                      skills: [
                        'Supabase',
                        'Firebase',
                        'PostgreSQL',
                        'SQLite',
                        'Hive',
                      ],
                    ),
                    _SkillCard(
                      title: 'Tools & Workflow',
                      skills: ['Git', 'GitHub', 'CI/CD', 'Figma'],
                    ),
                  ];

                  if (isMobile) {
                    return Column(
                      children: [
                        for (final card in cards) ...[
                          card,
                          const SizedBox(height: AppSpacing.md),
                        ],
                      ],
                    );
                  }

                  final cardWidth = (constraints.maxWidth - AppSpacing.md) / 2;

                  return Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.md,
                    children: [
                      for (final card in cards)
                        SizedBox(width: cardWidth, child: card),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  const _SkillCard({required this.title, required this.skills});

  final String title;
  final List<String> skills;

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
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              for (final skill in skills)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceElevated,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    skill,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
