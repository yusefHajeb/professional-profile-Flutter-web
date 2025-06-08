import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:professional_profile/core/utils/responsive_utils.dart';
import 'package:professional_profile/presentation/bloc/projects_bloc.dart';
import 'package:professional_profile/presentation/widgets/common/section_title.dart';
import 'package:professional_profile/presentation/widgets/projects/project_grid.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitle(title: 'Projects'),
          const SizedBox(height: 16),
          Text(
            'A showcase of my recent work and accomplishments',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: ResponsiveUtils.getContentWidth(context),
            child: BlocBuilder<ProjectsBloc, ProjectsState>(
              builder: (context, state) {
                if (state is ProjectsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ProjectsLoaded) {
                  return ProjectGrid(projects: state.projects);
                }
                if (state is ProjectsError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
