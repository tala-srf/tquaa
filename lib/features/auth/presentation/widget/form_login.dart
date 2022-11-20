import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form_tuqaatech/core/string/error_string.dart';
import 'package:test_form_tuqaatech/core/string/image_manger.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/widget/textfield_widget.dart';
import 'package:test_form_tuqaatech/router/routes.dart';
import '../../../../core/widget/elevated_button.dart';
import '../../domin/entites/login_entity.dart';
import '../bloc/bloc_login/bloc/login_bloc.dart';
import 'accept.dart';
import 'bottom_widget.dart';

bool remeberme = false;

class FormLoginWidget extends StatefulWidget {
  const FormLoginWidget({
    super.key,
    required this.controlleremail,
    required this.controllerpass,
  });

  final TextEditingController controlleremail;
  final TextEditingController controllerpass;

  @override
  State<FormLoginWidget> createState() => _FormLoginWidgetState();
}

class _FormLoginWidgetState extends State<FormLoginWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          TextFieldWidget(
              keyboard: TextInputType.emailAddress,
              name: "Email",
              icon: AppImageManger.pathIconEmail,
              controller: widget.controlleremail),
          TextFieldWidget(
              keyboard: TextInputType.text,
              name: "Password",
              icon: AppImageManger.pathIconKey,
              controller: widget.controllerpass),
          Accept(
            name: "Remember me",
            line: "",
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ButtonWidget(
                newVariable: "", onPressed: () => _onpressed(), name: "Login"),
          ),
          const Spacer(),
          BottomWidget(
            bottom: "Don't have an account ?",
            textbutton: "Creat Account",
            onPressed: () => Navigator.pushNamed(context, RouteNamedScreens.regiserNameRoute),
          ),
        ],
      ),
    );
  }

  void _onpressed() {
    final isValid = _formKey.currentState!.validate();

    final valid = EmailValidator.validate(widget.controlleremail.text);
    if (isValid && valid) {
      final login = LoginEntity(
        widget.controllerpass.text,
        remeberme,
        widget.controlleremail.text,
      );
      remeberme = false;
      BlocProvider.of<LoginBloc>(context).add(Loginevent(entity: login));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar( SnackBar(content: Text(AppErrorMessage.validEmail)));
      widget.controlleremail.clear();
      widget.controllerpass.clear();
    }
  }
}
