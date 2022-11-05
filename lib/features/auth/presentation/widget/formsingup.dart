import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/widget/accept.dart';

import 'package:test_form_tuqaatech/features/auth/presentation/widget/select_form_field.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/widget/textfield_widget.dart';

import '../../../../core/string/const.dart';
import '../../../../core/widget/elevated_button.dart';
import '../../domin/entites/register_entity.dart';
import '../bloc/bloc_register/bloc/register1_bloc.dart';
import 'bottom_widget.dart';

import 'image_widget.dart';
import 'list_selecet.dart';

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
            const Text(
              "Signup",
              style: TextStyle(fontSize: 22),
            ),
            const ImageWidget(),
            TextFieldWidget(
                keyboard: TextInputType.text,
                name: "Name",
                icon: "asset/icons/point.png",
                controller: widget.controllername),
            TextFieldWidget(
                keyboard: TextInputType.number,
                name: "Age",
                icon: "asset/icons/point.png",
                controller: widget.controllerage),
            SelectFormFieldWidget(
              name: "Gender",
              item: items1[0],
              controller: widget.controllergender,
            ),
            SelectFormFieldWidget(
              controller: widget.controllercountry,
              name: "Contry",
              item: items1[1],
            ),
            SelectFormFieldWidget(
                controller: widget.controllercity,
                // ignore: unrelated_type_equality_checks
                name: "City",
                item: items1[2]),
            TextFieldWidget(
                keyboard: TextInputType.phone,
                name: "Phone number",
                icon: "asset/icons/point.png",
                controller: widget.controllerphone),
            TextFieldWidget(
                keyboard: TextInputType.emailAddress,
                name: "Email",
                icon: "asset/icons/email.png",
                controller: widget.controllernemail),
            TextFieldWidget(
                keyboard: TextInputType.text,
                name: "Password",
                icon: "asset/icons/key.png",
                controller: widget.controllerpassword),
            TextFieldWidget(
                keyboard: TextInputType.text,
                name: "Reenter password",
                icon: "asset/icons/key.png",
                controller: widget.controllerreenterpassword),
            Accept(name: "Accept the", line: "Trems & Service"),
            ButtonWidget(
              newVariable: "",
                onPressed: () {
                  _onpressed();
                },
                name: "Signup"),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                    child: BottomWidget(
                        bottom: "Already have an account ?",
                        onPressed: () => Navigator.pushNamed(context, "/login"),
                        textbutton: "Login"))),
          ]),
    );
  }

  void _onpressed() {
    final t = widget.controllerpassword.text == widget.controllerreenterpassword.text;
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

    if (gender1 == 0 || citt1 == 0 || contry1 == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('All fields are required')));
    }
    if (t == false) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('password does not match')));
    }
    if (length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('password must be more than 6 characters')));
    }
    if (base64Image == "") {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('please add image')));
    }
    if (isValid &&
        t &&
        gender1 != 0 &&
        contry1 != 0 &&
        citt1 != 0 &&
        age1 != 0 &&
        base64Image != "") {
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
