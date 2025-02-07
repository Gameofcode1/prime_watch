import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:prime_watch/features/clock/presentation/widgets/prime_number_dialogue.dart';
import 'package:prime_watch/features/clock/presentation/widgets/custom_snackbar.dart';
import '../../../../injectory_container.dart';
import '../cubit/clock_cubid.dart';
import '../cubit/clock_state.dart';
import '../widgets/date_display.dart';
import '../widgets/time_display.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen>
    with TickerProviderStateMixin {
  late AnimationController _timeController;
  late AnimationController _dateController;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('de_DE');
    _initializeAnimationControllers();
  }

  void _initializeAnimationControllers() {
    _timeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _dateController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _timeController.forward();
    Future.delayed(
      const Duration(milliseconds: 200),
          () => _dateController.forward(),
    );
  }

  @override
  void dispose() {
    _timeController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ClockCubit>()..startClock(),
      child: Scaffold(
        body: BlocConsumer<ClockCubit, ClockState>(
          listener: (context, state) {
            if (state is PrimeNumberFound) {
              showPrimeNumberDialog(context, state.number, state.elapsedTime);
            } else if (state is ClockError) {
              ScaffoldMessenger.of(context).showSnackBar(
                buildCustomSnackBar(message: state.error.message ?? "Something went wrong."),
              );
            }
          },
          builder: (context, state) {
            if (state is ClockInitial || state is ClockTicking) {
              return buildTimeAndDateDisplay(
                  _dateController,
                  state is ClockTicking ? state.currentTime : DateTime.now()
              );
            }
            if (state is ClockLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            return buildTimeAndDateDisplay(_dateController, DateTime.now());
          },
        ),
      ),
    );
  }
}
Widget buildTimeAndDateDisplay(
    AnimationController dateController, DateTime currentTime) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimeDisplay(
          controller: dateController,
          time: currentTime,
        ),
        const SizedBox(height: 8),
        DateDisplay(
          controller: dateController,
          time: currentTime,
        ),
      ],
    ),
  );
}
// prime_dialog.dart

