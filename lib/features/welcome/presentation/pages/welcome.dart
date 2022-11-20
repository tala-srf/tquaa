import 'dart:async';

import 'package:flutter/material.dart';

import 'package:page_animation_transition/animations/scale_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:test_form_tuqaatech/core/string/image_manger.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/pages/selection_signup_login.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).push(PageAnimationTransition(
        page: const SelectionSignupOrLogin(),
        pageAnimationType: ScaleAnimationTransition(),
      ));
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 5),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AppImageManger.pathImagebg,
                ),
                fit: BoxFit.cover)),
        child: Center(
          child: Text(
            "Welcome",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 0.4.dp),
          ),
        ),
      ),
    );
  }
}
