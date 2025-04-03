import 'package:flutter/material.dart';
import 'package:professional_profile/core/utils/responsive_utils.dart';
import 'package:professional_profile/domain/entities/project.dart';
import 'package:professional_profile/presentation/widgets/projects/project_card.dart';

class ProjectGrid extends StatelessWidget {
  final List<Project> projects;

  const ProjectGrid({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = ResponsiveUtils.getCrossAxisCount(screenWidth);
    final childAspectRatio = ResponsiveUtils.getChildAspectRatio(screenWidth);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
      ),
      itemCount: projects.length,
      itemBuilder: (context, i) => ProjectCard(project: projects[i]),
    );
  }
}
