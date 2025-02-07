import 'package:equatable/equatable.dart';

abstract class ClockEvent extends Equatable {
  const ClockEvent();

  @override
  List<Object?> get props => [];
}

// Start Clock Event
class StartClock extends ClockEvent {}

// Update Time Event
class UpdateTime extends ClockEvent {
  final DateTime time;

  const UpdateTime(this.time);

  @override
  List<Object?> get props => [time];
}

// Check Random Number Event
class CheckRandomNumber extends ClockEvent {}

// Stop Clock Event
class StopClock extends ClockEvent {}