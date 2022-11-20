import 'package:dartz/dartz.dart';
import 'package:test_form_tuqaatech/core/error/error_type.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/data/model/citypartner_model.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/domin/repository/city_partner_repositry.dart';

class CityPartnerUsecase {
  final CityPartnerRepditry cityPartnerRepditry;

  CityPartnerUsecase({required this.cityPartnerRepditry});
  Future<Either<ErrorType, CityPartnerModel>> call(int cityid, int countryid,
      int gender, int minAge, int maxage, String date) async {
    return await cityPartnerRepditry.getAllcitypartner(
        cityid, countryid, gender, minAge, maxage, date);
  }
}
