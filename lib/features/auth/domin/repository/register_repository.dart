import 'package:dartz/dartz.dart';
import 'package:test_form_tuqaatech/features/auth/data/model/token_model.dart';
import 'package:test_form_tuqaatech/features/auth/domin/entites/login_entity.dart';
import 'package:test_form_tuqaatech/features/auth/domin/entites/register_entity.dart';
import 'package:test_form_tuqaatech/features/auth/domin/entites/true_register.dart';
import '../../../../core/error/error_type.dart';
import '../../data/model/all_country_model.dart';
import '../../data/model/data_user_fire_model.dart';

abstract class RegisterRepository {
  Future<Either<ErrorType, TrueRegister>> register(RegisterEntity register1);
  Future<Either<ErrorType, TokenModel>> auth(LoginEntity loginEntity);
   Future<Either<ErrorType, AllCountryModel>> allcountry();
    Future<Either<ErrorType, DataUserFireBaceModel>> datauserFire(String? firebasetoken,);
  
}
