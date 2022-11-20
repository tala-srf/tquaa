import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test_form_tuqaatech/core/network/internet_checker.dart';

import 'package:test_form_tuqaatech/core/shared/shared_pref.dart';

import 'package:test_form_tuqaatech/features/auth/presentation/bloc/bloc_allcountry/bloc/allcountry_bloc.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/bloc/bloc_data_user_fire/bloc/data_user_fire_bloc.dart';
import 'package:test_form_tuqaatech/features/chat/data/datasources/chat_datasourses.dart';
import 'package:test_form_tuqaatech/features/chat/data/repository/chat_repository.dart';
import 'package:test_form_tuqaatech/features/chat/domin/repository/chat_repositry.dart';
import 'package:test_form_tuqaatech/features/chat/domin/usecases/get_dialog_bychatId.dart';
import 'package:test_form_tuqaatech/features/chat/presention/bloc/bloc_dialog_chat/bloc/get_dialog_by_chat_id_bloc.dart';
import 'package:test_form_tuqaatech/features/chat/presention/bloc/bloc_image/bloc/image_bloc.dart';
import 'package:test_form_tuqaatech/features/welcome/presentation/pages/welcome.dart';
import 'package:test_form_tuqaatech/router/routes.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/bloc/bloc_login/bloc/login_bloc.dart';
import '../features/auth/presentation/bloc/bloc_register/bloc/register_bloc.dart';
import '../features/chat/presention/bloc/bloc_chat/bloc/chat_list_bloc.dart';
import '../features/chat/presention/bloc/sendmessage/bloc/send_message_bloc.dart';
import '../features/home_find_pertner/presention/bloc/partner/bloc/city_partner_bloc.dart';
import '../features/home_find_pertner/presention/pages/home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../injection.dart' as di;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<RegisterBloc>()),
          BlocProvider(create: (context) => di.sl<LoginBloc>()),
          BlocProvider(create: (context) => di.sl<AllcountryBloc>()),
          BlocProvider(create: (context) => di.sl<CityPartnerBloc>()),
          BlocProvider(create: (context) => di.sl<ChatListBloc>()),
          BlocProvider(create: (context) => di.sl<DataUserFireBloc>()),
          BlocProvider(create: (context) =>GetDialogByChatIdBloc(chatUsecase: GetDialogByChatIdUsecase(chatRepditry: ChatRepositoryImp(chatDatasources:ChatDataSourcesImp() ,internet: InternetCheckerImpl(connectionChecker: InternetConnectionChecker()))))),
          BlocProvider(create: (context) => di.sl<SendMessageBloc>()),
          BlocProvider(create: (context) => di.sl<ImageBloc>()),
        ],

        child: ResponsiveSizer(builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: routes(),
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.orange,
            ),
            home: FutureBuilder(
              builder: (context, snapshot) {
                BlocProvider.of<AllcountryBloc>(context).add(CountryEvent());
                if (AppSharedPreferences.getAccToken() != '') {
                  return const Home();
                } else {
                  return const Welcome();
                }
              },
            
            ),
          );
        }));
  }

}