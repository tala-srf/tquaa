import 'dart:convert';

import 'package:test_form_tuqaatech/core/error/exception.dart';
import 'package:test_form_tuqaatech/features/auth/data/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:test_form_tuqaatech/features/auth/data/model/token_model.dart';

import '../../../../core/conf_api/conf.dart';
abstract class AuthDataSources {
  Future<TokenModel> auth(LoginModel loginModel);
}

class AuthDataSourcesImp implements AuthDataSources {
  @override
  Future<TokenModel> auth(LoginModel loginModel) async {
    http.Response response = await http.post(
        Uri.parse(
          "${ServiceConfig.base_url}/api/TokenAuth/Authenticate",
        ),
        body: jsonEncode(loginModel),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      Map<String, dynamic> login = jsonDecode(response.body);
      TokenModel returnlogin = TokenModel.fromJson(login);
      return returnlogin;
    } else {
      throw ServerException();
    }
    
  }
}