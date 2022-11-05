import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  void Function()? onPressed;
  String name;
   String newVariable ;
  ButtonWidget({Key? key, required this.onPressed,required this.name,required this.newVariable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
   
    return Container(
      width: 350,
      height: double.tryParse(newVariable),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
          backgroundColor: MaterialStateProperty.all(const Color(0xffff6f00)),
          minimumSize: const MaterialStatePropertyAll(Size(0, 60)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          side: MaterialStateProperty.all(
              const BorderSide(color: Color(0xffff6f00), width: 1.5)),
        ),
        onPressed: onPressed,
        child: Center(
            child: Text(
          name,
          style: const TextStyle(fontSize: 20),
        )),
      ),
    );
  }
}
