import 'dart:async';

import 'package:flutter/material.dart';

import 'package:page_animation_transition/animations/scale_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:test_form_tuqaatech/features/welcome/presentation/pages/selection_signup_login.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  late Timer timer;

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).push(PageAnimationTransition(
          page: const SelectionSignupOrLogin(),
          pageAnimationType: ScaleAnimationTransition(),));
    });
    super.initState();
  }
    @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 5),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "asset/images/bg.png",
                ),
                fit: BoxFit.cover)),
        child: Center(
          child: Text(
            "Welcome",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.05),
          ),
        ),
      ),
    );
  }
}
