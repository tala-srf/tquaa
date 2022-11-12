class ReturnSendMessageModel {
  Result? result;
  Null? targetUrl;
  bool? success;
  Null? error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  ReturnSendMessageModel(
      {this.result,
      this.targetUrl,
      this.success,
      this.error,
      this.unAuthorizedRequest,
      this.bAbp});

  ReturnSendMessageModel.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    targetUrl = json['targetUrl'];
    success = json['success'];
    error = json['error'];
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['targetUrl'] = this.targetUrl;
    data['success'] = this.success;
    data['error'] = this.error;
    data['unAuthorizedRequest'] = this.unAuthorizedRequest;
    data['__abp'] = this.bAbp;
    return data;
  }
}

class Result {
  int? recipientID;
  int? who;
  String? message;
  String? time;

  Result({this.recipientID, this.who, this.message, this.time});

  Result.fromJson(Map<String, dynamic> json) {
    recipientID = json['recipientID'];
    who = json['who'];
    message = json['message'];
    time = json['time'];
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