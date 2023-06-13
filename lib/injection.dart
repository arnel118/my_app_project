import 'package:get_it/get_it.dart';
import 'package:my_app_project/domain/usecases/advice_usecases.dart';

// sl = service locator
final sl = GetIt.I;

Future<void> init() async {
  // Bloc
  // Factory = every time a new/fresh instance of that class
  sl.registerFactory(() => AdvicerCubit(adviceUseCases: sl()));

  // Use cases
  sl.registerLazySingleton(() => AdviceUseCases(adviceRepo: sl()));

  // Repository
  sl.registerLazySingleton<AdviceRepo>(
    () => AdviceRepoImpl(adviceRemoteDatasource: sl()),
  );

  // Data sources
  // sl.registerLazySingleton<AdviceRemoteDatasource>(
  //   () => AdviceRemoteDatasourceImpl(),
  // );

  // External
  // sl.registerLazySingleton(() => http.Client());

}