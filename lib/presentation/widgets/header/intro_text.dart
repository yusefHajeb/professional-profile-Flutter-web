import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_profile/presentation/widgets/common/animated_fade_in.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedFadeIn(
          delay: const Duration(milliseconds: 300),
          child: Text(
            'John Doe',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        AnimatedFadeIn(
          delay: const Duration(milliseconds: 400),
          child: Text(
            'Full Stack Developer',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.grey[600],
            ),
          ),
        ),
        const SizedBox(height: 24),
        AnimatedFadeIn(
          delay: const Duration(milliseconds: 500),
          child: Text(
            'Passionate about creating beautiful and functional web applications. '
            'Specialized in Flutter, React, and Node.js development.',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.grey[800],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
