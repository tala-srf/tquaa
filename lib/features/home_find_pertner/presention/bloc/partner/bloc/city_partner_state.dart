part of 'city_partner_bloc.dart';

abstract class CityPartnerState extends Equatable {
  const CityPartnerState();

  @override
  List<Object> get props => [];
}

class CityPartnerInitial extends CityPartnerState {}

class LoadingCityPartner extends CityPartnerState {}

class ErrorNetCityPartner extends CityPartnerState {
  String? error;
  ErrorNetCityPartner(this.error);
}

class SuccessedCityPartner extends CityPartnerState {
  CityPartnerModel partner;
  SuccessedCityPartner(this.partner);
}
