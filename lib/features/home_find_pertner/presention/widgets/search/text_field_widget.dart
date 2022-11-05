// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFieldWidgetSearch extends StatelessWidget {
  TextInputType? keyboardType;
  String? name;
    TextEditingController controller;
  TextFieldWidgetSearch(
      {Key? key, required this.keyboardType, required this.name,required this.controller})
      : super(key: key);
@override
  Widget build(BuildContext context) {
    return SizedBox(

      width:  MediaQuery.of(context).size.height / MediaQuery.of(context).size.width >
                1? MediaQuery.of(context).size.width *0.3 :MediaQuery.of(context).size.width *0.14,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TextFormField(
          
          keyboardType: keyboardType,
          controller: controller,
    
          style: const TextStyle(color: Colors.black),
          showCursor: true,
    
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
              hintText: name,
              // icon: Image.asset(icon),
              hintStyle: const TextStyle(color: Colors.grey)
    
              //  icon:Icon(Icons.person_outline) ,
              ),
          // controller: namecontroller,
        ),
      ),
    );
  }
}
