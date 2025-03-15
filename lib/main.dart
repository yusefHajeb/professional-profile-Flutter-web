import 'package:flutter/material.dart';
import 'package:professional_profile/config/app_config.dart';
import 'package:professional_profile/config/responsive_layout_config.dart';
import 'package:professional_profile/presentation/app.dart';

Future<void> main() async {
  setupDependencies();
  ResponsiveLayoutConfig().init;
  runApp(const PersonalWebsiteApp());
}
