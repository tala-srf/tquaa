
// ignore_for_file: must_be_immutable

import 'package:test_form_tuqaatech/features/home_find_pertner/domin/entity/citypartner_entity.dart';


class CityPartnerModel extends CityPartnerEntity {
  
  Result? result;
  String? targetUrl;
  bool? success;
  String? error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  CityPartnerModel(
      {this.result,
      this.targetUrl,
      this.success,
      this.error,
      this.unAuthorizedRequest,
      this.bAbp}) :super( bAbp: bAbp,error: error,result1: result,success: success,targetUrl: targetUrl,unAuthorizedRequest: unAuthorizedRequest)
      ;

  CityPartnerModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    targetUrl = json['targetUrl'];
    success = json['success'];
    error = json['error'];
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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

class Result extends ResultEntity{
  int? totalCount;
  List<Items>? items;

  Result({this.totalCount, this.items}):super(items2: items,totalCount: totalCount) ;

  Result.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['totalCount'] = totalCount;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items   extends ItemsEntity{
  int? prtnerId;
  
  int? cityId;
  int? age;
  int? gender;
  String? date;
  String? userName;
  String? cityName;
  int? id;

  Items(
      {this.prtnerId,
      this.cityId,
      this.age,
      this.gender,
      this.date,
      this.userName,
      this.cityName,
      this.id}):super(age: age,cityId: cityId,cityName: cityName,date: date,gender: gender,id: id,prtnerId: prtnerId,userName: userName);

  Items.fromJson(Map<String, dynamic> json) {
    prtnerId = json['prtnerId'];
    cityId = json['cityId'];
    age = json['age'];
    gender = json['gender'];
    date = json['date'];
    userName = json['userName'];
    cityName = json['cityName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prtnerId'] = prtnerId;
    data['cityId'] = cityId;
    data['age'] = age;
    data['gender'] = gender;
    data['date'] = date;
    data['userName'] = userName;
    data['cityName'] = cityName;
    data['id'] = id;
    return data;
  }
}

