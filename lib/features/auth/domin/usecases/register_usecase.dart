import 'package:dartz/dartz.dart';
import 'package:test_form_tuqaatech/core/error/error_type.dart';
import 'package:test_form_tuqaatech/features/auth/domin/entites/register_entity.dart';
import 'package:test_form_tuqaatech/features/auth/domin/entites/true_register.dart';

import '../repository/register_repository.dart';

class RegisterUsecase {
  final RegisterRepository repository;

  RegisterUsecase(this.repository);
  Future<Either<ErrorType, TrueRegister>> call(RegisterEntity register1) async {
    return await repository.register(register1);
  }
}
