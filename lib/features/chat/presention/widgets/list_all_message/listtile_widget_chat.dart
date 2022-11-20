import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form_tuqaatech/core/string/image_manger.dart';
import 'package:test_form_tuqaatech/features/chat/presention/bloc/bloc_dialog_chat/bloc/get_dialog_by_chat_id_bloc.dart';
import 'package:test_form_tuqaatech/features/chat/presention/pages/page_chat.dart';
import '../../bloc/bloc_image/bloc/image_bloc.dart';
import '../cash_message.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
class ListTileWidgetChat extends StatelessWidget {
  const ListTileWidgetChat(
      {super.key,
      required this.usermessage,
      required this.contentMessage,
      required this.time,
      required this.username,
      required this.idsender,
      required this.iduser});

  final String usermessage;
  final String contentMessage;
  final String time;
  final String username;
  final int iduser;
  final int idsender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(contentMessage)
            ],
          ),
          leading: Container(
            width: 14.w,
            height: 11.h,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 3),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(AppImageManger.pathIconImage),
                UrlImage(idsender: idsender),
              ],
            ),
          ),
          trailing: Text(
            time.substring(0, 11),
            style: const TextStyle(color: Colors.grey),
          ),
          onTap: () {
            BlocProvider.of<GetDialogByChatIdBloc>(context)
                .add(ChatByidEvnet(usermessage));

            cashmessage();
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => PageChat(
                    nameuser: username,
                    idsender: idsender,
                    iduser: iduser,
                    id: usermessage),
              ),
            );
          }),
    );
  }
}

class UrlImage extends StatelessWidget {
  int idsender;
  UrlImage({
    super.key,required this.idsender
  });

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<ImageBloc>(context).add(UrlImageEvent(idsender));
    return BlocBuilder<ImageBloc, ImageState>(
      builder: (context, state) {
        if (state is SuccessedImage) {
          return Image.network(state.urlimage!);
        } else {
          return Image.asset(AppImageManger.pathIconImage);
        }
      },
    );
  }
}
