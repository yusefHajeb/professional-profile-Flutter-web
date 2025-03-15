import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:professional_profile/presentation/bloc/projects_bloc.dart';
import 'package:professional_profile/presentation/bloc/services_bloc.dart';
import 'package:professional_profile/presentation/widgets/header/profile_image.dart';
// import 'package:professional_profile/presentation/widgets/projects_section.dart';
import 'package:professional_profile/presentation/widgets/services/service_section.dart';
import 'package:professional_profile/presentation/widgets/social/social_links_section.dart';

import '../widgets/projects/project_section.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  double _getSectionOffset(GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext?.findRenderObject() as RenderBox;
    return renderBox.localToGlobal(Offset.zero).dy;
  }

  bool _showBackToTopButton = false;

  String activeSection = 'Services';
  void _scrollListener() {
    double offset = scrollController.offset;
    setState(() {
      _showBackToTopButton = offset >= 400;
    });
  }

  void _scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutQuart,
      );
    }
  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(_scrollListener);
  }

  final scrollController = ScrollController();

  final servicesKey = GlobalKey();

  final profileSection = GlobalKey();
  final projectsKey = GlobalKey();

  final aboutKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    bool isWideScreen = MediaQuery.of(context).size.width > 800;
    AppBar topNavigationBar = AppBar(
      title: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage('assets/images/my_logo.jpg'),
      ),
      leading: isWideScreen
          ? null
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => scaffoldKey.currentState?.openDrawer(),
            ),
      actions: isWideScreen
          ? [
              _NavItem(
                title: 'Services',
                onTap: () => _scrollToSection(servicesKey),
                isActive: activeSection == 'Services',
              ),
              _NavItem(
                title: 'Projects',
                onTap: () => _scrollToSection(projectsKey),
                isActive: activeSection == 'Projects',
              ),
              _NavItem(
                title: 'About',
                onTap: () => _scrollToSection(aboutKey),
                isActive: activeSection == 'About',
              ),
            ]
          : null,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProjectsBloc()..add(LoadProjects()),
        ),
        BlocProvider(
          create: (context) => ServicesBloc()..add(LoadServices()),
        ),
      ],
      child: Scaffold(
        appBar: topNavigationBar,
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  KeyedSubtree(
                      key: profileSection,
                      child: const ProfileSection(
                          imagePath: 'assets/images/profile2.jpg',
                          name: 'Yousef Hageb',
                          bio:
                              "with over two years of experience in mobile application development using Flutter, Dart, and"
                              "REST APIs. I specialize in building robust mobile applications for both Android and iOS from a single codebase.")),
                  KeyedSubtree(
                    key: servicesKey,
                    child: const ServicesSection(),
                  ),
                  KeyedSubtree(
                    key: projectsKey,
                    child: const ProjectsSection(),
                  ),
                  KeyedSubtree(
                    key: aboutKey,
                    child: SocialLinksSection(),
                  ),
                  // Add more sections as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Function(GlobalKey) scrollToSection;
  final String activeSection;

  const TopNavigationBar({
    super.key,
    required this.scaffoldKey,
    required this.scrollToSection,
    required this.activeSection,
  });

  @override
  Widget build(BuildContext context) {
    bool isWideScreen = MediaQuery.of(context).size.width > 800;

    return AppBar(
      title: const Text('Your App Title'),
      leading: isWideScreen
          ? null
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => scaffoldKey.currentState?.openDrawer(),
            ),
      actions: isWideScreen
          ? [
              _NavItem(
                title: 'Services',
                onTap: () => scrollToSection,
                isActive: activeSection == 'Services',
              ),
              _NavItem(
                title: 'Projects',
                onTap: () => scrollToSection,
                isActive: activeSection == 'Projects',
              ),
              _NavItem(
                title: 'About',
                onTap: () => scrollToSection,
                isActive: activeSection == 'About',
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _NavItem extends StatelessWidget {
  final String title;
  final bool isActive;

  final VoidCallback onTap;

  const _NavItem({
    Key? key,
    required this.isActive,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = isActive ? Colors.black : Colors.black38;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.white24, // Add hover effect for web
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
