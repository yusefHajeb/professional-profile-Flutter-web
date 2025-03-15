import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_profile/domain/entities/service.dart';
import 'package:professional_profile/presentation/widgets/common/hover_scale.dart';

class ServiceCard extends StatelessWidget {
  final Service service;
  final VoidCallback? onTap;

  const ServiceCard({
    super.key,
    required this.service,
    this.onTap,
  });

  IconData _getIconData(String iconName) {
    const icons = {
      'web': Icons.web,
      'mobile_friendly': Icons.mobile_friendly,
      'cloud': Icons.cloud,
      'design_services': Icons.design_services,
    };
    return icons[iconName] ?? Icons.work;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return HoverScale(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _getIconData(service.iconName),
                    size: 44,
                    color: theme.primaryColor,
                  ),
                ),
                const SizedBox(height: 20),
                Flexible(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        service.title,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: theme.textTheme.titleLarge?.color,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 14),
                      Text(
                        service.description,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          height: 1.5,
                          color: theme.textTheme.bodyMedium?.color
                              ?.withOpacity(0.8),
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
