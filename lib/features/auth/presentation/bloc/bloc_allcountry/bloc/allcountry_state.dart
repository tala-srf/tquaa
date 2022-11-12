part of 'allcountry_bloc.dart';

abstract class AllcountryState extends Equatable {
  const AllcountryState();
  
  @override
  List<Object> get props => [];
}

class AllcountryInitial extends AllcountryState {}

class LoadingAllcountry extends AllcountryState {}

// ignore: must_be_immutable
class ErrorNetAllcountry extends AllcountryState {
  String? error;
  ErrorNetAllcountry({this.error});
}

// ignore: must_be_immutable
class SuccessedAllcountry extends AllcountryState {
  AllCountryModel allCountryModel;
  SuccessedAllcountry({required this.allCountryModel});
}
class SuccessedAllcity extends AllcountryState {
  AllCountryModel allCountryModel;
  SuccessedAllcity({required this.allCountryModel});
}