import 'package:flutter/material.dart';
import 'package:professional_profile/config/app_config.dart';
import 'package:professional_profile/presentation/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const App());
}
