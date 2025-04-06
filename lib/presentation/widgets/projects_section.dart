// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:professional_profile/domain/entities/project.dart';
// import 'package:professional_profile/presentation/bloc/projects_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:professional_profile/presentation/widgets/common/animated_fade_in.dart';
// import 'package:professional_profile/presentation/widgets/common/hover_scale.dart';
// import 'package:professional_profile/presentation/widgets/common/section_title.dart';

// class ProjectsSection extends StatelessWidget {
//   const ProjectsSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ProjectsBloc()..add(LoadProjects()),
//       child: Container(
//         padding: const EdgeInsets.all(32.0),
//         child: Column(
//           children: [
//             const SectionTitle(title: 'Projects'),
//             const SizedBox(height: 32),
//             BlocBuilder<ProjectsBloc, ProjectsState>(
//               builder: (context, state) {
//                 if (state is ProjectsLoading) {
//                   return const CircularProgressIndicator();
//                 }
//                 if (state is ProjectsLoaded) {
//                   return Wrap(
//                     spacing: 24,
//                     // runSpacing: 24,
//                     children: state.projects
//                         .asMap()
//                         .entries
//                         .map((entry) => AnimatedFadeIn(
//                               delay: Duration(
//                                   milliseconds: 300 + (entry.key * 100)),
//                               child: Flexible(
//                                 child: ProjectCard(project: entry.value),
//                               ),
//                             ))
//                         .toList(),
//                   );
//                 }
//                 return const Text('Error loading projects');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ProjectCard extends StatelessWidget {
//   final Project project;

//   const ProjectCard({super.key, required this.project});

//   @override
//   Widget build(BuildContext context) {
//     return HoverScale(
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.1),
//               spreadRadius: 2,
//               blurRadius: 5,
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(12)),
//               child: Image.network(
//                 project.imageUrl,

//                 // width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     project.title,
//                     style: GoogleFonts.poppins(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     project.description,
//                     style: GoogleFonts.poppins(
//                       fontSize: 16,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   // const SizedBox(height: 16),
//                   Wrap(
//                     direction: Axis.horizontal,
//                     spacing: 8,
//                     children: project.technologies
//                         .map((tech) => Chip(label: Text(tech)))
//                         .toList(),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
