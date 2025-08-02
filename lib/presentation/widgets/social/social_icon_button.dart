import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final String label;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.url,
    required this.label,
  });

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool isHovered = false;

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(widget.url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch ${widget.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: _launchUrl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isHovered ? theme.colorScheme.surface : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: isHovered
                    ? theme.colorScheme.surface.withOpacity(0.3)
                    : Colors.black.withOpacity(0.1),
                blurRadius: isHovered ? 16 : 8,
                spreadRadius: isHovered ? 2 : 0,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 24,
                color: isHovered ? Colors.white : theme.colorScheme.surface,
              ),
              const SizedBox(height: 8),
              Text(
                widget.label,
                style: TextStyle(
                  color: isHovered ? Colors.white : theme.colorScheme.surface,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
