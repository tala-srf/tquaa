import 'package:flutter/material.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/pages/signup_done_page.dart';
import 'package:test_form_tuqaatech/features/chat/presention/pages/list_all_chats.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/pages/home.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/pages/search_city_partner.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/pages/selection_signup_login.dart';

import '../features/auth/presentation/pages/login_widget1.dart';
import '../features/auth/presentation/pages/register_ui.dart';

Map<String, WidgetBuilder> routes() {
  return {
    RouteNamedScreens.signupOrLoginNameRoute: (ctxt) =>
        const SelectionSignupOrLogin(),
    RouteNamedScreens.regiserNameRoute: (ctxt) => RegisterUI(),
    RouteNamedScreens.loginScreenNameRoute: (ctxt) => LoginUI(),
    RouteNamedScreens.doneSignupNameRoute: (ctxt) => const SignupDone(),
    RouteNamedScreens.chatNameRoute: (ctxt) => const ListAllChatsUser(),
    RouteNamedScreens.searchNameRoute: (ctxt) => SearchPartner(),
    RouteNamedScreens.homeNameRoute: (ctxt) => const Home()
  };
}

class RouteNamedScreens {
  //! Important Constant
  // Routing Naming
  //auth
  static const String loginScreenNameRoute = '/login';
  static const String signupOrLoginNameRoute = '/selection_signup_login';
  static const String regiserNameRoute = '/register';
  static const String doneSignupNameRoute = '/done';
  //chat
  static const String chatNameRoute = '/chat';
  //partner
  static const String searchNameRoute = '/search';

  static const String homeNameRoute = '/home';

  //
}
