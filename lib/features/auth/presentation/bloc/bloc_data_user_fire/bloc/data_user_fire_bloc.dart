import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:test_form_tuqaatech/core/string/const.dart';

import '../../../../../../core/error/error_type.dart';
import '../../../../../../core/string/error_string.dart';
import '../../../../data/model/data_user_fire_model.dart';
import '../../../../domin/usecases/data_user_fire_usecases.dart';

part 'data_user_fire_event.dart';
part 'data_user_fire_state.dart';

class DataUserFireBloc extends Bloc<DataUserFireEvent, DataUserFireState> {
  final DataUserFireUsecase dataUserFireUsecase;
  DataUserFireBloc({required this.dataUserFireUsecase}) : super(DataUserFireInitial()) {
    on<Fireevent>((event, emit) async {
      emit(ProcessingfireState());

      final succ = await dataUserFireUsecase(event.firebase);

      emit(
        _eitherDataUser(
          succ,
        ),
      );
    });
  }
  DataUserFireState _eitherDataUser(
    Either<ErrorType, DataUserFireBaceModel> either,
  ) {
    return either.fold(
        (failure) => ErrorNetfire(
              _mapFailureToMessage(failure),
            ), (dataUserFireBaceModel) {
      userid = dataUserFireBaceModel.result!.id;
      return Successedfire(dataUserFireBaceModel);
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
