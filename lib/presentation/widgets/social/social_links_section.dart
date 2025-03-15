import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professional_profile/core/constants/social_links.dart';
import 'package:professional_profile/presentation/widgets/common/section_title.dart';
import 'package:professional_profile/presentation/widgets/social/social_icon_button.dart';

// ignore: must_be_immutable
class SocialLinksSection extends StatelessWidget {
  bool? isDesctop;
  SocialLinksSection({super.key, this.isDesctop});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32.0),
      color: isDesctop == null ? Colors.grey[900] : null,
      child: const Column(
        children: [
          SectionTitle(
            title: 'Connect With Me',
            color: Colors.white,
          ),
          SizedBox(height: 24),
          AnimatedRow(
            duration: Duration(milliseconds: 1000),
            delay: Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            children: [
              SocialIconButton(
                icon: FontAwesomeIcons.github,
                url: SocialLinks.github,
                label: 'GitHub',
              ),
              SizedBox(width: 24),
              SocialIconButton(
                icon: FontAwesomeIcons.linkedin,
                url: SocialLinks.linkedin,
                label: 'LinkedIn',
              ),
              SizedBox(width: 24),
              SocialIconButton(
                icon: FontAwesomeIcons.twitter,
                url: SocialLinks.twitter,
                label: 'Twitter',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AnimatedRow extends StatefulWidget {
  final List<Widget> children;
  final Duration duration;
  final Duration delay;
  final Curve curve;

  const AnimatedRow({
    super.key,
    required this.children,
    required this.duration,
    required this.delay,
    required this.curve,
  });

  @override
  State<AnimatedRow> createState() => _AnimatedRowState();
}

class _AnimatedRowState extends State<AnimatedRow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    Future.delayed(widget.delay, () => _controller.forward());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.children.length,
        (index) {
          final animation = CurveTween(
            curve: Interval(
              1 - ((index + 1) / widget.children.length),
              1,
              curve: widget.curve,
            ),
          ).animate(_controller);

          return SlideTransition(
            position: animation.drive(
              Tween<Offset>(
                begin: const Offset(0, 1),
                end: const Offset(1, 0),
              ),
            ),
            child: RotationTransition(
              turns: animation.drive(
                Tween<double>(
                  begin: 0.5,
                  end: (index + 1) * pi / 3.1,
                ),
              ),
              child: widget.children[index],
            ),
          );
        },
      ),
    );
  }
}
