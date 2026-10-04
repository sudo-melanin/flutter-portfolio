import 'package:flutter/material.dart';
import 'package:flutter_portfolio/features/home/widgets/contact_cta_section.dart';
import 'package:flutter_portfolio/features/home/widgets/featured_projects_section.dart';
import 'package:flutter_portfolio/features/home/widgets/skills_section.dart';

import '../../core/widgets/app_shell.dart';
import 'widgets/about_section.dart';
import 'widgets/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShell(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            AboutSection(),
            SkillsSection(),
            FeaturedProjectsSection(),
            ContactCtaSection(),
          ],
                  ),
      ),
    );
  }
}