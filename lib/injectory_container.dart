import 'package:get_it/get_it.dart';
import 'features/clock/data/data_sources/random_number_api_service.dart';
import 'features/clock/data/repository/random_number_repository_impl.dart';
import 'features/clock/domain/repository/random_number_repository.dart';
import 'features/clock/domain/usecase/get_random_number.dart';
import 'features/clock/presentation/cubit/clock_cubid.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerFactory(() => ClockCubit(
    getRandomNumberUseCase: sl(),
  ));

  sl.registerLazySingleton(() => GetRandomNumberUseCase(
    randomNumberRepository: sl(),
  ));

  sl.registerLazySingleton<RandomNumberRepository>(
        () => RandomNumberRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<RandomNumberApiService>(
        () => RandomNumberApiService(),
  );
}