import 'package:flutter/material.dart';


class CongratsTitle extends StatelessWidget {
  const CongratsTitle({super.key});
  @override
  Widget build(BuildContext context) {
    return  Text(
      'Congrats!',
      style: TextStyle(
        color: Theme.of(context).hintColor,
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}


class PrimeNumberMessage extends StatelessWidget {
  final int primeNumber;

  const PrimeNumberMessage({
    super.key,
    required this.primeNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'You obtained a prime number, it was: $primeNumber',
      style: TextStyle(
        color: Theme.of(context).hintColor,
        fontSize: 16,
        height: 1.5,
      ),
    );
  }
}

class ElapsedTimeDisplay extends StatelessWidget {
  final Duration elapsedTime;
  const ElapsedTimeDisplay({
    super.key,
    required this.elapsedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Time since last prime number: ${elapsedTime.toString().split('.').first}',
          style: TextStyle(
            color: Theme.of(context).hintColor.withOpacity(0.6),
            fontSize: 14,
          ),
        )
      ],
    );
  }
}