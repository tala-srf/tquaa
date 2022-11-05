import 'package:flutter/material.dart';

class ListTileWidgetChat extends StatelessWidget {
  const ListTileWidgetChat({
    super.key,
    required this.usermessage,
    required this.contentMessage,
    required this.time,
  });

  final String usermessage;
  final String contentMessage;
  final String time;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            usermessage,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(contentMessage)
        ],
      ),
      leading: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 3),
        ),
        child: Image.asset("asset/icons/image.png"),
      ),
      trailing: Text(
        time.substring(0, 11),
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
