import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CityPartnerEntity extends Equatable {
  ResultEntity? result1;
  String? targetUrl;
  bool? success;
  String? error;
  bool? unAuthorizedRequest;
  bool? bAbp;
  CityPartnerEntity({this.bAbp,this.error,this.result1,this.success,this.targetUrl,this.unAuthorizedRequest });
  @override
  List<Object?> get props =>
      [result1, targetUrl, success, error, unAuthorizedRequest, bAbp];
}

class ResultEntity extends Equatable {
  int? totalCount;
  List<ItemsEntity>? items2;ResultEntity({this.items2,this.totalCount});


  @override

  List<Object?> get props => [items2,totalCount];
}

class ItemsEntity extends Equatable {
  int? prtnerId;
  int? cityId;
  int? age;
  int? gender;
  String? date;
  String? userName;
  String? cityName;
  int? id;

  ItemsEntity(
      {this.prtnerId,
      this.cityId,
      this.age,
      this.gender,
      this.date,
      this.userName,
      this.cityName,
      this.id});

  @override

  List<Object?> get props =>
      [prtnerId, cityId, cityName, age, gender, date, userName, id];
}
