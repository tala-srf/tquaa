import 'package:flutter/material.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/widgets/search/text_field_widget.dart';

class SecondWidgetInSearch extends StatelessWidget {
  const SecondWidgetInSearch({
    super.key,
    required this.controllerbettwenage,
    required this.controllerandage,
  });

  final TextEditingController controllerbettwenage;
  final TextEditingController controllerandage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(

        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Between   ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:
                        MediaQuery.of(context).size.height * 0.02),
              ),
              Text(
                "And",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:
                        MediaQuery.of(context).size.height * 0.02),
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
      ),
    );
  }
}

