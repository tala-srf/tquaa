import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_form_tuqaatech/features/auth/data/datasources/all_country_datasource.dart';
import 'package:test_form_tuqaatech/features/auth/data/datasources/data_user_fire_datasources.dart';
import 'package:test_form_tuqaatech/features/auth/domin/usecases/data_user_fire_usecases.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/bloc/bloc_allcountry/bloc/allcountry_bloc.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/bloc/bloc_data_user_fire/bloc/data_user_fire_bloc.dart';
import 'package:test_form_tuqaatech/features/chat/presention/bloc/bloc_dialog_chat/bloc/get_dialog_by_chat_id_bloc.dart';
import 'package:test_form_tuqaatech/features/chat/presention/bloc/bloc_image/bloc/image_bloc.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/domin/usecases/city_partner_usecases.dart';
import 'package:test_form_tuqaatech/features/welcome/presentation/pages/welcome.dart';
import 'package:test_form_tuqaatech/router/routes.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test_form_tuqaatech/features/auth/domin/usecases/login_usecase.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/bloc/bloc_login/bloc/login_bloc.dart';
import '../core/network/internet_checker.dart';
import '../features/auth/data/datasources/auth_datasources.dart';
import '../features/auth/data/datasources/registerandauth_data_sources.dart';
import '../features/auth/data/repository/registerandauth_repository.dart';
import '../features/auth/domin/usecases/allcounty_usecase.dart';
import '../features/auth/domin/usecases/register_usecase.dart';
import '../features/auth/presentation/bloc/bloc_register/bloc/register1_bloc.dart';
import '../features/chat/data/datasources/chat_datasourses.dart';
import '../features/chat/data/repository/chat_repository.dart';
import '../features/chat/domin/usecases/chat_usecases.dart';
import '../features/chat/domin/usecases/get_dialog_bychatId.dart';
import '../features/chat/domin/usecases/image_usecase.dart';
import '../features/chat/domin/usecases/send_message_usecases.dart';
import '../features/chat/presention/bloc/bloc_chat/bloc/chat_list_bloc.dart';
import '../features/chat/presention/bloc/sendmessage/bloc/send_message_bloc.dart';
import '../features/home_find_pertner/data/datasources/cit_partner_datasources.dart';
import '../features/home_find_pertner/data/repository/city_pertner_repository.dart';
import '../features/home_find_pertner/presention/bloc/partner/bloc/city_partner_bloc.dart';
import '../features/home_find_pertner/presention/pages/home.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => RegisterBloc(RegisterUsecase(RegisterRepositeryImp(
                  InternetCheckerImpl(InternetConnectionChecker()),
                  RegisterDataSourcesImp(),
                  AuthDataSourcesImp(),
                  AllCountryDataSourcesImp(),
                  DataUserFireDataSourcesImp())))),
          BlocProvider(
              create: (_) => LoginBloc(
                    LoginUsecase(RegisterRepositeryImp(
                        InternetCheckerImpl(InternetConnectionChecker()),
                        RegisterDataSourcesImp(),
                        AuthDataSourcesImp(),
                        AllCountryDataSourcesImp(),
                        DataUserFireDataSourcesImp())),
                  )),
          BlocProvider(
              create: (_) => AllcountryBloc(AllCountryUsecase(
                  RegisterRepositeryImp(
                      InternetCheckerImpl(InternetConnectionChecker()),
                      RegisterDataSourcesImp(),
                      AuthDataSourcesImp(),
                      AllCountryDataSourcesImp(),
                      DataUserFireDataSourcesImp())))),
          BlocProvider(
              create: (_) =>
                  CityPartnerBloc(CityPartnerUsecase(CitypartnerRepositoryImp(
                    InternetCheckerImpl(InternetConnectionChecker()),
                    CitypartnerDatasourcesImp(),
                  )))),
          BlocProvider(
              create: (_) => ChatListBloc(ChatUsecase(ChatRepositoryImp(
                    InternetCheckerImpl(InternetConnectionChecker()),
                    ChatDataSourcesImp(),
                  )))),
          BlocProvider(
              create: (_) => DataUserFireBloc(
                    DataUserFireUsecase(RegisterRepositeryImp(
                        InternetCheckerImpl(InternetConnectionChecker()),
                        RegisterDataSourcesImp(),
                        AuthDataSourcesImp(),
                        AllCountryDataSourcesImp(),
                        DataUserFireDataSourcesImp())),
                  )),
          BlocProvider(
              create: (_) => GetDialogByChatIdBloc(
                    GetDialogByChatIdUsecase(ChatRepositoryImp(
                      InternetCheckerImpl(InternetConnectionChecker()),
                      ChatDataSourcesImp(),
                    )),
                  )),
          BlocProvider(
              create: (_) => SendMessageBloc(
                    SendMessageUsecase(ChatRepositoryImp(
                      InternetCheckerImpl(InternetConnectionChecker()),
                      ChatDataSourcesImp(),
                    )),
                  )),
          BlocProvider(
              create: (_) => ImageBloc(
                    ImageUsecase(ChatRepositoryImp(
                      InternetCheckerImpl(InternetConnectionChecker()),
                      ChatDataSourcesImp(),
                    )),
                  )),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: routes(),
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: FutureBuilder(
            builder: (context, snapshot) {
              BlocProvider.of<AllcountryBloc>(context).add(CountryEvent());
              if (snapshot.data.toString() != 'EMPTY_TOKEN') {
                return const Home();
              } else {
                return const Welcome();
              }
            },
            future: tokenCall(),
          ),
        ));
  }

  Future<String> tokenCall() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('backend_token') ?? 'EMPTY_TOKEN';
  }
}