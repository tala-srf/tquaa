import 'dart:convert';

import 'package:test_form_tuqaatech/core/api/api_links.dart';
import 'package:test_form_tuqaatech/core/api/api_methods.dart';
import 'package:test_form_tuqaatech/core/error/exception.dart';
import '../model/data_user_fire_model.dart';
abstract class DataUserFireDataSources {
  Future<DataUserFireBaceModel> dataUserFire(
     String? firebasetoken);
}

class DataUserFireDataSourcesImp implements DataUserFireDataSources {
  @override
  Future<DataUserFireBaceModel> dataUserFire(
     String? firebasetoken) async {
    var response = await ApiMethods().post(url: ApiPost.firebaseurl, body: {}, query: {
"firebaseToken": "$firebasetoken"

    });

    if (response.statusCode == 200) {
      Map<String, dynamic> dataUserFire = jsonDecode(response.body);
      DataUserFireBaceModel returnDataUserFire =
          DataUserFireBaceModel.fromJson(dataUserFire);

      return returnDataUserFire;
    } else {
      throw ServerException();
    }
  }
}
