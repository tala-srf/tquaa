import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form_tuqaatech/features/chat/presention/pages/page_chat.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/widgets/app_bar.dart';

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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 31.0),
      child: Scaffold(
        appBar: appBar("Suggestions partner"),
        body: BlocBuilder<CityPartnerBloc, CityPartnerState>(
          builder: (context, state) {
            if (state is SuccessedCityPartner) {
              return ListView.builder(
                  itemCount: state.partner.result!.items!.length,
                  itemBuilder: (cont, index) {
                    String age = "${state.partner.result!.items![index].age}";
                    String partnername =
                        "${state.partner.result!.items![index].userName}";
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
                                  onPressed: () {
                                   // need blocProvider  (BlocProvider.of<GetDialogByChatIdBloc>(context).add(ChatByidEvnet(usermessage));)




                                    Scaffold.of(cont)
                                        .showBottomSheet((context) {
                                      return PageChat(
                                        id: "",
                                        idsender: state.partner.result!
                                            .items![index].prtnerId,
                                        iduser: 72,
                                        nameuser: state.partner.result!
                                            .items![index].userName
                                            .toString(),
                                      );
                                    });
                                  },
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
      ),
    );
  }
}
