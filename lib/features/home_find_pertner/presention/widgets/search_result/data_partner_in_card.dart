import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DataPartnerInCard extends StatelessWidget {
  String age;
  String partnername;
   DataPartnerInCard({
    super.key,required this.age,required this.partnername
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          partnername,
          style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 0.3.dp),
        ),
        Text(
          "Age : $age",
          style:  TextStyle(fontSize: 0.28.dp),
        ),
         Text(
          "Restaurant name : Name",
          style: TextStyle(fontSize: 0.28.dp),
        )
      ],
    );
  }
}
