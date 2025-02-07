import 'package:flutter/material.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/helpers/time_helper.dart';

class DateDisplay extends StatelessWidget {
  final DateTime time;
  final AnimationController controller;

  const DateDisplay({
    super.key,
    required this.time,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = TimeHelper.getFormattedDate(time);
    final calendarWeek = TimeHelper.getCalendarWeek(time);

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 0.2),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutCubic,
      )),
      child: FadeTransition(
        opacity: controller,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formattedDate,
              style: AppTextStyles.textMedium(context), // Now we can use context
            ),
            Text(
              " KW $calendarWeek",
              style: AppTextStyles.textSmall(context), // Now we can use context
            ),
          ],
        ),
      ),
    );
  }
}