import 'package:flutter/material.dart';
import 'package:test_form_tuqaatech/core/string/image_manger.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/widgets/app_bar.dart';



class HomeWelcome extends StatelessWidget {
  const HomeWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Home"),
      
      
      body: Container(
      decoration:  BoxDecoration(image: DecorationImage(image: AssetImage(AppImageManger.pathImageWelcome)),)
      ),
    );
  }
}