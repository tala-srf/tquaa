import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/pages/scaffold_start.dart';
import 'package:test_form_tuqaatech/core/string/error_string.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/pages/home.dart';
import 'package:test_form_tuqaatech/router/routes.dart';
import '../../../../core/widget/loading_widget.dart';
import '../bloc/bloc_login/bloc/login_bloc.dart';
import '../widget/form_login.dart';

class LoginUI extends StatelessWidget {
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllerpass = TextEditingController();

  LoginUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldStart(
      num: 0.2,
      widgetstart: Padding(
          padding: const EdgeInsets.all(25),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is SuccessedLogin) {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(RouteNamedScreens.homeNameRoute),
                );
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Home(),
                ));
              } else if (state is ErrorNetLogin) {
                 ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                    content: Text(state.error!)));

                ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                    content: Text(AppErrorMessage.validEmail)));
              }
            },
            builder: (context, state) {
              if (state is LoginInitial || state is ErrorNetLogin) {
                return FormLoginWidget(
                    controlleremail: controlleremail,
                    controllerpass: controllerpass,
                    );
              } else if (state is LoadingLogin) {
                return const LoadingWidget();
              } else {
                return const Text("");
              }
            },
          )),
    );
  }
}
