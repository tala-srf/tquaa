import 'package:flutter/material.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/pages/signup_done.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/pages/home.dart';
import 'package:test_form_tuqaatech/features/welcome/presentation/pages/selection_signup_login.dart';


import '../features/auth/presentation/pages/login_widget1.dart';
import '../features/auth/presentation/pages/register_ui.dart';


Map<String, WidgetBuilder> routes() {
  return {
    '/selection_s_l': (ctxt) => const SelectionSignupOrLogin(),
  '/register': (ctxt) =>  RegisterUI(),
   '/login': (ctxt) =>  LoginUI(),
    '/done': (ctxt) =>  const SignupDone(),
    //  '/partnerresult': (ctxt) =>  const CardCityPartner(),
     '/home': (ctxt) =>   Home()};
   
}
