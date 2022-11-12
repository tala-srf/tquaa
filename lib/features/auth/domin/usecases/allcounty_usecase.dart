
import 'package:dartz/dartz.dart';
import 'package:test_form_tuqaatech/features/auth/data/model/all_country_model.dart';

import '../../../../core/error/error_type.dart';
import '../repository/register_repository.dart';

class AllCountryUsecase {
  final RegisterRepository repository;

  AllCountryUsecase(this.repository);
  Future<Either<ErrorType, AllCountryModel>> call() async {
    return await repository.allcountry();
  }
}
