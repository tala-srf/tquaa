import 'package:test_form_tuqaatech/core/network/internet_checker.dart';
import 'package:test_form_tuqaatech/features/auth/data/datasources/all_country_datasource.dart';
import 'package:test_form_tuqaatech/features/auth/data/datasources/auth_datasources.dart';
import 'package:test_form_tuqaatech/features/auth/data/datasources/data_user_fire_datasources.dart';
import 'package:test_form_tuqaatech/features/auth/data/datasources/registerandauth_data_sources.dart';
import 'package:test_form_tuqaatech/features/auth/data/model/all_country_model.dart';
import 'package:test_form_tuqaatech/features/auth/data/model/data_user_fire_model.dart';
import 'package:test_form_tuqaatech/features/auth/data/model/login_model.dart';
import 'package:test_form_tuqaatech/features/auth/data/model/regidter.dart';
import 'package:test_form_tuqaatech/features/auth/data/model/token_model.dart';
import 'package:test_form_tuqaatech/features/auth/domin/entites/login_entity.dart';
import 'package:test_form_tuqaatech/features/auth/domin/entites/register_entity.dart';
import 'package:test_form_tuqaatech/core/error/error_type.dart';
import 'package:dartz/dartz.dart';

import 'package:test_form_tuqaatech/features/auth/domin/entites/true_register.dart';
import 'package:test_form_tuqaatech/features/auth/domin/repository/register_repository.dart';

class RegisterRepositeryImp implements RegisterRepository {
  final InternetChecker internet;
  final RegisterDataSources registerDataSources;
  final AuthDataSources authDataSources;
  final AllCountryDataSources allCountryDataSources;
  final DataUserFireDataSources dataUserFireDataSources;
  RegisterRepositeryImp(
      {required this.internet,
      required this.registerDataSources,
    required  this.authDataSources,
     required this.allCountryDataSources,
      required this.dataUserFireDataSources});

  @override
  Future<Either<ErrorType, TrueRegister>> register(
      RegisterEntity register1) async {
    final RegisterModel registerModel = RegisterModel(
      age: register1.age,
      avatar: register1.avatar,
      cityId: register1.cityId,
      countryId: register1.countryId,
      emailAddress: register1.emailAddress,
      gender: register1.gender,
      name: register1.name,
      password: register1.password,
      phoneNumber: register1.phoneNumber,
    );

    if (await internet.isConnected) {
      try {
        await registerDataSources.register(registerModel);
        return Right(TrueRegister(true));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineError());
    }
  }

  @override
  Future<Either<ErrorType, TokenModel>> auth(LoginEntity loginEntity) async {
    final LoginModel loginModel = LoginModel(
      password: loginEntity.password,
      rememberClient: loginEntity.rememberClient,
      userNameOrEmailAddress: loginEntity.userNameOrEmailAddress,
    );

    if (await internet.isConnected) {
      try {
        TokenModel token = await authDataSources.auth(loginModel);
        return Right(token);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineError());
    }
  }

  @override
  Future<Either<ErrorType, AllCountryModel>> allcountry() async {
    if (await internet.isConnected) {
      try {
        AllCountryModel allCountryModel =
            await allCountryDataSources.allCountry();
        return Right(allCountryModel);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineError());
    }
  }

  @override
  Future<Either<ErrorType, DataUserFireBaceModel>> datauserFire(
      String? firebasetoken) async {
    if (await internet.isConnected) {
      try {
        final data = await dataUserFireDataSources.dataUserFire(firebasetoken);
        return Right(data);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineError());
    }
  }
}
