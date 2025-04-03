import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isWideScreen = MediaQuery.of(context).size.width > 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: isWideScreen ? 64.0 : 32.0,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.primaryColor.withOpacity(0.05),
            Colors.white,
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: theme.primaryColor.withOpacity(0.2),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/profile2.jpg'),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'Yousef Hageb',
            style: GoogleFonts.poppins(
              fontSize: isWideScreen ? 48 : 36,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: theme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Full Stack Developer',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: theme.primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: isWideScreen ? 800 : null,
            child: Text(
              'Experienced Full Stack Developer with a proven track record in Flutter and Web development. '
              'Passionate about creating innovative, user-centric solutions that combine beautiful design with robust functionality. '
              'Specialized in building scalable applications using modern technologies and best practices.',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.grey[800],
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _buildSkillChip(context, 'Flutter'),
              _buildSkillChip(context, 'Dart'),
              _buildSkillChip(context, 'React'),
              _buildSkillChip(context, 'Node.js'),
              _buildSkillChip(context, 'Firebase'),
              _buildSkillChip(context, 'MongoDB'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(BuildContext context, String skill) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.primaryColor.withOpacity(0.2),
        ),
      ),
      child: Text(
        skill,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: theme.primaryColor,
        ),
      ),
    );
  }
}
