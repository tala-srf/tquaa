import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:test_form_tuqaatech/features/chat/domin/usecases/image_usecase.dart';

import '../../../../../../core/error/error_type.dart';
import '../../../../../../core/string/error_string.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageUsecase imageUsecase;
  ImageBloc(this.imageUsecase) : super(ImageInitial()) {
    on<UrlImageEvent>((event, emit) async {
      emit(LoadingImage());
         final succ = await imageUsecase( event.id);
      emit( _eitherDoneMessageOrErrorState(succ, ));
    });
  }
   ImageState _eitherDoneMessageOrErrorState(
      Either<ErrorType, String> either,
      ) {
    return either.fold(
        (failure) => ErrorNetImage(
              _mapFailureToMessage(failure),
            ), (image) {
    
      return SuccessedImage(image);
    });
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
