import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isWideScreen ? 64 : 16,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'A summary of my professional journey and key roles',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        const SizedBox(height: 32),
                        if (isWideScreen)
                          GridView.count(
                            crossAxisCount: 2,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            clipBehavior: Clip.none,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            semanticChildCount: state.experiences.length,
                            // childAspectRatio: 1.5,
                            children: List.generate(
                              state.experiences.length,
                              (index) => AnimatedFadeScale(
                                duration: Duration(milliseconds: 100 * index),
                                child: ExperienceCard(
                                  experience: state.experiences[index],
                                  isFirst: index == 0,
                                  isLast: index == state.experiences.length - 1,
                                ),
                              ),
                            ),
                          )
                        else
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.experiences.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ExperienceCard(
                                    experience: state.experiences[index],
                                    isFirst: index == 0,
                                    isLast:
                                        index == state.experiences.length - 1,
                                  ),
                                  if (index < state.experiences.length - 1)
                                    TimelineConnector(
                                      color: Theme.of(context).primaryColor,
                                      isFirst: index == 0,
                                      isLast:
                                          index == state.experiences.length - 1,
                                    ),
                                ],
                              );
                            },
                          ),
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
}
