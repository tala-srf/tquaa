import 'package:flutter/material.dart';

import '../../../../../core/widget/select_form_field.dart';
import '../../../../auth/presentation/widget/list_selecet.dart';

class FirstWidgetInSearch extends StatelessWidget {
  const FirstWidgetInSearch({
    super.key,
    required this.controllercountry,
    required this.controllercity,
    required this.controllergender,
  });

  final TextEditingController controllercountry;
  final TextEditingController controllercity;
  final TextEditingController controllergender;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SelextFormField1(
              controller: controllercountry,
              name: "Country",
              item: items1[1]),
          SelextFormField1(
              controller: controllercity, name: "City", item: items1[2]),
          SelextFormField1(
            controller: controllergender,
            name: "partner's gender",
            item: items1[0],
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
