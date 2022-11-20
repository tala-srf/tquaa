import 'dart:convert';

import 'package:test_form_tuqaatech/core/api/api_links.dart';
import 'package:test_form_tuqaatech/core/api/api_methods.dart';
import 'package:test_form_tuqaatech/core/error/exception.dart';
import 'package:test_form_tuqaatech/features/auth/data/model/login_model.dart';

import 'package:test_form_tuqaatech/features/auth/data/model/token_model.dart';


abstract class AuthDataSources {
  Future<TokenModel> auth(LoginModel loginModel);
}

class AuthDataSourcesImp implements AuthDataSources {
  @override
  Future<TokenModel> auth(LoginModel loginModel) async {
    var response = await ApiMethods().post(
        url: ApiPost.loginUrl,
        body: loginModel,
        query: {
          
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
