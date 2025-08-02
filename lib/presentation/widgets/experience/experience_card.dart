import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_profile/domain/entities/experience.dart';
import 'package:professional_profile/presentation/widgets/common/animated_fade_in.dart';
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
            showTrailingIcon: false,

            // textColor: theme.primaryColor,
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
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: theme.primaryColor,
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
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            children: [
              Icon(Icons.work_outline, color: theme.primaryColor, size: 20),
              const SizedBox(width: 8),
              Text(
                position.title,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
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
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: theme.primaryColor.withOpacity(0.7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedFadeIn(
                        delay: Duration(milliseconds: 100 * index),
                        child: Icon(Icons.check_circle,
                            color: theme.primaryColor, size: 20),
                      ),
                      const SizedBox(width: 8),
                      AnimatedFadeIn(
                        delay: Duration(milliseconds: 150 * index),
                        child: Expanded(
                          child: Text(
                            position.responsibilities[index],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              height: 1.5,
                              wordSpacing: 1.2,
                              color: theme.primaryColor.withOpacity(0.8),
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: position.responsibilities.length),
        ],
      ),
    );
  }
}
