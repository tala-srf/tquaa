import 'package:dartz/dartz.dart';
import 'package:test_form_tuqaatech/features/auth/data/model/data_user_fire_model.dart';

import '../../../../core/error/error_type.dart';
import '../repository/register_repository.dart';

class DataUserFireUsecase {
  final RegisterRepository repository;

  DataUserFireUsecase({required this.repository});
  Future<Either<ErrorType, DataUserFireBaceModel>> call(
      String? firebasetoken) async {
    return await repository.datauserFire(firebasetoken);
  }
}
