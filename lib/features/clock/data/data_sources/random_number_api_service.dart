import 'package:dio/dio.dart';
import 'package:prime_watch/config/services/apis_services.dart';
import '../../../../core/constants/apis.dart';

class RandomNumberApiService {
  final ApiProvider _provider = ApiProvider();

  Future<Response> getRandomNumber() async {
    return await _provider.dio.get(
        ApiConstants.randomNumber
    );
  }
}