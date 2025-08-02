import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_profile/config/responsive_layout_config.dart';
import 'package:professional_profile/presentation/widgets/common/animated_fade_in.dart';

import '../social/social_links_section.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeIn(
      delay: const Duration(milliseconds: 200),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: const CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/images/my_picture.jpg'),
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final String imagePath;
  final String name;
  final String bio;

  const ProfileSection({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.bio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResponsiveLayoutConfig().init(context);
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xffad9460),
            const Color(0xff605f5e),
            const Color(0xffad9460).withOpacity(0.8),
          ],
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            // Mobile/Tablet layout
            return _buildVerticalLayout(theme);
          } else {
            // Desktop layout
            return _buildHorizontalLayout(theme);
          }
        },
      ),
    );
  }

  Widget _buildVerticalLayout(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildProfileImage(size: 300),
          const SizedBox(height: 30),
          _buildNameText(theme, fontSize: 28),
          const SizedBox(height: 8),
          _buildRoleText(theme),
          const SizedBox(height: 20),
          _buildBioText(theme, textAlign: TextAlign.center),
          const SizedBox(height: 30),
          _buildCTAButton(),
          const SizedBox(height: 30),
          SocialLinksSection(
            isDesktop: true,
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalLayout(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildProfileImage(size: 400),
          const SizedBox(width: 60),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildNameText(theme, fontSize: 32),
                const SizedBox(height: 8),
                _buildRoleText(theme),
                const SizedBox(height: 20),
                _buildBioText(theme),
                const SizedBox(height: 30),
                Row(
                  children: [
                    _buildCTAButton(),
                    const SizedBox(width: 20),
                    SocialLinksSection(
                      isDesktop: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage({required double size}) {
    return AnimatedFadeIn(
      delay: const Duration(milliseconds: 300),
      child: Container(
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Main image
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameText(ThemeData theme, {required double fontSize}) {
    return AnimatedFadeIn(
      delay: const Duration(milliseconds: 400),
      child: Text(
        'Yousef Hageb',
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildRoleText(ThemeData theme) {
    return AnimatedFadeIn(
      delay: const Duration(milliseconds: 500),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: theme.colorScheme.secondary,
            width: 1,
          ),
        ),
        child: Text(
          'Flutter Developer',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.secondary,
          ),
        ),
      ),
    );
  }

  Widget _buildBioText(ThemeData theme,
      {TextAlign textAlign = TextAlign.left}) {
    return AnimatedFadeIn(
      delay: const Duration(milliseconds: 600),
      child: Column(
        crossAxisAlignment: textAlign == TextAlign.center
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            'Professional Mobile App Developer',
            style: GoogleFonts.poppins(
              fontSize: 22,
              height: 1.5,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            bio,
            style: GoogleFonts.poppins(
              fontSize: 16,
              height: 1.6,
              color: Colors.white.withOpacity(0.8),
            ),
            textAlign: textAlign,
          ),
        ],
      ),
    );
  }

  Widget _buildCTAButton() {
    return AnimatedFadeIn(
      delay: const Duration(milliseconds: 700),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffad9460),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.download_rounded),
            const SizedBox(width: 8),
            Text(
              'Download CV',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
