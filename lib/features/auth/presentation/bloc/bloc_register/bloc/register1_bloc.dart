import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/error/error_type.dart';
import '../../../../../../core/string/error_string.dart';
import '../../../../domin/entites/register_entity.dart';
import '../../../../domin/entites/true_register.dart';
import '../../../../domin/usecases/register_usecase.dart';

part 'register1_event.dart';
part 'register1_state.dart';
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase registerUsecase;
  RegisterBloc(this.registerUsecase) : super(RegisterInitial()) {
    on<EventRegister>((event, emit) async {
      emit(Loading());
      final succ = await registerUsecase(event.event1);
     emit(  _eitherDoneMessageOrErrorState(
              succ, ),);
    });
  }
  RegisterState _eitherDoneMessageOrErrorState(
      Either<ErrorType, TrueRegister> either, ) {
    return either.fold(
      (failure) => ErrorNet(
        error:_mapFailureToMessage(failure),
      ),
      (_) => SuccessedRegister(true1: TrueRegister(true)),
    );
  }

   String _mapFailureToMessage(ErrorType failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineError:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
