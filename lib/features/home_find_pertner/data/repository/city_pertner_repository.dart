import 'package:test_form_tuqaatech/features/home_find_pertner/data/model/citypartner_model.dart';

import 'package:test_form_tuqaatech/core/error/error_type.dart';
import 'package:dartz/dartz.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/domin/repository/city_partner_repositry.dart';

import '../../../../core/network/internet_checker.dart';
import '../datasources/cit_partner_datasources.dart';

class CitypartnerRepositoryImp implements CityPartnerRepditry {
  final InternetChecker internet;
  final CitypartnerDatasources citypartnerDatasources;

  CitypartnerRepositoryImp(
      {required this.internet, required this.citypartnerDatasources});

  @override
  Future<Either<ErrorType, CityPartnerModel>> getAllcitypartner(int cityid,
      int countryid, int gender, int minAge, int maxage, String date) async {
    if (await internet.isConnected) {
      try {
        final citypartner = await citypartnerDatasources.citypartner(
            cityid, countryid, gender, minAge, maxage, date);
        return Right(citypartner);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineError());
    }
  }
}
