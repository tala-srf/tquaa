part of 'city_partner_bloc.dart';

abstract class CityPartnerEvent extends Equatable {
  const CityPartnerEvent();

  @override
  List<Object> get props => [];
}

class PartnerEvent extends CityPartnerEvent {
  final int cityid;
  final int countryId;
  final int gender;
  final int minAge;
  final int maxage;
 final String date;

  PartnerEvent({required this.cityid, required this.countryId,required this.gender,required this.minAge,required this.maxage,required this.date});

  @override
  List<Object> get props => [cityid, countryId];
}
