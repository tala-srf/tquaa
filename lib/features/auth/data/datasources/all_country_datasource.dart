import 'dart:convert';

import 'package:test_form_tuqaatech/features/auth/data/model/all_country_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/conf_api/conf.dart';
import '../../../../core/error/exception.dart';
abstract class AllCountryDataSources {
  Future<AllCountryModel> allCountry();
}

class AllCountryDataSourcesImp implements AllCountryDataSources {
  @override
  Future<AllCountryModel> allCountry() async {
    http.Response response = await http.get(
        Uri.parse(
          "${ServiceConfig.base_url}/api/services/app/Country/GetAllCountries",
        ),
   
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      Map<String, dynamic> allcountry = jsonDecode(response.body);
      AllCountryModel returnallcountry = AllCountryModel.fromJson(allcountry);
      return returnallcountry;
    } else {
      throw ServerException();
    }
    
  }
}