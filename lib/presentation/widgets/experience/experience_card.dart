import 'package:flutter/material.dart';
import 'package:professional_profile/domain/entities/experience.dart';
import 'package:professional_profile/presentation/widgets/common/animated_fade_scale.dart';

class ExperienceCard extends StatefulWidget {
  final Experience experience;
  final bool isFirst;
  final bool isLast;

  const ExperienceCard({
    Key? key,
    required this.experience,
    this.isFirst = false,
    this.isLast = false,
  }) : super(key: key);

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedFadeScale(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.cardColor,
                theme.cardColor.withOpacity(0.9),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: theme.primaryColor.withOpacity(isHovered ? 0.2 : 0.1),
                blurRadius: isHovered ? 20 : 10,
                spreadRadius: isHovered ? 5 : 0,
              ),
            ],
          ),
          child: ExpansionTile(
            initiallyExpanded: widget.isFirst,
            tilePadding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            iconColor: theme.primaryColor,
            collapsedIconColor: theme.primaryColor.withOpacity(0.7),
            textColor: theme.primaryColor,
            collapsedTextColor: theme.primaryColor.withOpacity(0.7),
            backgroundColor: theme.cardColor,
            collapsedBackgroundColor: theme.cardColor.withOpacity(0.9),
            maintainState: true,
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(
                widget.experience.companyLogo,
                width: 40,
                height: 40,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.business, size: 40, color: theme.primaryColor),
              ),
            ),
            title: Text(
              widget.experience.companyName,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: widget.experience.positions
                .map((position) => _buildPositionTile(context, position))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildPositionTile(BuildContext context, Position position) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.primaryColor.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.work_outline, color: theme.primaryColor, size: 20),
              const SizedBox(width: 8),
              Text(
                position.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.calendar_today, color: theme.primaryColor, size: 16),
              const SizedBox(width: 8),
              Text(
                position.duration,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.textTheme.bodySmall?.color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...position.responsibilities.map((responsibility) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_right,
                        color: theme.primaryColor, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        responsibility,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
