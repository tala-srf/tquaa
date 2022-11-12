import 'package:equatable/equatable.dart';

class SendMessageEntity extends Equatable {
  int? recipientID;
  int? who;
  String? message;
  String? time;

  SendMessageEntity(this.recipientID, this.who, this.message, this.time);
  @override
  List<Object?> get props => [recipientID, who, message, time];
}
