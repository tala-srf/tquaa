import 'package:dartz/dartz.dart';
import 'package:test_form_tuqaatech/features/auth/domin/entites/login_entity.dart';
import 'package:test_form_tuqaatech/features/auth/domin/entites/token.dart';

import '../../../../core/error/error_type.dart';
import '../repository/register_repository.dart';

class LoginUsecase {
  final RegisterRepository repository;

  LoginUsecase(this.repository);
  Future<Either<ErrorType, TokenEntity>> call(LoginEntity loginEntity) async {
    return await repository.auth(loginEntity);
  }
}
