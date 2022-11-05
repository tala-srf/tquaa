import 'package:flutter/material.dart';


import '../../../../core/page/scaffold_start.dart';

class SelectionSignupOrLogin extends StatelessWidget {
  const SelectionSignupOrLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StartClass(
     
  num: 1.0,
      widgetstart: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Please login to continue",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.029),
            ),
            _WidgetLoginorsignup(
              "Login",
              const Color(0xffff6f00),
              Colors.white,
              () => Navigator.pushNamed(context, "/login"),
            ),
            _WidgetLoginorsignup(
                "SignUp",
                Colors.white,
                const Color(0xffff6f00),
                () => Navigator.pushNamed(context, "/register"))
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
          style: const TextStyle(fontSize: 20),
        )),
      ),
    );
  }
}
