import 'dart:convert';
import 'package:test_form_tuqaatech/core/api/api_links.dart';
import 'package:test_form_tuqaatech/core/api/api_methods.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/data/model/citypartner_model.dart';
import '../../../../core/error/exception.dart';

abstract class CitypartnerDatasources {
  Future<CityPartnerModel> citypartner(int cityid, int countryid, int gender,
      int minAge, int maxage, String date);
}

class CitypartnerDatasourcesImp implements CitypartnerDatasources {
  @override
  Future<CityPartnerModel> citypartner(int cityid, int countryid, int gender,
      int minAge, int maxage, String date) async {
    var response =
        await ApiMethods().get(url: ApiGet.cityPartner, path: {}, query: {"Cityid":cityid , "Countryid": countryid,"Gender":gender,"MinAge":minAge,"MaxAge":maxage,"Date" : date},headeradd: {});


    if (response.statusCode == 200) {
      Map<String, dynamic> citypartner = jsonDecode(response.body);
      CityPartnerModel returnpartner = CityPartnerModel.fromJson(citypartner);
      return returnpartner;
    } else {
      throw ServerException();
    }
  }
}
