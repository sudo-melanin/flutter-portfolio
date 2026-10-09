import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/app_shell.dart';
import 'models/project.dart';

class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.xxl,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _BackButton(),
                const SizedBox(height: AppSpacing.xl),
                _ProjectHeader(project: project),
                const SizedBox(height: AppSpacing.xxl),
                _ProjectPreview(),
                const SizedBox(height: AppSpacing.xxl),
                _Section(
                  title: 'Overview',
                  child: Text(
                    project.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.7,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.xxl),
                _Section(
                  title: 'Key Features',
                  child: Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.md,
                    children: [
                      for (final feature in project.features)
                        _FeatureItem(feature: feature),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xxl),
                _Section(
                  title: 'Technology Stack',
                  child: Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      for (final technology in project.technologies)
                        _TechnologyChip(label: technology),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xxl),
                _EngineeringSection(project: project),
                if (project.githubUrl != null || project.apkUrl != null) ...[
                  const SizedBox(height: AppSpacing.xxl),
                  _ProjectLinks(project: project),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => context.go('/projects'),
      icon: const Icon(Icons.arrow_back_rounded),
      label: const Text('Back to projects'),
    );
  }
}

class _ProjectHeader extends StatelessWidget {
  const _ProjectHeader({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                project.name,
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            _StatusBadge(status: project.status),
          ],
        ),
      ],
    );
  }
}

class _ProjectPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.image_outlined,
              size: 64,
              color: AppColors.textSecondary,
            ),
            SizedBox(height: AppSpacing.md),
            Text(
              'Project screenshots coming soon',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppSpacing.lg),
        child,
      ],
    );
  }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({required this.feature});

  final String feature;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            size: 20,
            color: AppColors.primaryLight,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              feature,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}

class _TechnologyChip extends StatelessWidget {
  const _TechnologyChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _EngineeringSection extends StatelessWidget {
  const _EngineeringSection({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final content = switch (project.name) {
      'CoreLog' => (
        'Offline-first architecture',
        'Designed around local persistence and domain-driven workflows, '
            'with task execution, active-time tracking and historical records '
            'as core parts of the application.',
      ),
      'Police Hub' => (
        'Offline-first knowledge platform',
        'Combines remote Supabase data with local caching so important '
            'learning and reference content remains useful when connectivity '
            'is limited.',
      ),
      'AI Background Remover' => (
        'API and native device integration',
        'Connects a Flutter interface to the Remove.bg API while integrating '
            'gallery selection, image saving, sharing and local history.',
      ),
      'FitLink' => (
        'Location-aware matching and realtime communication',
        'Uses location data and PostGIS-based proximity queries to support '
            'nearby discovery, matchmaking and realtime communication between users.',
      ),
      'Weatherly' => (
        'Cross-platform Flutter engineering',
        'Built to adapt across mobile, web and desktop while combining remote '
            'weather data with local caching and responsive layouts.',
      ),
      'Sovereign Ledger' => (
        'Offline-first financial tracking',
        'Uses local persistence and structured state management to support '
            'transactions, budgets, recurring entries, insights and exports.',
      ),
      _ => (
        'Engineering approach',
        'Built with Flutter and a focus on maintainable application structure, '
            'reusable components and practical user workflows.',
      ),
    };

    return _Section(
      title: 'Engineering Approach',
      child: Container(
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
              content.$1,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              content.$2,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectLinks extends StatelessWidget {
  const _ProjectLinks({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Project Links',
      child: Wrap(
        spacing: AppSpacing.md,
        runSpacing: AppSpacing.md,
        children: [
          if (project.githubUrl != null)
            ElevatedButton.icon(
              onPressed: () {
                launchUrl(
                  Uri.parse(project.githubUrl!),
                  webOnlyWindowName: '_blank',
                );
              },
              icon: const Icon(Icons.code_rounded),
              label: const Text('View on GitHub'),
            ),
          if (project.apkUrl != null)
            OutlinedButton.icon(
              onPressed: () {
                launchUrl(
                  Uri.parse(project.apkUrl!),
                  webOnlyWindowName: '_blank',
                );
              },
              icon: const Icon(Icons.download_rounded),
              label: const Text('Download APK'),
            ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final isCompleted = status == 'Completed';

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: isCompleted
            ? AppColors.surfaceElevated
            : AppColors.primary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        status,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: isCompleted ? AppColors.textSecondary : AppColors.primaryLight,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
