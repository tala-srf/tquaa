import 'package:flutter/material.dart';
import 'package:test_form_tuqaatech/core/string/const.dart';

import '../../../../../core/widget/select_form_field.dart';
import '../../../../auth/presentation/widget/list_selecet.dart';



class FirstWidgetInSearch extends StatefulWidget {
  FirstWidgetInSearch({
    super.key,
    required this.controllercountry,
    required this.controllercity,
    required this.controllergender,
  });

  final TextEditingController controllercountry;
  final TextEditingController controllercity;
  final TextEditingController controllergender;

  @override
  State<FirstWidgetInSearch> createState() => _FirstWidgetInSearchState();
}

class _FirstWidgetInSearchState extends State<FirstWidgetInSearch> {
  @override

  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SelextFormField1(
              controller: widget.controllercountry,
              name: "Country",
              item: allcountry.isEmpty ? empty : allcountry),
          SelextFormField1(
              controller: widget.controllercity,
              name: "City",
              item: allcity.isEmpty ? empty : allcity),
          SelextFormField1(
            controller: widget.controllergender,
            name: "partner's gender",
            item: gendermap,
          ),
          Text(
            "partner's age :",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.03),
          ),
        ],
      ),
    );
  }
}
