import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_profile/presentation/bloc/experience_bloc.dart';
import 'package:professional_profile/presentation/bloc/projects_bloc.dart';
import 'package:professional_profile/presentation/bloc/services_bloc.dart';
import 'package:professional_profile/presentation/widgets/header_section.dart';
import 'package:professional_profile/presentation/widgets/experience/experience_section.dart';
import 'package:professional_profile/presentation/widgets/projects/project_section.dart';
import 'package:professional_profile/presentation/widgets/services/service_section.dart';
import 'package:professional_profile/presentation/widgets/social/social_links_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();

  // Section keys for navigation
  final homeKey = GlobalKey();
  final servicesKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  bool _showBackToTopButton = false;
  String _activeSection = 'Home';
  bool _isNavBarVisible = true;
  double _lastScrollPosition = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _showBackToTopButton = scrollController.offset >= 400;
      _isNavBarVisible = scrollController.offset <= _lastScrollPosition ||
          scrollController.offset <= 100;
      _lastScrollPosition = scrollController.offset;
    });

    _updateActiveSection();
  }

  void _updateActiveSection() {
    double scrollPosition = scrollController.offset + 100;

    if (_isVisibleInViewport(homeKey, scrollPosition)) {
      _setActiveSection('Home');
    } else if (_isVisibleInViewport(servicesKey, scrollPosition)) {
      _setActiveSection('Services');
    } else if (_isVisibleInViewport(experienceKey, scrollPosition)) {
      _setActiveSection('Experience');
    } else if (_isVisibleInViewport(projectsKey, scrollPosition)) {
      _setActiveSection('Projects');
    } else if (_isVisibleInViewport(contactKey, scrollPosition)) {
      _setActiveSection('Contact');
    }
  }

  void _setActiveSection(String section) {
    if (_activeSection != section) {
      setState(() => _activeSection = section);
    }
  }

  bool _isVisibleInViewport(GlobalKey key, double scrollPosition) {
    final RenderObject? renderObject = key.currentContext?.findRenderObject();
    if (renderObject == null || !renderObject.attached) return false;

    final RenderBox renderBox = renderObject as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size.height;

    final itemTop = position.dy;
    final itemBottom = itemTop + renderBox.size.height;

    return (itemTop <= scrollPosition && scrollPosition <= itemBottom) ||
        (itemTop >= scrollPosition &&
            itemTop <= scrollPosition + screenHeight * 0.5);
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutQuart,
      );
    }
  }

  void _scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutQuart,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isWideScreen = MediaQuery.of(context).size.width > 800;

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProjectsBloc>(
          create: (context) => ProjectsBloc()..add(LoadProjects()),
        ),
        BlocProvider<ServicesBloc>(
          create: (context) => ServicesBloc()..add(LoadServices()),
        ),
        BlocProvider(
          create: (context) => ExperienceBloc()..add(LoadExperiences()),
          child: const ExperienceSection(),
        ),
      ],
      child: Scaffold(
        key: scaffoldKey,
        drawer: !isWideScreen ? _buildDrawer() : null,
        floatingActionButton: _showBackToTopButton
            ? FloatingActionButton(
                onPressed: _scrollToTop,
                backgroundColor: theme.primaryColor,
                child: const Icon(Icons.arrow_upward, color: Colors.white),
              )
            : null,
        body: Stack(
          children: [
            CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: KeyedSubtree(
                    key: homeKey,
                    child: const HeaderSection(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: KeyedSubtree(
                    key: servicesKey,
                    child: const ServicesSection(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: KeyedSubtree(
                    key: experienceKey,
                    child: ExperienceSection(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: KeyedSubtree(
                    key: projectsKey,
                    child: const ProjectsSection(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: KeyedSubtree(
                    key: contactKey,
                    child: SocialLinksSection(),
                  ),
                ),
              ],
            ),
            _buildNavBar(isWideScreen),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBar(bool isWideScreen) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      top: _isNavBarVisible ? 0 : -70,
      left: 0,
      right: 0,
      child: Container(
        height: 70,
        color: Theme.of(context).primaryColor.withOpacity(0.95),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        const AssetImage('assets/images/my_logo.jpg'),
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.2),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Yousef Hageb',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            if (isWideScreen)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _NavItem(
                    title: 'Home',
                    isActive: _activeSection == 'Home',
                    onTap: () => _scrollToSection(homeKey),
                  ),
                  _NavItem(
                    title: 'Services',
                    isActive: _activeSection == 'Services',
                    onTap: () => _scrollToSection(servicesKey),
                  ),
                  _NavItem(
                    title: 'Experience',
                    isActive: _activeSection == 'Experience',
                    onTap: () => _scrollToSection(experienceKey),
                  ),
                  _NavItem(
                    title: 'Projects',
                    isActive: _activeSection == 'Projects',
                    onTap: () => _scrollToSection(projectsKey),
                  ),
                  _NavItem(
                    title: 'Contact',
                    isActive: _activeSection == 'Contact',
                    onTap: () => _scrollToSection(contactKey),
                  ),
                  const SizedBox(width: 20),
                ],
              )
            else
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => scaffoldKey.currentState?.openDrawer(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/profile2.jpg'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Yousef Hageb',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            _DrawerItem(
              title: 'Home',
              icon: Icons.home,
              isActive: _activeSection == 'Home',
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(homeKey);
              },
            ),
            _DrawerItem(
              title: 'Services',
              icon: Icons.design_services,
              isActive: _activeSection == 'Services',
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(servicesKey);
              },
            ),
            _DrawerItem(
              title: 'Experience',
              icon: Icons.work,
              isActive: _activeSection == 'Experience',
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(experienceKey);
              },
            ),
            _DrawerItem(
              title: 'Projects',
              icon: Icons.code,
              isActive: _activeSection == 'Projects',
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(projectsKey);
              },
            ),
            _DrawerItem(
              title: 'Contact',
              icon: Icons.contact_mail,
              isActive: _activeSection == 'Contact',
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(contactKey);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? Colors.white : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.title,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isActive ? Colors.white : Colors.white70,
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          color: isActive ? Colors.white : Colors.white70,
        ),
      ),
      onTap: onTap,
      tileColor: isActive ? Colors.white.withOpacity(0.1) : null,
    );
  }
}
