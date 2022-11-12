import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_form_tuqaatech/features/auth/domin/usecases/allcounty_usecase.dart';

import '../../../../../../core/error/error_type.dart';
import '../../../../../../core/string/const.dart';
import '../../../../data/model/all_country_model.dart';

part 'allcountry_event.dart';
part 'allcountry_state.dart';

class AllcountryBloc extends Bloc<AllcountryEvent, AllcountryState> {
  final AllCountryUsecase allCountryUsecase;
  AllcountryBloc(this.allCountryUsecase) : super(AllcountryInitial()) {
    on<CountryEvent>((event, emit) async {
      emit(LoadingAllcountry());
      final succ = await allCountryUsecase();
      emit(
        _eitherDoneMessageOrErrorState(
          succ,
        ),
      );
    });
  }
  AllcountryState _eitherDoneMessageOrErrorState(
    Either<ErrorType, AllCountryModel> either,
  ) {
    return either.fold(
      (failure) => ErrorNetAllcountry(
        error: "Error NetWork",
      ),
      (allCountryModel) {
        for (int i = 0; i < allCountryModel.result!.length; i++) {
          Map<String, dynamic> country = {
            'label': '${allCountryModel.result![i].name}',
            'value': '${allCountryModel.result![i].id}',
          };
          allcountry.add(country);

          for (int c = 0; c < allCountryModel.result![i].cities!.length; c++) {
            Map<String, dynamic> city = {
              'label': '${allCountryModel.result![i].cities![c].name}',
              'value': '${allCountryModel.result![i].cities![c].id}',
              'key': '${allCountryModel.result![i].cities![c].countryId}'
            };
            allcity.add(city);
          }
        }

        return SuccessedAllcountry(allCountryModel: allCountryModel);
      },
    );
  }
}
