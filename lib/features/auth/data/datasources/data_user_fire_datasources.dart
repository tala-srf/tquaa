import 'dart:convert';

import 'package:test_form_tuqaatech/core/error/exception.dart';

import '../../../../core/conf_api/conf.dart';
import '../model/data_user_fire_model.dart';
import 'package:http/http.dart' as http;
abstract class DataUserFireDataSources {
  Future<DataUserFireBaceModel> dataUserFire(String token);
}

class DataUserFireDataSourcesImp implements DataUserFireDataSources {
  @override
  Future<DataUserFireBaceModel> dataUserFire(String token) async {
    http.Response response = await http.post(
        Uri.parse(
          "${ServiceConfig.base_url}/api/services/app/User/InsertFireBaseToken",//add parameter ?firebaseToken= " "
        ),
        headers: {
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      Map<String, dynamic> dataUserFire = jsonDecode(response.body);
      DataUserFireBaceModel returnDataUserFire = DataUserFireBaceModel.fromJson(dataUserFire);

      return returnDataUserFire;
    } else {
      throw ServerException();
    }
  }
}
