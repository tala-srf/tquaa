// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   HomePageState createState() => HomePageState();
// }

// class HomePageState extends State<HomePage> {
//   final ImagePicker imagePicker = ImagePicker();
//   File? image;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Image Picker Example'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue,
//                 textStyle: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               onPressed: () => pickImage(ImageSource.gallery ),
//               child: const Text('Pick Image from Gallery'),
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue,
//                 textStyle: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               onPressed: () => pickImage(ImageSource.camera),
//               child: const Text('Pick Image from Camera'),
//             ),
//             if (image != null) Image.file(image!)
//           ],
//         ),
//       ),
//     );
//   }

//   pickImage(ImageSource source) async {
//     XFile? xFileImage = await imagePicker.pickImage(source: source);
//     final byte = File(xFileImage!.path).readAsBytesSync() ;
//     String base64Image =  "data:image/png;base64,"+base64Encode(byte);

//     print("img_pan : $base64Image");

//     print(xFileImage);
//     if (xFileImage != null) {
//       image = File(xFileImage.path);
//       setState(() {});
//     }
//   }
// }
