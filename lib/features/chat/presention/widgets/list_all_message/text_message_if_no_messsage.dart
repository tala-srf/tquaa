import 'package:flutter/material.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:const [
          Text(
          " ooops! ",
          style: TextStyle(color: Color(0xffff6f00),fontSize: 40),
        ),
        Text(
          " No message yet.",
          style: TextStyle(color: Color(0xffff6f00),fontSize: 40),
        ),
        ],
      ),
    );
  }
}