import 'package:flutter/material.dart';
import 'package:professional_profile/config/responsive_layout_config.dart';
import 'package:professional_profile/domain/entities/project.dart';
import 'package:professional_profile/presentation/widgets/common/animated_fade_in.dart';
import 'package:professional_profile/presentation/widgets/projects/project_card.dart';

class ProjectGrid extends StatelessWidget {
  final List<Project> projects;

  const ProjectGrid({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutConfig.responsive(
      mobile: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return AnimatedFadeIn(
            delay: Duration(milliseconds: 300 + (index * 100)),
            child: ProjectCard(project: project),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
          childAspectRatio: 1,
        ),
      ),
      tablet: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return AnimatedFadeIn(
            delay: Duration(milliseconds: 300 + (index * 100)),
            child: ProjectCard(project: project),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 20,
          childAspectRatio: 0.8,
        ),
      ),
      desktop: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return AnimatedFadeIn(
            delay: Duration(milliseconds: 300 + (index * 100)),
            child: ProjectCard(project: project),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 14,
          childAspectRatio: 1.5,
        ),
      ),
    );
  }
}
