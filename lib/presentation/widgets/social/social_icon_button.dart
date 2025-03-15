import 'package:flutter/material.dart';
import 'package:professional_profile/presentation/widgets/common/hover_scale.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconButton extends StatelessWidget {
  final IconData icon;
  final String url;
  final String label;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.url,
    required this.label,
  });

  Future<void> _launchUrl() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return HoverScale(
      scale: 1.2,
      child: Tooltip(
        message: label,
        child: IconButton(
          icon: Icon(icon),
          color: Colors.white,
          iconSize: 32,
          onPressed: _launchUrl,
        ),
      ),
    );
  }
}
