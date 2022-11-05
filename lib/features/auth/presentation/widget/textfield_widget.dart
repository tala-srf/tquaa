import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  String name;
  String icon;
  TextEditingController controller;
  TextInputType  keyboard;
  TextFieldWidget(
      {Key? key,
      required this.keyboard,
      required this.name,
      required this.icon,
      required this.controller,
      }
      )
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
void initState() {
  super.initState();

 widget.controller.addListener(() {
    setState(() {});
  });
}
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextFormField(
                keyboardType:widget.keyboard,         
                controller: widget.controller,
                 obscureText: (widget.name=="Reenter password" || widget.name == 'Password') ? true :false,
                validator: (val) =>
                    val!.isEmpty ? "${widget.name} Can't be empty" : null,
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
                    hintText: widget.name,
                    suffixIcon:Image.asset(widget.icon ),
                    iconColor: widget.controller.text.isEmpty
                        ? Colors.grey
                        : const Color(0xffff6f00),
                    // icon: Image.asset(icon),
                    hintStyle: const TextStyle(color: Colors.grey)

                    //  icon:Icon(Icons.person_outline) ,
                    ),
                // controller: namecontroller,
              ),
            ),
          ),
          SizedBox(
              width: 20,
              child: widget.controller.text.isNotEmpty
                  ? const Icon(Icons.check,color: Color(0xffff6f00), )
                  : const Text(""))
        ],
      ),
    );
  }
}
