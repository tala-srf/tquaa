import 'package:flutter/material.dart';
import 'package:test_form_tuqaatech/core/string/const.dart';

import '../../../../../core/widget/select_form_field.dart';
import '../../../../auth/presentation/widget/list_selecet_gender.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class SelectCityCountryAndGenderWidgetInSearch extends StatelessWidget {
  SelectCityCountryAndGenderWidgetInSearch({
    super.key,
    required this.controllercountry,
    required this.controllercity,
    required this.controllergender,
  });

  final TextEditingController controllercountry;
  final TextEditingController controllercity;
  final TextEditingController controllergender;

  @override

  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SelectFormFieldWidgetCore(
            controller: controllercountry,
            name: "Country",
            item: allcountry.isEmpty ? empty : allcountry),
        SelectFormFieldWidgetCore(
            controller: controllercity,
            name: "City",
            item: allcity.isEmpty ? empty : allcity),
        SelectFormFieldWidgetCore(
          controller: controllergender,
          name: "partner's gender",
          item: gendermap,
        ),
        Text(
          "partner's age :",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 0.35.dp),
        ),
      ],
    );
  }
}
