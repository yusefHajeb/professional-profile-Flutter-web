import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_profile/domain/entities/experience.dart';
import 'package:professional_profile/presentation/widgets/common/animated_fade_in.dart';

class ExperienceCard extends StatefulWidget {
  final Experience experience;
  final bool isFirst;
  final bool isLast;

  const ExperienceCard({
    Key? key,
    required this.experience,
    this.isFirst = false,
    this.isLast = false,
  }) : super(key: key);

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isHovered = false;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isFirst;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 600;

    return LayoutBuilder(
      builder: (context, constraints) {
        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: isMobile ? 8 : 16,
              ),
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                maxWidth: constraints.maxWidth,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme.cardColor,
                    theme.cardColor.withOpacity(0.9),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                        theme.primaryColor.withOpacity(_isHovered ? 0.2 : 0.1),
                    blurRadius: _isHovered ? 20 : 10,
                    spreadRadius: _isHovered ? 5 : 0,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildHeader(theme, widget.experience, isMobile),
                  if (_isExpanded)
                    _buildPositionsList(widget.experience, theme, isMobile),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(ThemeData theme, Experience experience, bool isMobile) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
      child: Row(
        children: [
          _buildCompanyLogo(theme, experience),
          SizedBox(width: isMobile ? 12 : 16),
          Expanded(
            child: Text(
              experience.companyName,
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 16 : 20,
                fontWeight: FontWeight.bold,
                color: theme.primaryColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            _isExpanded ? Icons.expand_less : Icons.expand_more,
            color: theme.primaryColor,
            size: isMobile ? 24 : 28,
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyLogo(ThemeData theme, Experience experience) {
    final size = MediaQuery.of(context).size.width < 600 ? 32.0 : 40.0;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: experience.companyLogo.isNotEmpty
          ? Image.network(
              experience.companyLogo,
              width: size,
              height: size,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.business,
                size: size,
                color: theme.primaryColor,
              ),
            )
          : Icon(
              Icons.business,
              size: size,
              color: theme.primaryColor,
            ),
    );
  }

  Widget _buildPositionsList(
      Experience experience, ThemeData theme, bool isMobile) {
    return Padding(
      padding: EdgeInsets.only(bottom: isMobile ? 12.0 : 16.0),
      child: Column(
        children: experience.positions
            .map((position) => _buildPositionTile(position, theme, isMobile))
            .toList(),
      ),
    );
  }

  Widget _buildPositionTile(Position position, ThemeData theme, bool isMobile) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isMobile ? 8 : 16,
        vertical: isMobile ? 4 : 8,
      ),
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.primaryColor.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPositionHeader(position, theme, isMobile),
          SizedBox(height: isMobile ? 4 : 8),
          _buildPositionDuration(position, theme, isMobile),
          SizedBox(height: isMobile ? 8 : 16),
          _buildResponsibilitiesList(position, theme, isMobile),
        ],
      ),
    );
  }

  Widget _buildPositionHeader(
      Position position, ThemeData theme, bool isMobile) {
    return Row(
      children: [
        Icon(
          Icons.work_outline,
          color: theme.primaryColor,
          size: isMobile ? 16 : 20,
        ),
        SizedBox(width: isMobile ? 4 : 8),
        Expanded(
          child: Text(
            position.title,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 18,
              fontWeight: FontWeight.w600,
              color: theme.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPositionDuration(
      Position position, ThemeData theme, bool isMobile) {
    return Row(
      children: [
        Icon(
          Icons.calendar_today,
          color: theme.primaryColor,
          size: isMobile ? 14 : 16,
        ),
        SizedBox(width: isMobile ? 4 : 8),
        Text(
          position.duration,
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 12 : 14,
            color: theme.primaryColor.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildResponsibilitiesList(
      Position position, ThemeData theme, bool isMobile) {
    return Column(
      children: position.responsibilities
          .asMap()
          .entries
          .map((entry) => _buildResponsibilityItem(
                entry.key,
                entry.value,
                theme,
                isMobile,
              ))
          .toList(),
    );
  }

  Widget _buildResponsibilityItem(
    int index,
    String responsibility,
    ThemeData theme,
    bool isMobile,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedFadeIn(
            delay: Duration(milliseconds: 100 * index),
            child: Icon(
              Icons.check_circle,
              color: theme.primaryColor,
              size: isMobile ? 16 : 20,
            ),
          ),
          SizedBox(width: isMobile ? 4 : 8),
          Flexible(
            child: AnimatedFadeIn(
              delay: Duration(milliseconds: 150 * index),
              child: Text(
                responsibility,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 12 : 14,
                  height: 1.5,
                  wordSpacing: 1.2,
                  color: theme.primaryColor.withOpacity(0.8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
