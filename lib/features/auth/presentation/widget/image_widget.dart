import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/string/const.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  
  final ImagePicker imagePicker = ImagePicker();
  File? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 3),
            ),
            child: (image != null)
                ? Image.file(image!)
                : Image.asset("asset/icons/image.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: IconButton(
                  onPressed: () => pickImage(ImageSource.gallery),
                  icon: const Icon(Icons.add_a_photo)),
            ),
          ),
        ],
      ),
    );
  }

  pickImage(ImageSource source) async {
    XFile? xFileImage = await imagePicker.pickImage(source: source);
    final byte = File(xFileImage!.path).readAsBytesSync();
    base64Image = base64Encode(byte);


    if (xFileImage != null) {
      image = File(xFileImage.path);
      setState(() {
        base64Image;
      });
    }
  }
}
