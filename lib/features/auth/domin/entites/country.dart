import 'package:equatable/equatable.dart';

class ResultEntityCounrry extends Equatable {
  String? name;
  int? id;

  ResultEntityCounrry({this.id,this.name});
  @override
  List<Object?> get props => [name, id];
}
