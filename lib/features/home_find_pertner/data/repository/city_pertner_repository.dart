import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/data/model/citypartner_model.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/domin/entity/citypartner_entity.dart';
import 'package:test_form_tuqaatech/core/error/error_type.dart';
import 'package:dartz/dartz.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/domin/repository/city_partner_repositry.dart';

import '../../../../core/network/internet_checker.dart';
import '../datasources/cit_partner_datasources.dart';

class CitypartnerRepositoryImp implements CityPartnerRepditry {
  final InternetChecker internet;
  final CitypartnerDatasources citypartnerDatasources;

  CitypartnerRepositoryImp(this.internet, this.citypartnerDatasources);

  @override
  Future<Either<ErrorType, CityPartnerModel>> getAllcitypartner(
      int cityid, int countryid,String token,int gender,int minAge ,int maxage , String date) async{
  
 if (await internet.isConnected) {
      try {
        SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
       String token1= sharedPreferences.getString('backend_token') ??
              'EMPTY_TOKEN';
     final citypartner=   await citypartnerDatasources.citypartner(cityid,countryid,token1,gender,minAge,maxage,date);
        return Right(citypartner);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineError());
    }
  }
}
