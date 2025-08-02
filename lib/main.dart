import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:professional_profile/config/app_config.dart';
import 'package:professional_profile/core/theme/app_theme.dart';
import 'package:professional_profile/presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  await ScreenUtil.ensureScreenSize();
  await AppTheme.initialize();

  runApp(const App());
}
