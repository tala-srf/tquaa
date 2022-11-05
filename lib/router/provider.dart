
  
//    import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

// import '../core/network/internet_checker.dart';
// import '../features/auth/data/datasources/auth_datasources.dart';
// import '../features/auth/data/datasources/registerandauth_data_sources.dart';
// import '../features/auth/data/repository/registerandauth_repository.dart';
// import '../features/auth/domin/usecases/login_usecase.dart';
// import '../features/auth/domin/usecases/register_usecase.dart';
// import '../features/auth/presentation/bloc/bloc_login/bloc/login_bloc.dart';
// import '../features/auth/presentation/bloc/bloc_register/bloc/register1_bloc.dart';

//     var providers2 = [BlocProvider(
//               create: (_) => RegisterBloc(RegisterUsecase(RegisterRepositeryImp(
//                     InternetCheckerImpl(InternetConnectionChecker()),
//                     RegisterDataSourcesImp(),
//                     AuthDataSourcesImp(),
//                   )))),
//           BlocProvider(create: (_)=>LoginBloc(LoginUsecase(RegisterRepositeryImp(InternetCheckerImpl(InternetConnectionChecker()),
//                     RegisterDataSourcesImp(),
//                     AuthDataSourcesImp(),))) )     ];