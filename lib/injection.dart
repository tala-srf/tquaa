import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test_form_tuqaatech/features/auth/data/datasources/data_user_fire_datasources.dart';
import 'package:test_form_tuqaatech/features/auth/data/repository/registerandauth_repository.dart';
import 'package:test_form_tuqaatech/features/auth/domin/usecases/register_usecase.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/bloc/bloc_allcountry/bloc/allcountry_bloc.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/bloc/bloc_login/bloc/login_bloc.dart';
import 'package:test_form_tuqaatech/features/chat/data/datasources/chat_datasourses.dart';
import 'package:test_form_tuqaatech/features/chat/data/repository/chat_repository.dart';
import 'package:test_form_tuqaatech/features/chat/domin/repository/chat_repositry.dart';
import 'package:test_form_tuqaatech/features/chat/domin/usecases/chat_usecases.dart';
import 'package:test_form_tuqaatech/features/chat/domin/usecases/get_dialog_bychatid.dart';
import 'package:test_form_tuqaatech/features/chat/domin/usecases/image_usecase.dart';
import 'package:test_form_tuqaatech/features/chat/domin/usecases/send_message_usecases.dart';
import 'package:test_form_tuqaatech/features/chat/presention/bloc/bloc_chat/bloc/chat_list_bloc.dart';
import 'package:test_form_tuqaatech/features/chat/presention/bloc/bloc_dialog_chat/bloc/get_dialog_by_chat_id_bloc.dart';
import 'package:test_form_tuqaatech/features/chat/presention/bloc/bloc_image/bloc/image_bloc.dart';
import 'package:test_form_tuqaatech/features/chat/presention/bloc/sendmessage/bloc/send_message_bloc.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/data/datasources/cit_partner_datasources.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/data/repository/city_pertner_repository.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/domin/repository/city_partner_repositry.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/domin/usecases/city_partner_usecases.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/bloc/partner/bloc/city_partner_bloc.dart';
import '../features/auth/domin/usecases/login_usecase.dart';
import 'core/network/internet_checker.dart';
import 'features/auth/data/datasources/all_country_datasource.dart';
import 'features/auth/data/datasources/auth_datasources.dart';
import 'features/auth/data/datasources/registerandauth_data_sources.dart';
import 'features/auth/domin/repository/register_repository.dart';
import 'features/auth/domin/usecases/allcounty_usecase.dart';
import 'features/auth/domin/usecases/data_user_fire_usecases.dart';
import 'features/auth/presentation/bloc/bloc_data_user_fire/bloc/data_user_fire_bloc.dart';
import 'features/auth/presentation/bloc/bloc_register/bloc/register_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
//! Features - Auth
// Bloc
//bloc auth
  sl.registerFactory(() => LoginBloc(loginusecase: sl()));

  sl.registerFactory(() => RegisterBloc(registerUsecase: sl()));
  sl.registerFactory(() => AllcountryBloc(
        allCountryUsecase: sl(),
      ));
  sl.registerFactory(() => DataUserFireBloc(dataUserFireUsecase: sl()));
  //bloc chat
  sl.registerFactory(() => ChatListBloc(chatUsecase: sl()));

  sl.registerFactory(() => ImageBloc(imageUsecase: sl()));
  sl.registerFactory(() => SendMessageBloc(sendMessageUsecase: sl()));
  sl.registerFactory(() => GetDialogByChatIdBloc(chatUsecase: sl()));
  // bloc search partner
  sl.registerFactory(() => CityPartnerBloc(cityPartnerUsecase: sl()));

//
// Usecase
// usecase auth
  sl.registerLazySingleton(() => LoginUsecase(repository: sl()));
  sl.registerLazySingleton(() => RegisterUsecase(repository: sl()));
  sl.registerLazySingleton(() => AllCountryUsecase(repository: sl()));
  sl.registerLazySingleton(() => DataUserFireUsecase(repository: sl()));
  //usecase chat
  sl.registerLazySingleton(() => ChatUsecase(chatRepditry: sl()));
  sl.registerLazySingleton(() => GetDialogByChatIdUsecase(chatRepditry: sl()));
  sl.registerLazySingleton((() => ImageUsecase(chatRepditry: sl())));
  sl.registerLazySingleton(() => SendMessageUsecase(chatRepditry: sl()));
  //usecase search partner
  sl.registerLazySingleton(
    () => CityPartnerUsecase(cityPartnerRepditry: sl()),
  );

//
// Repo
// repo auth
  sl.registerLazySingleton<RegisterRepository>(() => RegisterRepositeryImp(
        allCountryDataSources: sl(),
        authDataSources: sl(),
        dataUserFireDataSources: sl(),
        internet: sl(),
        registerDataSources: sl(),
      ));
//repo chat
  sl.registerLazySingleton<ChatRepditry>(
    () => ChatRepositoryImp(chatDatasources: sl(), internet: sl()),
  );
//repo searchpartner
  sl.registerLazySingleton<CityPartnerRepditry>(
    () =>
        CitypartnerRepositoryImp(citypartnerDatasources: sl(), internet: sl()),
  );

// DataSources
  // Remote
  //remote auth
  sl.registerLazySingleton<AuthDataSources>(() => AuthDataSourcesImp());
  sl.registerLazySingleton<RegisterDataSources>(() => RegisterDataSourcesImp());
  sl.registerLazySingleton<AllCountryDataSources>(
      () => AllCountryDataSourcesImp());
  sl.registerLazySingleton<DataUserFireDataSources>(
      () => DataUserFireDataSourcesImp());
//remote chat
  sl.registerLazySingleton<ChatDataSources>(
    () => ChatDataSourcesImp(),
  );
  // remote search partner
  sl.registerLazySingleton<CitypartnerDatasources>(
    () => CitypartnerDatasourcesImp(),
  );

  // Local
//
//! Features - Auth Finished

//! Features - Global
  sl.registerLazySingleton<InternetChecker>(
    () => InternetCheckerImpl(connectionChecker: sl()),
  );
  sl.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
//! Features - Global Finished
}