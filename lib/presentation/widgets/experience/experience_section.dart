import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:professional_profile/core/utils/responsive_utils.dart';
import 'package:professional_profile/domain/entities/experience.dart';
import 'package:professional_profile/presentation/bloc/experience_bloc.dart';
import 'package:professional_profile/presentation/widgets/common/animated_fade_scale.dart';
import 'package:professional_profile/presentation/widgets/common/section_title.dart';
import 'package:professional_profile/presentation/widgets/experience/experience_card.dart';
import 'package:professional_profile/presentation/widgets/experience/timeline_connector.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExperienceBloc, ExperienceState>(
      builder: (context, state) {
        if (state is ExperienceLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ExperienceLoaded) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: SectionTitle(
                    title: 'Experience',
                  ),
                ),
                const SizedBox(height: 32),
                LayoutBuilder(builder: (context, constraints) {
                  final isWideScreen = constraints.maxWidth > 800;
                  final isTablet = constraints.maxWidth > 600;

                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isWideScreen ? 64 : (isTablet ? 32 : 16),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'A summary of my professional journey and key roles',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 32),
                        if (isWideScreen)
                          _buildGridLayout(context, state.experiences)
                        else
                          _buildListLayout(context, state.experiences),
                      ],
                    ),
                  );
                }),
              ],
            ),
          );
        } else if (state is ExperienceError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildGridLayout(BuildContext context, List<Experience> experiences) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 1000, // Maximum width for each item
        mainAxisSpacing: 16,

        crossAxisSpacing: 16,
        childAspectRatio: 1, // Will be overridden by intrinsic height
        mainAxisExtent: null, // Let children determine their own height
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: experiences.length,
      itemBuilder: (context, index) {
        return AnimatedFadeScale(
          duration: Duration(milliseconds: 100 * (index + 1)),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 200,
              minWidth: 200,
              maxWidth: (ResponsiveUtils.getContentWidth(context) / 2.3),
              maxHeight: double.infinity,
            ),
            child: ExperienceCard(
              experience: experiences[index],
              isFirst: true,
              isLast: index == experiences.length - 1,
            ),
          ),
        );
      },
    );
  }

  Widget _buildListLayout(BuildContext context, List<Experience> experiences) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: experiences.length,
      separatorBuilder: (context, index) => TimelineConnector(
        color: Theme.of(context).primaryColor,
        isFirst: index == 0,
        isLast: index == experiences.length - 2,
      ),
      itemBuilder: (context, index) {
        return AnimatedFadeScale(
          duration: Duration(milliseconds: 100 * (index + 1)),
          child: ExperienceCard(
            experience: experiences[index],
            isFirst: index == 0,
            isLast: index == experiences.length - 1,
          ),
        );
      },
    );
  }
}
