import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routing/app_routes.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../constants/app_breakpoints.dart';

class AppShell extends StatelessWidget {
  const AppShell({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const _AppHeader(),
          Expanded(child: child),
          const _AppFooter(),
        ],
      ),
    );
  }
}

class _AppHeader extends StatelessWidget {
  const _AppHeader();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < AppBreakpoints.mobile;

    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.md,
      ),
      child: Row(
        children: [
          const Text(
            'AMOS EMMANUEL',
            style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 1.2),
          ),
          const Spacer(),
          if (isMobile)
            const _MobileMenuButton()
          else
            const _DesktopNavigation(),
        ],
      ),
    );
  }
}

class _DesktopNavigation extends StatelessWidget {
  const _DesktopNavigation();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _NavItem(label: 'Home', route: AppRoutes.home),
        _NavItem(label: 'Projects', route: AppRoutes.projects),
        _NavItem(label: 'Experience', route: AppRoutes.experience),
        _NavItem(label: 'Contact', route: AppRoutes.contact),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.label, required this.route});

  final String label;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSpacing.lg),
      child: TextButton(
        onPressed: () {
          context.go(route);
        },
        child: Text(label),
      ),
    );
  }
}

class _MobileMenuButton extends StatelessWidget {
  const _MobileMenuButton();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.menu),
      onSelected: (route) {
        context.go(route);
      },
      itemBuilder: (context) => const [
        PopupMenuItem(value: AppRoutes.home, child: Text('Home')),
        PopupMenuItem(value: AppRoutes.projects, child: Text('Projects')),
        PopupMenuItem(value: AppRoutes.experience, child: Text('Experience')),
        PopupMenuItem(value: AppRoutes.contact, child: Text('Contact')),
      ],
    );
  }
}

class _AppFooter extends StatelessWidget {
  const _AppFooter();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: const Text('© 2026 Amos Emmanuel', textAlign: TextAlign.center),
    );
  }
}
