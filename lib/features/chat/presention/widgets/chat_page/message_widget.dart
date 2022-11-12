import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bloc_dialog_chat/bloc/get_dialog_by_chat_id_bloc.dart';
import '../cash_message.dart';

class MessageWidget extends StatefulWidget {
  const MessageWidget(
      {super.key, required this.iduser, required this.usermessage});

  final int? iduser;
  final String? usermessage;

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  int? lenghtchat;

  Timer? timer;

  @override
  void initState() {
    cashmessage();
    Timer(const Duration(seconds: 3), () {
   const Center(child:   CircularProgressIndicator());
    });
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (Timer t) async {
      cashmessage();

      checkForNewSharedLists();
    });
  }

  void checkForNewSharedLists() {
    BlocProvider.of<GetDialogByChatIdBloc>(context)
        .add(ChatByidEvnet(widget.usermessage!));

    setState(() {});
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cashdialog == null) {
      return Container();
    } else {
      lenghtchat = cashdialog!.result!.dialogs!.length;
      cashdialog!.result!.dialogs!.sort((a, b) => (a.id!).compareTo(b.id!));
      return Container(
        child: Expanded(
          child: ListView.builder(
              itemCount: lenghtchat,
              itemBuilder: (context, index) {
                int? user = cashdialog!.result!.dialogs![index].who;
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                    user == widget.iduser ? 64.0 : 16.0,
                    4,
                    user == widget.iduser ? 16.0 : 64.0,
                    4,
                  ),
                  child: Align(
                    alignment: user == widget.iduser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: user == widget.iduser
                            ? Colors.white70
                            : Colors.black,
                        borderRadius: user == widget.iduser
                            ? const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))
                            : const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                            "${cashdialog!.result!.dialogs![index].message}",
                            style: TextStyle(
                                color: user == widget.iduser
                                    ? Colors.black
                                    : Colors.white)),
                      ),
                    ),
                  ),
                );
              }),
        ),
      );
    }
  }
}
