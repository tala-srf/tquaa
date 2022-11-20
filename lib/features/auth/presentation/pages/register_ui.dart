import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/pages/scaffold_start.dart';
import 'package:test_form_tuqaatech/core/widget/loading_widget.dart';

import 'package:test_form_tuqaatech/features/auth/presentation/bloc/bloc_register/bloc/register_bloc.dart';
import 'package:test_form_tuqaatech/router/routes.dart';

import '../widget/formsingup.dart';

// ignore: must_be_immutable
class RegisterUI extends StatelessWidget {
  RegisterUI({Key? key}) : super(key: key);
  TextEditingController controllername = TextEditingController();
  TextEditingController controllerage = TextEditingController();
  TextEditingController controllergender = TextEditingController();
  TextEditingController controllercountry = TextEditingController();
  TextEditingController controllerphone = TextEditingController();
  TextEditingController controllernemail = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();
  TextEditingController controllerreenterpassword = TextEditingController();
  TextEditingController controllercity = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScaffoldStart(
      num: 1.0,
      widgetstart: ListView.builder(
         padding: const EdgeInsets.only(bottom: 10, top: 30.0),
          itemCount: 1,
          itemBuilder: (context, index) {
            return BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is SuccessedRegister) {
                  Navigator.of(context).popAndPushNamed(RouteNamedScreens.doneSignupNameRoute);
                
                } else if (state is ErrorNet) {
                       ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                  content: Text(state.error!)));
                }
              },
              builder: (context, state) {
                if (state is RegisterInitial || state is ErrorNet) {
                  return FormSignup(
                    
                      controllername: controllername,
                      controllerage: controllerage,
                      controllergender: controllergender,
                      controllercountry: controllercountry,
                      controllercity: controllercity,
                      controllerphone: controllerphone,
                      controllernemail: controllernemail,
                      controllerpassword: controllerpassword,
                      controllerreenterpassword: controllerreenterpassword);
                } else if (state is Loading) {
                  return const LoadingWidget();
                } else {
                  return const Text("");
                }
              },
            );
          }),
    );
  }
}
