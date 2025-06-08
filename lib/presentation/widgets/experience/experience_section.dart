import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:professional_profile/presentation/bloc/experience_bloc.dart';
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
                          isLast: index == state.experiences.length - 1,
                        ),
                        if (index < state.experiences.length - 1)
                          TimelineConnector(
                            color: Theme.of(context).primaryColor,
                            isFirst: index == 0,
                            isLast: index == state.experiences.length - 1,
                          ),
                      ],
                    );
                  },
                ),
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
