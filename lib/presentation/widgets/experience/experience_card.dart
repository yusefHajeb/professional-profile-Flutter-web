import 'package:flutter/material.dart';
import 'package:professional_profile/domain/entities/experience.dart';
import 'package:professional_profile/presentation/widgets/common/animated_fade_scale.dart';

class ExperienceCard extends StatelessWidget {
  final Experience experience;

  const ExperienceCard({Key? key, required this.experience}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeScale(
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ExpansionTile(
          leading: Image.network(
            experience.companyLogo,
            width: 40,
            height: 40,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.business, size: 40),
          ),
          title: Text(
            experience.companyName,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          children: experience.positions
              .map((position) => _buildPositionTile(context, position))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildPositionTile(BuildContext context, Position position) {
    return ListTile(
      title: Text(
        position.title,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            position.duration,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          ...position.responsibilities
              .map((responsibility) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• '),
                        Expanded(child: Text(responsibility)),
                      ],
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
