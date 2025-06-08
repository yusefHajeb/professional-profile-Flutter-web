import 'package:flutter/material.dart';

class TimelineConnector extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final Color color;

  const TimelineConnector({
    Key? key,
    this.isFirst = false,
    this.isLast = false,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            isFirst ? color : color.withOpacity(0.5),
            isLast ? color : color.withOpacity(0.5),
          ],
        ),
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}
