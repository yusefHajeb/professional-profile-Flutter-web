import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:professional_profile/presentation/bloc/experience_bloc.dart';
import 'package:professional_profile/presentation/widgets/common/section_title.dart';
import 'package:professional_profile/presentation/widgets/experience/experience_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExperienceBloc, ExperienceState>(
      builder: (context, state) {
        if (state is ExperienceLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ExperienceLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'Experience'),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.experiences.length,
                itemBuilder: (context, index) {
                  return ExperienceCard(experience: state.experiences[index]);
                },
              ),
            ],
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
