import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_profile/presentation/widgets/header/background_painter.dart';
import 'package:professional_profile/presentation/widgets/common/animated_fade_scale.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;
    final isWideScreen = MediaQuery.of(context).size.width > 800;

    return Stack(
      // fit: StackFit.expand,
      alignment: Alignment.topLeft,
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: BackgroundPainter(
              animation: _controller,
              color: primaryColor,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: isWideScreen ? 64.0 : 32.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedFadeScale(
                duration: const Duration(milliseconds: 800),
                child: MouseRegion(
                  onEnter: (_) => setState(() => isHovered = true),
                  onExit: (_) => setState(() => isHovered = false),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    transform: Matrix4.identity()
                      ..scale(isHovered ? 1.05 : 1.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.primaryColor.withAlpha((0.3 * 255).toInt()),
                      boxShadow: [
                        BoxShadow(
                          color: theme.primaryColor.withOpacity(0.3),
                          blurRadius: isHovered ? 30 : 20,
                          spreadRadius: isHovered ? 8 : 5,
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 100,
                      backgroundImage:
                          AssetImage('assets/images/my_picture.jpg'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              AnimatedFadeScale(
                duration: const Duration(milliseconds: 800),
                child: Text(
                  'Yousef Hageb',
                  style: GoogleFonts.poppins(
                    fontSize: isWideScreen ? 48 : 36,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: [
                          theme.primaryColor.withAlpha((0.7 * 255).toInt()),
                          theme.primaryColor,
                        ],
                      ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              AnimatedFadeScale(
                duration: const Duration(milliseconds: 800),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withAlpha((0.2 * 255).toInt()),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: theme.primaryColor.withOpacity(0.2),
                    ),
                  ),
                  child: Text(
                    'Full Stack Developer',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              AnimatedFadeScale(
                duration: const Duration(milliseconds: 800),
                child: SizedBox(
                  width: isWideScreen ? 800 : null,
                  child: Text(
                    'Experienced Full Stack Developer with a proven track record in Flutter development. '
                    'Passionate about creating innovative, user-centric solutions that combine beautiful design with robust functionality. '
                    'Specialized in building scalable applications using modern technologies and best practices.',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.8),
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  _buildAnimatedSkillChip(context, 'Flutter', 0),
                  _buildAnimatedSkillChip(context, 'Dart', 1),
                  _buildAnimatedSkillChip(context, 'Laravel', 2),
                  _buildAnimatedSkillChip(context, 'MySQL', 3),
                  _buildAnimatedSkillChip(context, 'Firebase', 4),
                  _buildAnimatedSkillChip(context, 'SQLite', 5),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedSkillChip(
      BuildContext context, String skill, int index) {
    final theme = Theme.of(context);
    return AnimatedFadeScale(
      duration: Duration(milliseconds: 800 + (index * 100)),
      child: MouseRegion(
        onEnter: (_) => setState(() {}),
        onExit: (_) => setState(() {}),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.primaryColor.withOpacity(0.2),
                theme.primaryColor.withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: theme.primaryColor.withOpacity(0.2),
            ),
            boxShadow: [
              BoxShadow(
                color: theme.primaryColor.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            skill,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: theme.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
