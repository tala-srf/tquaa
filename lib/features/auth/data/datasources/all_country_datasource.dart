import 'dart:convert';

import 'package:test_form_tuqaatech/core/api/api_links.dart';
import 'package:test_form_tuqaatech/core/api/api_methods.dart';
import 'package:test_form_tuqaatech/features/auth/data/model/all_country_model.dart';
import '../../../../core/error/exception.dart';
abstract class AllCountryDataSources {
  Future<AllCountryModel> allCountry();
}

class AllCountryDataSourcesImp implements AllCountryDataSources {
  @override
  Future<AllCountryModel> allCountry() async {
    var response = await ApiMethods().get(
     url:ApiGet.allcountryurl ,
     path:{} ,
     query:{} ,
     headeradd: {}
     );

    if (response.statusCode == 200) {
      Map<String, dynamic> allcountry = jsonDecode(response.body);
      AllCountryModel returnallcountry = AllCountryModel.fromJson(allcountry);
      return returnallcountry;
    } else {
      throw ServerException();
    }
    
  }
}