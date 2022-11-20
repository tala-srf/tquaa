import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_form_tuqaatech/features/auth/data/model/token_model.dart';
import 'package:test_form_tuqaatech/features/auth/domin/entites/login_entity.dart';
import 'package:test_form_tuqaatech/features/auth/domin/usecases/login_usecase.dart';

import '../../../../../../core/error/error_type.dart';
import '../../../../../../core/shared/shared_pref.dart';
import '../../../../../../core/string/error_string.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginusecase;

  LoginBloc(
   {required this.loginusecase}
  ) : super(LoginInitial()) {
    on<Loginevent>((event, emit) async {
      emit(LoadingLogin());
      final succ = await loginusecase(loginEntity: event.entity);

      emit(
        _eitherDoneMessageOrErrorState(
          succ,
        ),
      );
    });
    on<SignOutEvent>((event, emit) async {
      emit(ProcessingLogOutState());
      emit(LogOutState());
      emit(LoginInitial());
    });
  }
  LoginState _eitherDoneMessageOrErrorState(
    Either<ErrorType, TokenModel> either,
  ) {
    return either.fold(
        (failure) => ErrorNetLogin(
              _mapFailureToMessage(failure),
            ), (tokenEntity) {
      AppSharedPreferences.cacheAuthUserInfo(
        accToken: tokenEntity.result!.accessToken!,
        userId: tokenEntity.result!.userId!,
      );

      return SuccessedLogin(tokenEntity);
    });
  }

  String _mapFailureToMessage(ErrorType failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppErrorMessage.SERVER_FAILURE_MESSAGE;
      case OfflineError:
        return AppErrorMessage.OFFLINE_FAILURE_MESSAGE;
      default:
        return AppErrorMessage.errorExaption;
    }
  }
}
