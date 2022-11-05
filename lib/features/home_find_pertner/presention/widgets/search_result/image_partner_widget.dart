import 'package:flutter/material.dart';

class ImagePartnerWidget extends StatelessWidget {
  const ImagePartnerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 50, top: 10, left: 10, right: 10),
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 3),
        ),
        child: Image.asset("asset/icons/image.png"),
      ),
    );
  }
}
