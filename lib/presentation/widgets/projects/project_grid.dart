import 'package:flutter/material.dart';
import 'package:professional_profile/core/utils/custom_page_route.dart';
import 'package:professional_profile/core/utils/responsive_utils.dart';
import 'package:professional_profile/domain/entities/project.dart';
import 'package:professional_profile/presentation/widgets/projects/project_card.dart';
import 'package:professional_profile/presentation/widgets/projects/project_details.dart';

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
        crossAxisSpacing: 13,
        mainAxisSpacing: 12,
      ),
      itemCount: projects.length,
      itemBuilder: (context, i) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              CustomPageRoute(
                child: ProjectDetails(project: projects[i]),
              ),
            );
          },
          child: ProjectCard(project: projects[i]),
        ),
      ),
    );
  }
}
