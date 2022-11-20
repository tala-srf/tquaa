import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/domin/usecases/city_partner_usecases.dart';
import '../../../../../../core/error/error_type.dart';
import '../../../../../../core/string/error_string.dart';
import '../../../../data/model/citypartner_model.dart';
part 'city_partner_event.dart';
part 'city_partner_state.dart';

class CityPartnerBloc extends Bloc<CityPartnerEvent, CityPartnerState> {
  final CityPartnerUsecase cityPartnerUsecase;
  CityPartnerBloc({required this.cityPartnerUsecase})
      : super(CityPartnerInitial()) {
    on<PartnerEvent>((event, emit) async {
      emit(LoadingCityPartner());

      final succ = await cityPartnerUsecase(event.cityid, event.countryId,
          event.gender, event.minAge, event.maxage, event.date);

      emit(
        _eitherDoneMessageOrErrorState(
          succ,
        ),
      );
    });
  }
  CityPartnerState _eitherDoneMessageOrErrorState(
    Either<ErrorType, CityPartnerModel> either,
  ) {
    return either.fold(
        (failure) => ErrorNetCityPartner(
              _mapFailureToMessage(failure),
            ),
        (partner) => SuccessedCityPartner(partner));
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
