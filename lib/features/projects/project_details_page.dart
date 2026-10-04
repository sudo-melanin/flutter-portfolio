import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/app_shell.dart';
import 'models/project.dart';

class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({
    required this.project,
    super.key,
  });

  final Project project;

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
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.name,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  project.status,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.primaryLight,
                      ),
                ),
                const SizedBox(height: AppSpacing.xl),
                _ProjectPreview(),
                const SizedBox(height: AppSpacing.xxl),
                _DetailSection(
                  title: 'Overview',
                  child: Text(
                    project.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.7,
                        ),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                _DetailSection(
                  title: 'Key Features',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final feature in project.features)
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppSpacing.sm,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 6),
                                child: Icon(
                                  Icons.check_circle_outline,
                                  size: 18,
                                  color: AppColors.primaryLight,
                                ),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: Text(
                                  feature,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
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
                ),
                const SizedBox(height: AppSpacing.xl),
                _DetailSection(
                  title: 'Technology Stack',
                  child: Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      for (final technology in project.technologies)
                        Chip(
                          label: Text(technology),
                        ),
                    ],
                  ),
                ),
                if (project.githubUrl != null || project.apkUrl != null) ...[
                  const SizedBox(height: AppSpacing.xl),
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

class _ProjectPreview extends StatelessWidget {
  const _ProjectPreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.phone_android_rounded,
          size: 80,
          color: AppColors.primaryLight,
        ),
      ),
    );
  }
}

class _ProjectLinks extends StatelessWidget {
  const _ProjectLinks({
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        if (project.githubUrl != null)
          FilledButton.icon(
            onPressed: () async {
              final url = Uri.parse(project.githubUrl!);

              await launchUrl(
                url,
                webOnlyWindowName: '_blank',
              );
            },
            icon: const Icon(Icons.code),
            label: const Text('View on GitHub'),
          ),
        if (project.apkUrl != null)
          OutlinedButton.icon(
            onPressed: () async {
              final url = Uri.parse(project.apkUrl!);

              await launchUrl(
                url,
                webOnlyWindowName: '_blank',
              );
            },
            icon: const Icon(Icons.download),
            label: const Text('Download APK'),
          ),
      ],
    );
  }
}

class _DetailSection extends StatelessWidget {
  const _DetailSection({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(height: AppSpacing.md),
        child,
      ],
    );
  }
}