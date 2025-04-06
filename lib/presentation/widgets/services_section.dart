// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:professional_profile/presentation/bloc/services_bloc.dart';
// import 'package:professional_profile/presentation/widgets/common/animated_fade_in.dart';

// import 'services/service_card.dart';

// class ServicesSection extends StatelessWidget {
//   const ServicesSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ServicesBloc()..add(LoadServices()),
//       child: Container(
//         padding: const EdgeInsets.all(32.0),
//         color: Colors.grey[100],
//         child: Column(
//           children: [
//             AnimatedFadeIn(
//               delay: const Duration(milliseconds: 200),
//               child: Text(
//                 'Services',
//                 style: GoogleFonts.poppins(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 32),
//             BlocBuilder<ServicesBloc, ServicesState>(
//               builder: (context, state) {
//                 if (state is ServicesLoading) {
//                   return const CircularProgressIndicator();
//                 }
//                 if (state is ServicesLoaded) {
//                   return Wrap(
//                     spacing: 24,
//                     runSpacing: 24,
//                     children: state.services
//                         .asMap()
//                         .entries
//                         .map((entry) => AnimatedFadeIn(
//                               delay: Duration(
//                                   milliseconds: 300 + (entry.key * 100)),
//                               child: ServiceCard(service: entry.value),
//                             ))
//                         .toList(),
//                   );
//                 }
//                 return const Text('Error loading services');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
