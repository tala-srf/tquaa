import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form_tuqaatech/core/widget/magic.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/bloc/partner/bloc/city_partner_bloc.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/widgets/app_bar.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/widgets/search_result/card_partner_widget.dart';
import '../../../../core/widget/loading_widget.dart';
import '../../../../core/widget/magicdirection.dart';
import '../widgets/search/button_widget_insearch.dart';
import '../widgets/search/select_age_widget_insearch.dart';
import '../widgets/search/select_city_counry_gender_widget_insearch.dart';

class SearchPartner extends StatelessWidget {
  SearchPartner({
    Key? key,
  }) : super(key: key);
  TextEditingController controllergender = TextEditingController();
  TextEditingController controllercountry = TextEditingController();
  TextEditingController controllercity = TextEditingController();
  TextEditingController controllerbettwenage = TextEditingController();
  TextEditingController controllerandage = TextEditingController();
  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext conte) {
       
    return Scaffold(
      appBar: appBar("Find a partner"),
      body: Padding(
          padding: const EdgeInsets.all(28.0),
          child: BlocConsumer<CityPartnerBloc, CityPartnerState>(
            listener: (context, state) {
              if (state is SuccessedCityPartner) {
                Scaffold.of(conte).showBottomSheet((context) {
                  return CardCityPartner();
                });
              } else if (state is ErrorNetCityPartner) {
                      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                    content: Text(state.error!)));
              }
            },
            builder: (cont, state) {
              if (state is LoadingCityPartner) {
                return const LoadingWidget();
              } else {
         
                return SearchWidget(
                    controllercountry: controllercountry,
                    controllercity: controllercity,
                    controllergender: controllergender,
                    controllerbettwenage: controllerbettwenage,
                    controllerandage: controllerandage);
              }
            },
          )),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.controllercountry,
    required this.controllercity,
    required this.controllergender,
    required this.controllerbettwenage,
    required this.controllerandage,
  });

  final TextEditingController controllercountry;
  final TextEditingController controllercity;
  final TextEditingController controllergender;
  final TextEditingController controllerbettwenage;
  final TextEditingController controllerandage;

  @override
  Widget build(BuildContext context) {
    return MagicWidget(
      MediaQuery.of(context).size.height / MediaQuery.of(context).size.width > 1
          ? MagicDirection.vertical
          : MagicDirection.horizental,
      [
        Expanded(
          flex: 4,
          child: SelectCityCountryAndGenderWidgetInSearch(
              controllercountry: controllercountry,
              controllercity: controllercity,
              controllergender: controllergender),
        ),
        Expanded(
          flex: 3,
          child: SelectAgeWidgetInSearch(
              controllerbettwenage: controllerbettwenage,
              controllerandage: controllerandage),
        ),
        Expanded(
          flex: 3,
          child: BottonWidgetInSearch(
              controllercity: controllercity,
              controllercontry: controllercountry,
              controllermaxage: controllerandage,
              controllerminage: controllerbettwenage,
              controllergender: controllergender),
        ),
      ],
    );
  }
}
