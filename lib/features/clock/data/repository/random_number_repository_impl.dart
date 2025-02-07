import 'package:dio/dio.dart';
import '../../../../core/constants/error_messages.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/repository/random_number_repository.dart';
import '../data_sources/random_number_api_service.dart';


class RandomNumberRepositoryImpl extends RandomNumberRepository {
  final RandomNumberApiService _apiService;

  RandomNumberRepositoryImpl(this._apiService);

  @override
  Future<DataState<int>> getRandomNumber() async {
    try {
      final response = await _apiService.getRandomNumber();
      if (response.statusCode == 200 &&
          response.data is List &&
          response.data.isNotEmpty) {
        final number = response.data[0] as int;
        return DataSuccess(number);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.requestOptions,
            response: response,
            type: DioExceptionType.badResponse,
            message: ApiErrorMessages.invalidRequest,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(
        DioException(
          requestOptions: RequestOptions(path: ''),
          type: DioExceptionType.unknown,
          message: 'Unexpected error occurred: ${e.toString()}',
        ),
      );
    }
  }
}