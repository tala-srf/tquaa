import 'package:flutter/material.dart';

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
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          "Age : $age",
          style: const TextStyle(fontSize: 15),
        ),
        const Text(
          "Restaurant name : Name",
          style: TextStyle(fontSize: 15),
        )
      ],
    );
  }
}
