import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Accept extends StatefulWidget {
  String name;
  String line;
  Accept({Key? key, required this.name,required this.line}) : super(key: key);

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
              });
            }),
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(color: Colors.black
                      // fontSize: MediaQuery.of(context).size.width * 0.02,
                      ),
                ),
                 Text(
                  widget.line,
                  style: const TextStyle(
                      color: Colors.black,
                      // fontSize: MediaQuery.of(context).size.width * 0.02,
                      decoration: TextDecoration.underline),
                ),
              ],
            )),
      ],
    );
  }
}
