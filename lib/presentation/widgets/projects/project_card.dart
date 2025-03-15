import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_profile/domain/entities/project.dart';
import 'package:professional_profile/presentation/widgets/common/hover_scale.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return HoverScale(
      child: Card(
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              fit: FlexFit.loose,
              flex: 3,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  project.imageUrl,
                  // height: ResponsiveLayoutConfig.screenHeight / 5,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      project.description,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    // const SizedBox(height: 16),
                    // Wrap(
                    //   spacing: 8,
                    //   runSpacing: 8,
                    //   children: project.technologies
                    //       .map((tech) => Chip(
                    //             label: Text(tech),
                    //             backgroundColor: Theme.of(context)
                    //                 .primaryColor
                    //                 .withOpacity(0.1),
                    //           ))
                    //       .toList(),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
