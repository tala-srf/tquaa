import 'dart:convert';

import 'package:test_form_tuqaatech/core/error/exception.dart';
import 'package:test_form_tuqaatech/features/auth/data/model/regidter.dart';
import 'package:http/http.dart' as http;

import '../../../../core/conf_api/conf.dart';

abstract class RegisterDataSources {
  Future<RegisterModel> register(RegisterModel register);
}

class RegisterDataSourcesImp implements RegisterDataSources {
  @override
  Future<RegisterModel> register(RegisterModel register) async {
    http.Response response = await http.post(
        Uri.parse(
          "${ServiceConfig.base_url}/api/services/app/Account/Register",
        ),
        body: jsonEncode(register),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      Map<String, dynamic> register = jsonDecode(response.body);
      RegisterModel returnregister = RegisterModel.fromJson(register);
      return returnregister;
    } else {
      throw ServerException();
    }
  }
}
