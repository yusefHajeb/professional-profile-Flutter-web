import 'package:flutter/material.dart';
import 'package:professional_profile/core/utils/responsive_utils.dart';
import 'package:professional_profile/presentation/widgets/header/intro_text.dart';
import 'package:professional_profile/presentation/widgets/header/profile_image.dart';

import '../../../config/responsive_layout_config.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32.0),
      child: ResponsiveLayoutConfig.responsive(
        desktop: Column(
          children: [
            ProfileSection(
              imagePath:
                  'assets/images/profile2.jpg', // Replace with your own image path
              name: 'Your Name',
              bio:
                  'A brief bio about yourself goes here. You can mention your profession, interests, or any other details you find relevant.',
            ),
            // SizedBox(
            //   width: ResponsiveUtils.getContentWidth(context),
            //   child: const Padding(
            //     padding: EdgeInsets.symmetric(vertical: 32.0),
            //     child: IntroText(),
            //   ),
            // ),
          ],
        ),
        mobile: Column(
          children: [
            const ProfileImage(),
            SizedBox(
              width: ResponsiveUtils.getContentWidth(context),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: IntroText(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
