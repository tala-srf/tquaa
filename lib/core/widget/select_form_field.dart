import 'package:flutter/material.dart';

import 'package:select_form_field/select_form_field.dart';
import 'package:test_form_tuqaatech/core/string/const.dart';

String valuecountry = "";

List<Map<String, dynamic>> citySel = [];

class SelextFormField1 extends StatefulWidget {
  TextEditingController controller;
  List<Map<String, dynamic>> item;

  final String name;
  SelextFormField1({
    Key? key,
    required this.controller,
    required this.item,
    required this.name,
  }) : super(key: key);

  @override
  State<SelextFormField1> createState() => _SelextFormField1State();
}

class _SelextFormField1State extends State<SelextFormField1> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      setState(() {});
    });
  }

  void selcity() {
    for (int c = 0; c < allcity.length; c++) {
      for (final mapEntry in allcity[c].entries) {
        final key = mapEntry.key;
        final value = mapEntry.value;
        if (key == "key" && value == valuecountry) {
          Map<String, dynamic> city = {
            if (key == "label") 'label': '$value',
            if (key == value) 'value': '$value',
          };
          citySel.add(city);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SelectFormField(
        validator: (val) => val!.isEmpty ? "Can't be empty" : null,
        type: SelectFormFieldType.dropdown, // or can be dialog
        initialValue: 'circle',

        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: Colors.white),
            ),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            hintText: widget.name,
            suffixIcon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),

            // icon: Image.asset(icon),
            hintStyle: const TextStyle(color: Colors.grey)

            //  icon:Icon(Icons.person_outline) ,
            ),

        items: widget.item,

        onChanged: (val) {
          setState(() {
            if (widget.item != empty) {
              widget.controller.text = val;
              valuecountry = val;
              
              selcity();
            }
          });
        },
        onSaved: (val) {
          setState(() {});
        },
      ),
    );
  }
}
