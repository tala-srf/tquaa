// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/widgets/search_result/card_partner_widget.dart';

import '../widgets/app_bar.dart';
import '../../../chat/presention/pages/chat.dart';
import 'home1.dart';
import 'search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> destinations2 = [
      NavigationDestination(
        icon: Icon(
          Icons.home,
          color:
              (currentPageIndex == 0) ? const Color(0xffff6f00) : Colors.black,
        ),
        label: 'Home',
      ),
      NavigationDestination(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: (currentPageIndex == 1)
                ? const Color(0xffff6f00)
                : Colors.black,
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
        label: '',
      ),
      NavigationDestination(
        icon: Icon(
          Icons.message,
          color:
              (currentPageIndex == 2) ? const Color(0xffff6f00) : Colors.black,
        ),
        label: 'Message',
      ),
    ];
    return Scaffold(
   
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
   
          });
        },
        selectedIndex: 1,
        destinations: destinations2,
      ),
      body: <Widget>[Home1(), Navigator(
        onGenerateRoute: (settings) {
          Widget page = Search();
          if (settings.name == 'page2') page = CardCityPartner();
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
     Chat(),][currentPageIndex],
    );
  }


}
