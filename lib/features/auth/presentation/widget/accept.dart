import 'package:flutter/material.dart';
import 'package:test_form_tuqaatech/features/auth/presentation/widget/form_login.dart';

// ignore: must_be_immutable
class Accept extends StatefulWidget {
  String name;
  String line;

  Accept({Key? key, required this.name, required this.line,})
      : super(key: key);

  @override
  State<Accept> createState() => _AcceptState();
}

class _AcceptState extends State<Accept> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: value,
            onChanged: (value) {
              setState(() {
                this.value = value!;
                remeberme= value;
              });
            }),
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(color: Colors.black
                      ),
                ),
                Text(
                  widget.line,
                  style: const TextStyle(
                      color: Colors.black,               
                      decoration: TextDecoration.underline),
                ),
              ],
            )),
      ],
    );
  }
}
