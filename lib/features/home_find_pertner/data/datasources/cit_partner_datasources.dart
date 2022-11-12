import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_form_tuqaatech/features/home_find_pertner/data/model/citypartner_model.dart';

import '../../../../core/conf_api/conf.dart';
import '../../../../core/error/exception.dart';

abstract class CitypartnerDatasources {
  Future<CityPartnerModel> citypartner(int cityid, int countryid, String token,int gender,int minAge ,int maxage , String date);
}

class CitypartnerDatasourcesImp implements CitypartnerDatasources {
  @override
  Future<CityPartnerModel> citypartner(
      int cityid, int countryid, String token,int gender,int minAge ,int maxage , String date) async {
    http.Response response = await http.get(
        Uri.parse(
          "${ServiceConfig.base_url}/api/services/app/CityPartner/GetAll?Cityid=$cityid&Countryid=$countryid&Gender=$gender&MinAge=$minAge&MaxAge=$maxage&Date=$date",
        ),
        headers: {'Authorization': 'Bearer $token'});

  
    if (response.statusCode == 200) {
      Map<String, dynamic> citypartner = jsonDecode(response.body);
      CityPartnerModel returnpartner = CityPartnerModel.fromJson(citypartner);
      return returnpartner;
    } else {
      throw ServerException();
    }
  }
}
