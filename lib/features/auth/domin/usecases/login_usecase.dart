import 'package:dartz/dartz.dart';
import 'package:test_form_tuqaatech/features/auth/data/model/token_model.dart';
import 'package:test_form_tuqaatech/features/auth/domin/entites/login_entity.dart';

import '../../../../core/error/error_type.dart';
import '../repository/register_repository.dart';

class LoginUsecase {
  final RegisterRepository repository;

  LoginUsecase({required this.repository});
  Future<Either<ErrorType, TokenModel>> call(
      {required LoginEntity loginEntity}) async {
    return await repository.auth(loginEntity);
  }
}
