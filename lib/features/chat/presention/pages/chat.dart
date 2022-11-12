import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form_tuqaatech/core/widget/load.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/widgets/app_bar.dart';

import '../bloc/bloc_chat/bloc/chat_list_bloc.dart';
import '../bloc/bloc_image/bloc/image_bloc.dart';
import '../widgets/list_all_message/listtile_widget_chat.dart';
import '../widgets/list_all_message/text_message_if_no_messsage.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChatListBloc>(context).add(ChatEvnet());
    return Scaffold(
        appBar: appBar("Messages"),
        body: BlocBuilder<ChatListBloc, ChatListState>(
          builder: (context, state) {
            if (state is SuccessedChatList) {
              int? i = state.listchat.result?.length;
              return i == 0
                  ? TextMessage()
                  : ListView.builder(
                      padding: EdgeInsets.all(20),
                      itemCount: i,
                      itemBuilder: (context, index) {
                        String time =
                            " ${state.listchat.result![index].lastMessageTime}";
                        String contentMessage =
                            "${state.listchat.result![index].lastMessage}";
                        String usermessage =
                            "${state.listchat.result![index].id}";
                        String fullname =
                            "${state.listchat.result![index].fullName}";
                        int iduser = state.listchat.result![index].accountId!;
                        int idsender = state.listchat.result![index].contactId!;
                        BlocProvider.of<ImageBloc>(context)
                            .add(UrlImageEvent(idsender));
                        return ListTileWidgetChat(
                          usermessage: usermessage,
                          contentMessage: contentMessage,
                          time: time,
                          username: fullname,
                          idsender: idsender,
                          iduser: iduser,
                        );
                      },
                    );
            } else if (state is LoadingChatList) {
              return const LoadingWidget();
            } else {
              return const Text("");
            }
          },
        ));
  }
}
