import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class ClockState extends Equatable {
  const ClockState();

  @override
  List<Object?> get props => [];
}

// Initial State
class ClockInitial extends ClockState {}

// Loading State
class ClockLoading extends ClockState {}

// Current Time State
class ClockTicking extends ClockState {
  final DateTime currentTime;

  const ClockTicking(this.currentTime);

  @override
  List<Object?> get props => [currentTime];
}

// Prime Number Found State
class PrimeNumberFound extends ClockState {
  final int number;
  final Duration elapsedTime;

  const PrimeNumberFound({
    required this.number,
    required this.elapsedTime,
  });

  @override
  List<Object?> get props => [number, elapsedTime];
}

// Error State
class ClockError extends ClockState {
  final DioException error;

  const ClockError(this.error);

  @override
  List<Object?> get props => [error];
}
