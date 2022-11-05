import 'package:dartz/dartz.dart';
import 'package:test_form_tuqaatech/features/auth/domin/entites/login_entity.dart';
import 'package:test_form_tuqaatech/features/auth/domin/entites/register_entity.dart';
import 'package:test_form_tuqaatech/features/auth/domin/entites/token.dart';
import 'package:test_form_tuqaatech/features/auth/domin/entites/true_register.dart';

import '../../../../core/error/error_type.dart';

abstract class RegisterRepository {
  Future<Either<ErrorType, TrueRegister>> register(RegisterEntity register1);
  Future<Either<ErrorType, TokenEntity>> auth(LoginEntity loginEntity);
}
