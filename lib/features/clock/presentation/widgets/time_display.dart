import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prime_watch/core/constants/text_style.dart';

class TimeDisplay extends StatelessWidget {
  final DateTime time;
  final AnimationController controller;

  const TimeDisplay({
    super.key,
    required this.time,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat('HH:mm').format(time);

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -0.2),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutCubic,
      )),
      child: FadeTransition(
        opacity: controller,
        child: Text(
          formattedTime,
          style: AppTextStyles.boldText(context),
        ),
      ),
    );
  }
}