// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher.dart';

// class SocialLinksSection extends StatelessWidget {
//   const SocialLinksSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(32.0),
//       color: Colors.grey[900],
//       child: Column(
//         children: [
//           Text(
//             'Connect With Me',
//             style: GoogleFonts.poppins(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 24),
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SocialIcon(
//                 icon: Icons.link,
//                 url: 'https://github.com/yusfHajb',
//                 label: 'GitHub',
//               ),
//               SizedBox(width: 24),
//               SocialIcon(
//                 icon: Icons.link,
//                 url: 'https://linkedin.com/in/yousef-hageb',
//                 label: 'LinkedIn',
//               ),
//               SizedBox(width: 24),
//               SocialIcon(
//                 icon: Icons.link,
//                 url: 'https://twitter.com/YousefHageb',
//                 label: 'Twitter',
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SocialIcon extends StatelessWidget {
//   final IconData icon;
//   final String url;
//   final String label;

//   const SocialIcon({
//     super.key,
//     required this.icon,
//     required this.url,
//     required this.label,
//   });

//   Future<void> _launchUrl() async {
//     if (!await launchUrl(Uri.parse(url))) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Tooltip(
//       message: label,
//       child: IconButton(
//         icon: Icon(icon),
//         color: Colors.white,
//         iconSize: 32,
//         onPressed: _launchUrl,
//       ),
//     );
//   }
// }
