import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test_form_tuqaatech/features/auth/data/repository/registerandauth_repository.dart';
import 'package:test_form_tuqaatech/features/auth/domin/usecases/register_usecase.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/bloc/bloc_allcountry/bloc/allcountry_bloc.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/bloc/bloc_login/bloc/login_bloc.dart';
import '../features/auth/domin/usecases/login_usecase.dart';
import 'core/network/internet_checker.dart';
import 'features/auth/data/datasources/all_country_datasource.dart';
import 'features/auth/data/datasources/auth_datasources.dart';
import 'features/auth/data/datasources/registerandauth_data_sources.dart';
import 'features/auth/domin/repository/register_repository.dart';
import 'features/auth/domin/usecases/allcounty_usecase.dart';
import 'features/auth/presentation/bloc/bloc_register/bloc/register1_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
//! Features - Auth
// Bloc
  sl.registerFactory(() => LoginBloc(sl()));

  sl.registerFactory(() => RegisterBloc(sl()));
    sl.registerFactory(() => AllcountryBloc(sl(),));

//
// Usecase
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => RegisterUsecase(sl()));
    sl.registerLazySingleton(() => AllCountryUsecase(sl()));

//
// Repo
  sl.registerLazySingleton<RegisterRepository>(() => RegisterRepositeryImp(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ));
      
// DataSources
  // Remote
  sl.registerLazySingleton<AuthDataSources>(() => AuthDataSourcesImp());
  sl.registerLazySingleton<RegisterDataSources>(() => RegisterDataSourcesImp());
   sl.registerLazySingleton<AllCountryDataSources>(() => AllCountryDataSourcesImp());
  // Local
//
//! Features - Auth Finished

//! Features - Global
  sl.registerLazySingleton<InternetChecker>(
    () => (sl()),
  );
  sl.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
//! Features - Global Finished
}
