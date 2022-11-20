import 'package:test_form_tuqaatech/features/auth/domin/entites/token.dart';

// ignore: must_be_immutable
class TokenModel  {
  Result? result;
  String? targetUrl;
  bool? success;
  String? error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  TokenModel(
      {this.result,
      this.targetUrl,
      this.success,
      this.error,
      this.unAuthorizedRequest,
      this.bAbp})
      ;

  TokenModel.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? Result.fromJson(json['result']) : null;
    targetUrl = json['targetUrl'];
    success = json['success'];
    error = json['error'];
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['targetUrl'] = targetUrl;
    data['success'] = success;
    data['error'] = error;
    data['unAuthorizedRequest'] = unAuthorizedRequest;
    data['__abp'] = bAbp;
    return data;
  }
}

class Result {
  String? accessToken;
  String? encryptedAccessToken;
  int? expireInSeconds;
  int? userId;

  Result(
      {this.accessToken,
      this.encryptedAccessToken,
      this.expireInSeconds,
      this.userId});

  Result.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    encryptedAccessToken = json['encryptedAccessToken'];
    expireInSeconds = json['expireInSeconds'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['encryptedAccessToken'] = this.encryptedAccessToken;
    data['expireInSeconds'] = this.expireInSeconds;
    data['userId'] = this.userId;
    return data;
  }
}
