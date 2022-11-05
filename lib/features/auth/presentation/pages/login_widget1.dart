import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form_tuqaatech/core/page/scaffold_start.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/pages/home.dart';
import '../../../../core/widget/load.dart';
import '../bloc/bloc_login/bloc/login_bloc.dart';
import '../widget/form_login.dart';

class LoginUI extends StatelessWidget {
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllerpass = TextEditingController();

  LoginUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StartClass(
      num: 0.2,
      widgetstart: Padding(
          padding: const EdgeInsets.all(25),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is SuccessedLogin) {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName('/home'),
                );
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Home(),
                ));
              } else if (state is ErrorNetLogin) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('تأكد من الايميل وكلمة السر')));
              }
            },
            builder: (context, state) {
              if (state is LoginInitial || state is ErrorNetLogin) {
                return FormLoginWidget(
                    controlleremail: controlleremail,
                    controllerpass: controllerpass);
              } else if (state is LoadingLogin) {
                return const LoadingWidget();
              } else {
                return const Text("data");
              }
            },
          )),
    );
  }
}
