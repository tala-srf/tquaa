import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:test_form_tuqaatech/core/string/image_manger.dart';
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
        width: 15.w,
        height: 9.h,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 3),
        ),
        child: Image.asset(AppImageManger.pathIconImage),
      ),
    );
  }
}
