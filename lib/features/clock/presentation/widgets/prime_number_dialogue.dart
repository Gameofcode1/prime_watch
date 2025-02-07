import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'app_button.dart';
import 'indicator.dart';
import 'prime_number_message.dart';


void showPrimeNumberDialog(BuildContext context, int number, Duration elapsedTime) {
  Timer? autoCloseTimer;

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (dialogContext) {
      autoCloseTimer = Timer(const Duration(seconds: 6), () {
        Navigator.of(dialogContext).pop();
      });

      return Dialog(

        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const StatusIndicator(),
              const SizedBox(height: 30),
              Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CongratsTitle(),
                    const SizedBox(height: 16),
                    PrimeNumberMessage(primeNumber: number),
                    const SizedBox(height: 12),
                    ElapsedTimeDisplay(elapsedTime: elapsedTime),
                    const SizedBox(height: 30),
                    Center(
                      child: AppButton(
                        text: "Close",
                        color: ApiColors.primaryColor,
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
