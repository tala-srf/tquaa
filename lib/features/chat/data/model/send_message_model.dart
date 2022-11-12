import '../../domin/entity/send_message.dart';

class SendMessageModel extends SendMessageEntity {
  int? recipientID;
  int? who;
  String? message;
  String? time;

  SendMessageModel({this.recipientID, this.who, this.message, this.time})
      : super(recipientID, who, message, time);

  factory SendMessageModel.fromJson(Map<String, dynamic> json) {
    return SendMessageModel(recipientID:  json['recipientID'],
   who:  json['who'],
    message:  json['message'],
    time:  json['time']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recipientID'] = this.recipientID;
    data['who'] = this.who;
    data['message'] = this.message;
    data['time'] = this.time;
    return data;
  }
}
