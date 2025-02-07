import 'package:prime_watch/core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/random_number_repository.dart';

class GetRandomNumberUseCase implements UseCase<DataState<int>, void> {
  final RandomNumberRepository randomNumberRepository;
  const GetRandomNumberUseCase({
    required this.randomNumberRepository,
  });

  @override
  Future<DataState<int>> call({void params}) {
    return randomNumberRepository.getRandomNumber();
  }
}