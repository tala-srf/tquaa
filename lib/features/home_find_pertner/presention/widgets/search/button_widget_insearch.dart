import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/elevated_button.dart';
import '../../bloc/partner/bloc/city_partner_bloc.dart';

class EndWidgetInSearch extends StatefulWidget {
  EndWidgetInSearch(
      {super.key,
      required this.controllercity,
      required this.controllercontry,
      required this.controllermaxage,
      required this.controllerminage,
      required this.controllergender});

  final TextEditingController controllercity;
  final TextEditingController controllercontry;
  final TextEditingController controllerminage;
  final TextEditingController controllermaxage;
  final TextEditingController controllergender;

  @override
  State<EndWidgetInSearch> createState() => _EndWidgetInSearchState();
}

class _EndWidgetInSearchState extends State<EndWidgetInSearch> {
  String title = 'Date: /  /';
  String date1 = "";
  Color color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  minimumSize: const MaterialStatePropertyAll(Size(0, 60)),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.black, width: 2)),
                ),
                onPressed: () async {
                  final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990, 1),
                      lastDate: DateTime(2023, 1));

                  setState(() {
                    date != null
                        ? title =
                            '${date.year.toString()}-${date.month.toString()}-${date.day.toString()}'
                        : title;
                    color = Colors.black;
                    date1 =
                        '${date!.year.toString()}-${date.month.toString()}-${date.day.toString()}';
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 20, color: color),
                    ),
                    const Icon(
                      Icons.date_range,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          ),
          ButtonWidget(
              newVariable: "",
              name: "Search",
              onPressed: () {
                int? contry1 = widget.controllercontry.text != ""
                    ? int.parse(widget.controllercontry.text)
                    : 0;
                int? citt1 = (widget.controllercity.text) != ""
                    ? int.parse(widget.controllercity.text)
                    : 0;
                int? mainage = widget.controllerminage.text != ""
                    ? int.parse(widget.controllerminage.text)
                    : 0;
                int? maxage = (widget.controllermaxage.text) != ""
                    ? int.parse(widget.controllermaxage.text)
                    : 0;
                int? gender = (widget.controllergender.text) != ""
                    ? int.parse(widget.controllergender.text)
                    : 0;
                BlocProvider.of<CityPartnerBloc>(context).add(PartnerEvent(
                    cityid: citt1,
                    countryId: contry1,
                    date: date1,
                    gender: gender,
                    maxage: maxage,
                    minAge: mainage));
              }),
          const Spacer()
        ],
      ),
    );
  }
}
