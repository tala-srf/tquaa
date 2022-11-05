import 'package:flutter/material.dart';

class StartClass extends StatelessWidget {
  final Widget widgetstart;
  // Widget widgetbottom;
  final double num;

   const StartClass({
    Key? key,
    required this.widgetstart,
    required this.num,
    // required this.widgetbottom
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: widgetbottom,
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(num), BlendMode.dstATop),
                image: const AssetImage(
                  "asset/images/start.png",
                ),
                fit: BoxFit.cover)),
        child: widgetstart,
      ),
    );
  }
}
