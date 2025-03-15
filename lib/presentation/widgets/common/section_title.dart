import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_profile/presentation/widgets/common/animated_fade_in.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Color? color;

  const SectionTitle({
    super.key,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeIn(
      delay: const Duration(milliseconds: 200),
      child: Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
