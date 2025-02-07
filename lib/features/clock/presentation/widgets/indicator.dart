import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';


class StatusIndicator extends StatelessWidget {
  const StatusIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 30,
      decoration: BoxDecoration(
        color: ApiColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}