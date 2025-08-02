import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_profile/domain/entities/service.dart';
import 'package:professional_profile/presentation/widgets/common/animated_fade_in.dart';

class ServiceCard extends StatefulWidget {
  final Service service;
  final int index;

  const ServiceCard({super.key, required this.service, required this.index});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedFadeIn(
      delay: Duration(milliseconds: widget.index * 100 + 300),
      child: AnimatedFadeIn(
        delay: const Duration(milliseconds: 500),
        child: MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isHovered
                    ? theme.colorScheme.surface
                    : Colors.grey.withOpacity(0.2),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: isHovered
                      ? theme.primaryColor.withOpacity(0.1)
                      : Colors.black.withOpacity(0.05),
                  blurRadius: isHovered ? 20 : 10,
                  spreadRadius: isHovered ? 5 : 1,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _getIconData(widget.service.iconName),
                    size: 24.r,
                    color: theme.colorScheme.surface,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  widget.service.title,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.surface,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.service.description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    height: 1.6,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'flutter_dash':
        return Icons.flutter_dash;
      case 'web':
        return Icons.web;
      case 'api':
        return Icons.api;
      case 'design_services':
        return Icons.design_services;
      case 'speed':
        return Icons.speed;
      default:
        return Icons.code;
    }
  }
}
