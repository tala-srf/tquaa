part of 'allcountry_bloc.dart';

abstract class AllcountryEvent extends Equatable {
  const AllcountryEvent();

  @override
  List<Object> get props => [];
}

class CountryEvent extends AllcountryEvent {
  CountryEvent();
}

