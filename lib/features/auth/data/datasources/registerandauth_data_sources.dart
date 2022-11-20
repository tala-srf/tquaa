import 'dart:convert';

import 'package:test_form_tuqaatech/core/api/api_links.dart';
import 'package:test_form_tuqaatech/core/api/api_methods.dart';
import 'package:test_form_tuqaatech/core/error/exception.dart';
import 'package:test_form_tuqaatech/features/auth/data/model/regidter.dart';


abstract class RegisterDataSources {
  Future<RegisterModel> register(RegisterModel register);
}

class RegisterDataSourcesImp implements RegisterDataSources {
  @override
  Future<RegisterModel> register(RegisterModel register) async {
    var response = await ApiMethods().post(url: ApiPost.registerurl, body: register, query: {});

    if (response.statusCode == 200) {
      Map<String, dynamic> register = jsonDecode(response.body);
      RegisterModel returnregister = RegisterModel.fromJson(register);
      return returnregister;
    } else {
      throw ServerException();
    }
  }
}
