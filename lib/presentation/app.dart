import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:professional_profile/core/theme/app_theme.dart';
import 'package:professional_profile/presentation/bloc/projects_bloc.dart';
import 'package:professional_profile/presentation/bloc/services_bloc.dart';
import 'package:professional_profile/presentation/pages/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProjectsBloc>(
            create: (context) => ProjectsBloc()..add(LoadProjects()),
          ),
          BlocProvider<ServicesBloc>(
            create: (context) => ServicesBloc()..add(LoadServices()),
          ),
        ],
        child: MaterialApp(
            title: 'Yousef Hageb - Professional Profile',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system, // Use system theme by default
            home: const SplashScreen()
            //       child: Scaffold(
            //         key: scaffoldKey,
            //         appBar: AppBar(
            //           title: const Text('Yousef Hageb'),
            //           actions: [
            //             IconButton(
            //               icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            //               onPressed: () {
            //                 setState(() {
            //                   _isDarkMode = !_isDarkMode;
            //                   ThemeMode newThemeMode =
            //                       _isDarkMode ? ThemeMode.dark : ThemeMode.light;
            //                   (context as Element)
            //                       .findAncestorWidgetOfExactType<MaterialApp>()
            //                       ?.themeMode = newThemeMode;
            //                 });
            //               },
            //             ),
            //           ],
            //         ),
            //         body: LayoutBuilder(
            //           builder: (context, constraints) {
            //             if (constraints.maxWidth > 600) {
            //               return _buildWideLayout();
            //             } else {
            //               return _buildNarrowLayout();
            //             }
            //           },
            //         ),
            //       ),
            //     ),
            //   );
            // }

            // Widget _buildWideLayout() {
            //   return SingleChildScrollView(
            //     controller: scrollController,
            //     child: Column(
            //       children: [
            //         const HeaderSection(),
            //         Row(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Expanded(child: ServicesSection()),
            //             Expanded(child: ExperienceSection()),
            //           ],
            //         ),
            //         ProjectsSection(),
            //         SocialLinksSection(),
            //       ],
            //     ),
            //   );
            // }

            // Widget _buildNarrowLayout() {
            //   return SingleChildScrollView(
            //     controller: scrollController,
            //     child: Column(
            //       children: [
            //         const HeaderSection(),
            //         ServicesSection(),
            //         ExperienceSection(),
            //         ProjectsSection(),
            //         SocialLinksSection(),
            //       ],
            //     ),
            //   );
            // }
            ));
  }
}
