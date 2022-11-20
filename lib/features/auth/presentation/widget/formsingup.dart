import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form_tuqaatech/core/string/error_string.dart';
import 'package:test_form_tuqaatech/core/string/image_manger.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/widget/accept.dart';

import 'package:test_form_tuqaatech/features/auth/presentation/widget/select_form_field.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/widget/textfield_widget.dart';
import 'package:test_form_tuqaatech/router/routes.dart';

import '../../../../core/string/const.dart';
import '../../../../core/widget/elevated_button.dart';
import '../../domin/entites/register_entity.dart';
import '../bloc/bloc_register/bloc/register_bloc.dart';
import 'bottom_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'image_widget.dart';
import 'list_selecet_gender.dart';

class FormSignup extends StatefulWidget {
  const FormSignup({
    super.key,
    required this.controllername,
    required this.controllerage,
    required this.controllergender,
    required this.controllercountry,
    required this.controllercity,
    required this.controllerphone,
    required this.controllernemail,
    required this.controllerpassword,
    required this.controllerreenterpassword,
  });

  final TextEditingController controllername;
  final TextEditingController controllerage;
  final TextEditingController controllergender;
  final TextEditingController controllercountry;
  final TextEditingController controllercity;
  final TextEditingController controllerphone;
  final TextEditingController controllernemail;
  final TextEditingController controllerpassword;
  final TextEditingController controllerreenterpassword;

  @override
  State<FormSignup> createState() => _FormSignupState();
}

class _FormSignupState extends State<FormSignup> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Text(
              "Signup",
              style: TextStyle(fontSize: 0.32.dp),
            ),
            const ImageWidget(),
            TextFieldWidget(
                keyboard: TextInputType.text,
                name: "Name",
                icon: AppImageManger.pathIconPoint,
                controller: widget.controllername),
            TextFieldWidget(
                keyboard: TextInputType.number,
                name: "Age",
                icon: AppImageManger.pathIconPoint,
                controller: widget.controllerage),
            SelectFormFieldWidget(
              name: "Gender",
              item: gendermap,
              controller: widget.controllergender,
            ),
            SelectFormFieldWidget(
              controller: widget.controllercountry,
              name: "Contry",
              item: allcountry.isEmpty ? empty : allcountry,
            ),
            SelectFormFieldWidget(
                controller: widget.controllercity,
                name: "City",
                item: allcity.isEmpty ? empty : allcity),
            TextFieldWidget(
                keyboard: TextInputType.phone,
                name: "Phone number",
                icon: AppImageManger.pathIconPoint,
                controller: widget.controllerphone),
            TextFieldWidget(
                keyboard: TextInputType.emailAddress,
                name: "Email",
                icon: AppImageManger.pathIconEmail,
                controller: widget.controllernemail),
            TextFieldWidget(
                keyboard: TextInputType.text,
                name: "Password",
                icon: AppImageManger.pathIconKey,
                controller: widget.controllerpassword),
            TextFieldWidget(
                keyboard: TextInputType.text,
                name: "Reenter password",
                icon: AppImageManger.pathIconKey,
                controller: widget.controllerreenterpassword),
            Accept(
              name: "Accept the",
              line: "Trems & Service",
            ),
            ButtonWidget(
                newVariable: "",
                onPressed: () {
                  _onpressed();
                },
                name: "Signup"),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: BottomWidget(
                    bottom: "Already have an account ?",
                    onPressed: () => Navigator.pushNamed(context, RouteNamedScreens.loginScreenNameRoute),
                    textbutton: "Login")),
          ]),
    );
  }

  void _onpressed() {
    final t =
        widget.controllerpassword.text == widget.controllerreenterpassword.text;
    int length = widget.controllerpassword.text.length;

    final isValid = _formKey.currentState!.validate();
    int? age1 = (widget.controllerage.text != "")
        ? int.parse(widget.controllerage.text)
        : 0;

    int? gender1 = widget.controllergender.text != ""
        ? int.parse(widget.controllergender.text)
        : 0;
    int? contry1 = widget.controllercountry.text != ""
        ? int.parse(widget.controllercountry.text)
        : 0;
    int? citt1 = (widget.controllercity.text) != ""
        ? int.parse(widget.controllercity.text)
        : 0;
    final email = EmailValidator.validate(widget.controllernemail.text);

    if (gender1 == 0 || citt1 == 0 || contry1 == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text(AppErrorMessage.allFieldsRequired)));
    }
    if (t == false) {
      ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text(AppErrorMessage.passwordnotMatch)));
    }
    if (length < 6) {
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content: Text(AppErrorMessage.errorPasswordCharacters)));
    }
    if (base64Image == "") {
      ScaffoldMessenger.of(context)
          .showSnackBar( SnackBar(content: Text(AppErrorMessage.addImage)));
    }
    if (email == false) {
      ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text(AppErrorMessage.validEmail)));
    }
    if (isValid &&
        t &&
        gender1 != 0 &&
        contry1 != 0 &&
        citt1 != 0 &&
        age1 != 0 &&
        base64Image != "" &&
        email) {
      final register = RegisterEntity(
          widget.controllername.text,
          gender1,
          age1,
          citt1,
          contry1,
          widget.controllerphone.text,
          widget.controllernemail.text,
          widget.controllerpassword.text,
          base64Image);

      BlocProvider.of<RegisterBloc>(context)
          .add(EventRegister(event1: register));
    }
  }
}
