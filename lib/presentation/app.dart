import 'package:flutter/material.dart';
import 'package:professional_profile/core/theme/app_theme.dart';
import 'package:professional_profile/presentation/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yousef Hageb - Professional Profile',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      themeMode: ThemeMode.light, // You can change this to system or dark
      home: const HomePage(),
    );
  }
}
