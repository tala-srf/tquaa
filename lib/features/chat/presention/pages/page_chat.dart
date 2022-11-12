import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form_tuqaatech/features/chat/domin/entity/send_message.dart';

import 'package:test_form_tuqaatech/features/home_find_pertner/presention/widgets/app_bar.dart';
import '../bloc/sendmessage/bloc/send_message_bloc.dart';
import '../widgets/chat_page/message_widget.dart';

class PageChat extends StatelessWidget {
  String? nameuser;
  int? iduser;
  int? idsender;
  String? id;
  PageChat({Key? key, this.nameuser, this.idsender, this.iduser, this.id})
      : super(key: key);

  TextEditingController controllermessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(nameuser!),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageWidget(iduser: iduser, usermessage: id),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25), // if you need this
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controllermessage,
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          hintText: 'Write a message ..',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        String? message = controllermessage.text;
                        String? time = DateTime.now().toString();

                        if (controllermessage.text.isNotEmpty) {
                          BlocProvider.of<SendMessageBloc>(context).add(
                              MessageEvnet(SendMessageEntity(
                                  idsender, iduser, message, time)));
                         

                          controllermessage.clear();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
