import 'package:flutter/material.dart';

import '../../../core/constants/app_breakpoints.dart';
import '../../../core/routing/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile =
        MediaQuery.sizeOf(context).width < AppBreakpoints.mobile;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.section,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1100,
          ),
          child: isMobile
              ? const _MobileHero()
              : const _DesktopHero(),
        ),
      ),
    );
  }
}

class _DesktopHero extends StatelessWidget {
  const _DesktopHero();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 3,
          child: _HeroContent(),
        ),
        const SizedBox(width: AppSpacing.xxl),
        Expanded(
          flex: 2,
          child: _HeroVisual(),
        ),
      ],
    );
  }
}

class _MobileHero extends StatelessWidget {
  const _MobileHero();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HeroContent(),
        SizedBox(height: AppSpacing.xxl),
        _HeroVisual(),
      ],
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello, I\'m',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.primaryLight,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Amos Emmanuel',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w800,
                height: 1.1,
              ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'Flutter & Dart Developer',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 620,
          ),
          child: Text(
            'I build cross-platform mobile applications with Flutter and Dart, '
            'with a focus on clean architecture, maintainable code and practical '
            'user experiences.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.7,
                ),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        const _HeroActions(),
      ],
    );
  }
}

class _HeroActions extends StatelessWidget {
  const _HeroActions();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        FilledButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.projects);
          },
          child: const Text('View Projects'),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.contact);
          },
          child: const Text('Contact Me'),
        ),
      ],
    );
  }
}

class _HeroVisual extends StatelessWidget {
  const _HeroVisual();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.code_rounded,
          size: 80,
          color: AppColors.primaryLight,
        ),
      ),
    );
  }
}