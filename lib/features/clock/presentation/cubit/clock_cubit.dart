import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prime_watch/core/helpers/prime_helper.dart';
import 'package:prime_watch/core/helpers/time_helper.dart';
import 'package:prime_watch/features/clock/presentation/cubit/clock_state.dart';
import '../../../../core/helpers/connectivity_helper.dart';
import '../../../../core/localSrorage/share_pref.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/usecase/get_random_number.dart';


class ClockCubit extends Cubit<ClockState> {
  final GetRandomNumberUseCase _getRandomNumberUseCase;
  Timer? _clockTimer;
  Timer? _numberCheckTimer;
  bool _isApiInProgress = false;

  ClockCubit({required GetRandomNumberUseCase getRandomNumberUseCase})
      : _getRandomNumberUseCase = getRandomNumberUseCase,
        super(ClockInitial());


  // func to start clock
  void startClock() {
    _isApiInProgress = false;

    emit(ClockTicking(DateTime.now()));
    _clockTimer = TimeHelper.startClock((time) => emit(ClockTicking(time)));
    startCheckingNumbers();
  }


  void startCheckingNumbers() {
    _numberCheckTimer?.cancel();

    _numberCheckTimer = Timer.periodic(
      const Duration(seconds: 10),
          (_) {

          _checkForPrimeNumber();

      },
    );
  }

  // func to check primeNumber and api call
  Future<void> _checkForPrimeNumber() async {
    if (_isApiInProgress) return;
    if (!await ConnectivityHelper.isConnected()) {
      emit(ClockError(DioException(
        requestOptions: RequestOptions(path: ''),
        message: 'No internet connection',
        type: DioExceptionType.connectionError,
      )));
      return;
    }

    try {
      _isApiInProgress = true;
      final number = await _getRandomNumberUseCase.call();

      if (number is DataSuccess<int>) {
        if (PrimeHelper.isPrime(number.data!)) {
          await _handlePrimeFound(number.data!);
        } else {
          if (kDebugMode) {
            print("Not prime: ${number.data}");
          }
        }
      } else {
        emit(ClockError(DioException(
          requestOptions: RequestOptions(path: ''),
          message: "Something went wrong.",
          type: DioExceptionType.cancel,
        )));
      }
    } catch (e) {
      emit(ClockError(DioException(
        requestOptions: RequestOptions(path: ''),
        message: e.toString(),
        type: DioExceptionType.unknown,
      )));
    } finally {
      _isApiInProgress = false;
    }
  }

// func to save to localStorage
  Future<void> _handlePrimeFound(int number) async {
    final now = DateTime.now();
    final lastPrimeTime = await UserSharedPref.getLastPrimeTime();
    final elapsed = now.difference(lastPrimeTime);

    await UserSharedPref.saveLastPrimeTime(now);
    emit(PrimeNumberFound(number: number, elapsedTime: elapsed));
  }

  @override
  Future<void> close() {
    _clockTimer?.cancel();
    _numberCheckTimer?.cancel();
    return super.close();
  }
}