import 'package:flutter/material.dart';
import 'package:test_form_tuqaatech/router/routes.dart';


import 'scaffold_start.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class SelectionSignupOrLogin extends StatelessWidget {
  const SelectionSignupOrLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldStart(
     
  num: 1.0,
      widgetstart: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Please login to continue",
              style: TextStyle(
                  fontSize: 0.33.dp),
            ),
            _WidgetLoginorsignup(
              "Login",
              const Color(0xffff6f00),
              Colors.white,
              () => Navigator.pushNamed(context, RouteNamedScreens.loginScreenNameRoute),
            ),
            _WidgetLoginorsignup(
                "SignUp",
                Colors.white,
                const Color(0xffff6f00),
                () => Navigator.pushNamed(context, RouteNamedScreens.regiserNameRoute))
          ]),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _WidgetLoginorsignup(
      String name, Color colorWidget, Color color1, Function() onpressed) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
          backgroundColor: MaterialStateProperty.all(colorWidget),
          minimumSize: const MaterialStatePropertyAll(Size(0, 60)),
          foregroundColor: MaterialStateProperty.all(color1),
          side: MaterialStateProperty.all(
              const BorderSide(color: Color(0xffff6f00), width: 1.5)),
        ),
        onPressed: onpressed,
        child: Center(
            child: Text(
          name,
          style:  TextStyle(fontSize: 0.28.dp),
        )),
      ),
    );
  }
}
