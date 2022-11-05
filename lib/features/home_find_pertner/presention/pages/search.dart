import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form_tuqaatech/core/widget/magic.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/bloc/partner/bloc/city_partner_bloc.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/widgets/app_bar.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/widgets/search_result/card_partner_widget.dart';

import '../../../../core/widget/load.dart';
import '../../../../core/widget/magicdirection.dart';
import '../widgets/search/end_widget_insearch.dart';
import '../widgets/search/second_widget_insearch.dart';
import '../widgets/search/start_widget_insearch.dart';

class Search extends StatelessWidget {
  Search({
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
                Navigator.pushNamed(context, 'page2');
              } else if (state is ErrorNetCityPartner) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('عذراً يوجد خطأ ')));
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
                        controllerandage: controllerandage)
                    ;
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
        FirstWidgetInSearch(
            controllercountry: controllercountry,
            controllercity: controllercity,
            controllergender: controllergender),
        SecondWidgetInSearch(
            controllerbettwenage: controllerbettwenage,
            controllerandage: controllerandage),
        EndWidgetInSearch(controllercity: controllercity,controllercontry: controllercountry,controllermaxage: controllerandage,controllerminage: controllerbettwenage,controllergender: controllergender),
      ],
    );
  }
}
