import 'package:flutter/material.dart';


import '../../../../core/widget/select_form_field.dart';


// ignore: must_be_immutable
class SelectFormFieldWidget extends StatefulWidget {
  final String name;
  TextEditingController controller;
  List<Map<String, dynamic>> item;

  SelectFormFieldWidget({
    Key? key,
    required this.controller,
    required this.name,
    required this.item,
  }) : super(key: key);

  @override
  State<SelectFormFieldWidget> createState() => _SelectFormFieldWidgetState();
}

class _SelectFormFieldWidgetState extends State<SelectFormFieldWidget> {
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
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Row(
          children: [
            SelextFormField1(controller: widget.controller,name: widget.name,item: widget.item),
           SizedBox(
              width: 20,
              child: widget.controller.text.isNotEmpty
                  ? const Icon(Icons.check,color: Color(0xffff6f00), )
                  : const Text(""))
          ],
        ),
      ),
    );
  }
}
