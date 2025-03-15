import 'package:flutter/material.dart';
import 'package:professional_profile/config/responsive_layout_config.dart';
import 'package:professional_profile/core/theme/app_theme.dart';
import 'package:professional_profile/presentation/pages/home_page.dart';

class PersonalWebsiteApp extends StatelessWidget {
  const PersonalWebsiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveLayoutConfig().init(context);
    return MaterialApp(
      title: 'Personal Website',
      theme: AppTheme.lightTheme,
      home: HomePage(),
    );
  }
}
