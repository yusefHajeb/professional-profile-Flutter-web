import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_profile/config/responsive_layout_config.dart';
import 'package:professional_profile/presentation/widgets/common/animated_fade_in.dart';

import '../common/section_title.dart';
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
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
        ),
        child: const CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/images/profile2.jpg'),
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
/*************  ✨ Codeium Command ⭐  *************/
  /// Builds the profile section based on the current screen width.
  ///
  /// On mobile and tablet devices, this widget will display the profile section
  /// vertically, with the profile image on top and the name and bio below it.
  ///
  /// On desktop devices, this widget will display the profile section horizontally,
  /// with the profile image on the left and the name and bio on the right.
/******  a8c74fdb-6d4b-4a28-af40-6508c6ec962f  *******/ Widget build(
      BuildContext context) {
    ResponsiveLayoutConfig().init(context);
    final theme = Theme.of(context);
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffad9460),
              Color(0xff605f5e),
              Color(0xffad9460),
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
      ),
    );
  }

  Widget _buildVerticalLayout(ThemeData theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildProfileImage(size: 650),
        const SizedBox(height: 24),
        _buildNameText(theme, fontSize: 28),
        const SizedBox(height: 16),
        _buildBioText(theme, textAlign: TextAlign.center),
        const SizedBox(height: 30),
        SocialLinksSection(
          isDesctop: true,
        ),
      ],
    );
  }

  Widget _buildHorizontalLayout(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildProfileImage(size: ResponsiveLayoutConfig.screenWidth / 1.7),
        const SizedBox(width: 48),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildNameText(theme, fontSize: 32),
              const SizedBox(height: 16),
              _buildBioText(theme),
              const SizedBox(height: 16),
              SocialLinksSection(
                isDesctop: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage({required double size}) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xffad9460).withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Color(0xff605f5e).withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.all(14),
          width: size,
          // height: size,
          decoration: BoxDecoration(
            color: Color(0xff605f5e).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            // border: Border.all(
            //   width: 2,
            //   color: const Color(0xFFE5E5EA),
            // ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              // fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
    // backgroundImage: AssetImage(imagePath),
    // backgroundColor: Colors.transparent,
  }

  Widget _buildNameText(ThemeData theme, {required double fontSize}) {
    return SectionTitle(
      color: theme.colorScheme.onPrimary.withOpacity(0.8),
      title: 'Yousef Hageb',
    );
  }

  Widget _buildBioText(ThemeData theme,
      {TextAlign textAlign = TextAlign.left}) {
    return ResponsiveLayoutConfig.responsive(
      mobile: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'As Flutter Develper',
            style: GoogleFonts.poppins(
              fontSize: 29,
              height: 1.5,
              fontWeight: FontWeight.bold,
              // color: Colors.yellow.withOpacity(0.8),
              color: theme.colorScheme.secondary,
            ),
          ),
          _bioText(textAlign),
        ],
      ),
      desktop: Wrap(
        spacing: 10,
        children: [
          Text(
            'A Flutter Developer ',
            style: GoogleFonts.poppins(
              fontSize: 30,
              height: 1.5,
              color: theme.colorScheme.secondary,
            ),
          ),
          Flexible(
            child: Text(
              bio,
              style: GoogleFonts.poppins(
                fontSize: 18,
                height: 1.5,
                color: Colors.white,
              ),
              textAlign: textAlign,
            ),
          ),
        ],
      ),
      tablet: Column(children: [
        Text(
          'A Flutter Developer ',
          style: GoogleFonts.poppins(
            fontSize: 18,
            height: 1.5,
            color: Colors.yellow.withOpacity(0.8),
            // color: theme.colorScheme.secondary,
          ),
        ),
        Text(bio,
            style: GoogleFonts.poppins(
              fontSize: 18,
              height: 1.5,
              color: Colors.white,

              // color: theme.textTheme.bodyLarge?.color?.withOpacity(0.8),
            ))
      ]),
      // _bioText(textAlign),
    );
  }

  Flexible _bioText(TextAlign textAlign) {
    return Flexible(
      child: Text(
        bio,
        style: GoogleFonts.poppins(
          fontSize: 18,
          height: 1.5,
          color: Colors.white,
          // color: theme.textTheme.bodyLarge?.color?.withOpacity(0.8),
        ),
        textAlign: textAlign,
      ),
    );
  }
}
