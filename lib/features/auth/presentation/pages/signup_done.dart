import 'package:flutter/material.dart';
import 'package:test_form_tuqaatech/core/page/scaffold_start.dart';
import '../../../../core/widget/elevated_button.dart';

class SignupDone extends StatelessWidget {
  const SignupDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return StartClass(
      num: 0.2,
      widgetstart: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextDone(signIn: "Sign in !",bold: FontWeight.bold,),
            TextDone(signIn: "Please sign in",bold: FontWeight.normal,),
            TextDone(signIn: "to countinue to the app",bold: FontWeight.normal,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ButtonWidget(name: "Done",newVariable: "",onPressed: () =>  Navigator.popAndPushNamed(context,"/login"), ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextDone extends StatelessWidget {
    FontWeight bold ;
    String signIn ;
   TextDone({
    super.key,required this.bold,required this.signIn
  });

  @override
  Widget build(BuildContext context) {
    return Text(signIn ,style: TextStyle(fontWeight: bold ,fontSize: 22),);
  }
}