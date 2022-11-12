import 'package:dartz/dartz.dart';
import 'package:test_form_tuqaatech/core/error/error_type.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/data/model/citypartner_model.dart';

abstract class CityPartnerRepditry {
  Future<Either<ErrorType, CityPartnerModel>> getAllcitypartner(int cityid ,
int countryid ,String token,int gender,int minAge ,int maxage , String date);
}
