import 'package:flutter/material.dart';
import 'package:test_form_tuqaatech/core/string/image_manger.dart';

class ScaffoldStart extends StatelessWidget {
  final Widget widgetstart;
  // Widget widgetbottom;
  final double num;

   const ScaffoldStart({
    Key? key,
    required this.widgetstart,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(num), BlendMode.dstATop),
                image:  AssetImage(
                 AppImageManger.pathImagestart,
                ),
                fit: BoxFit.cover)),
        child: widgetstart,
      ),
    );
  }
}
