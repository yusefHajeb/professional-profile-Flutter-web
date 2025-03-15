import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/images/profile2.jpg'),
          ),
          const SizedBox(height: 24),
          Text(
            'John Doe',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Full Stack Developer',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Passionate about creating beautiful and functional web applications. '
            'Specialized in Flutter, React, and Node.js development.',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.grey[800],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
