import 'package:flutter/material.dart';
import 'package:prime_watch/features/clock/presentation/pages/clock_screen.dart';
import '../../features/clock/presentation/error_screen.dart';



class AppRoutes {
  static const clockScreen = "/clockScreen";

  static Route onGenerateRoutes(RouteSettings settings) {

    switch (settings.name) {
      case clockScreen:
        return _materialRoute(const ClockScreen());

      default:
        return _materialRoute(const ErrorRouteScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}

class PrimeNumberScreenArguments {
  final int number;
  final Duration elapsedTime;

  PrimeNumberScreenArguments({required this.number, required this.elapsedTime});
}