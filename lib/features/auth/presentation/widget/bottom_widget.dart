import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class BottomWidget extends StatelessWidget {
    String bottom;
  String textbutton;
 void Function() onPressed;
   BottomWidget({Key? key,required this.bottom,required this.onPressed,required this.textbutton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        color: Colors.black,
        height: 0.3.h,
        width: 90.w,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(bottom),
          TextButton(
              onPressed: onPressed,
              child: Text(
                textbutton,
                style:const TextStyle(color: Color(0xffff6f00)),
              ))
        ],
      )
    ]);
  }
}
