import '../../../../core/resources/data_state.dart';

abstract class RandomNumberRepository{
  Future<DataState<int>> getRandomNumber();
}