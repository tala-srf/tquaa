import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: SizedBox(
          height: 7.h,
          width: 7.w,
          child: CircularProgressIndicator(
       
          ),
        ),
      ),
    );
  }
}