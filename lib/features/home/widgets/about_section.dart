import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
                'About Me',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              const _AboutContent(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AboutContent extends StatelessWidget {
  const _AboutContent();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;

        if (isMobile) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AboutText(),
              SizedBox(height: AppSpacing.xl),
              _AboutHighlights(),
            ],
          );
        }

        return const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 3, child: _AboutText()),
            SizedBox(width: AppSpacing.xl),
            Expanded(flex: 2, child: _AboutHighlights()),
          ],
        );
      },
    );
  }
}

class _AboutText extends StatelessWidget {
  const _AboutText();

  @override
  Widget build(BuildContext context) {
    return Text(
      'I am a Flutter and Dart developer focused on building practical, '
      'reliable cross-platform mobile applications that solve real problems. '
      'Beyond creating interfaces, I care about how applications are '
      'structured, how data is managed, and how software can remain '
      'maintainable as it grows.\n\n'
      'My background in Chemical Engineering has shaped my approach to '
      'software development. I enjoy understanding how systems work, '
      'breaking complex problems into manageable parts, and finding '
      'solutions that balance functionality, efficiency and usability. '
      'I bring this mindset into my work, with a focus on clean architecture, '
      'thoughtful user experiences and maintainable code.\n\n'
      'I am particularly interested in building products that address '
      'everyday challenges, from productivity tools and location-based '
      'platforms to applications designed to remain useful with limited '
      'internet connectivity.',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: AppColors.textSecondary,
        height: 1.8,
      ),
    );
  }
}

class _AboutHighlights extends StatelessWidget {
  const _AboutHighlights();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _HighlightCard(
          title: 'Mobile Development',
          description:
              'Flutter, Dart and cross-platform application development.',
        ),
        SizedBox(height: AppSpacing.md),
        _HighlightCard(
          title: 'Software Engineering',
          description:
              'Clean architecture, maintainable code and practical solutions.',
        ),
        SizedBox(height: AppSpacing.md),
        _HighlightCard(
          title: 'Engineering Background',
          description:
              'Process engineering, analysis and continuous improvement.',
        ),
      ],
    );
  }
}

class _HighlightCard extends StatelessWidget {
  const _HighlightCard({required this.title, required this.description});

  final String title;
  final String description;

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
          const SizedBox(height: AppSpacing.sm),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
