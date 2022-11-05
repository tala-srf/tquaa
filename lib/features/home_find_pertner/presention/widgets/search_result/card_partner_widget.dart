import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/elevated_button.dart';
import '../../bloc/partner/bloc/city_partner_bloc.dart';
import 'data_partner_in_card.dart';
import 'image_partner_widget.dart';

// ignore: must_be_immutable
class CardCityPartner extends StatelessWidget {
  CardCityPartner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext cont) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 100,
        title: const Center(
            child: Text(
          "Suggestions partner",
          style: const TextStyle(color: Colors.white),
        )),
        backgroundColor: const Color(0xffff6f00),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(80),
              bottomRight: Radius.circular(80)),
        ),
      ),
      body: BlocBuilder<CityPartnerBloc, CityPartnerState>(
        builder: (context, state) {
          if (state is SuccessedCityPartner) {
            return ListView.builder(
                itemCount: state.partner.result!.items!.length,
                itemBuilder: (cont, index) {
                  String age = "${state.partner.result!.items![index].age}";
                  String partnername = "${state.partner.result!.items![index].userName }";
                  return Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 30),
                      child: Container(
                        alignment: Alignment.center,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Card(
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    25), // if you need this
                                side: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ImagePartnerWidget(),
                                  DataPartnerInCard(
                                    age: age,
                                    partnername: partnername,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: -30,
                              child: ButtonWidget(
                                newVariable: "40",
                                name: "send a message",
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ));
                });
          } else {
            return Text("ERROR");
          }
        },
      ),
    );
  }
}
