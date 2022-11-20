import 'package:flutter/material.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/widgets/search/text_field_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectAgeWidgetInSearch extends StatelessWidget {
  const SelectAgeWidgetInSearch({
    super.key,
    required this.controllerbettwenage,
    required this.controllerandage,
  });

  final TextEditingController controllerbettwenage;
  final TextEditingController controllerandage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Between   ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 0.3.dp),
            ),
            Text(
              "And",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 0.3.dp),
            ),
          ],
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWidgetSearch(
                controller: controllerbettwenage,
                keyboardType: TextInputType.number,
                name: "Age",
              ),
              TextFieldWidgetSearch(
                controller: controllerandage,
                keyboardType: TextInputType.number,
                name: "Age",
              )
            ],
          ),
        ),
      ],
    );
  }
}
