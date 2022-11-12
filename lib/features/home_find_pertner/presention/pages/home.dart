import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form_tuqaatech/features/chat/presention/pages/page_chat.dart';
import 'package:test_form_tuqaatech/features/home_find_pertner/presention/widgets/search_result/card_partner_widget.dart';
import '../../../chat/presention/bloc/bloc_dialog_chat/bloc/get_dialog_by_chat_id_bloc.dart';
import '../../../chat/presention/pages/chat.dart';
import 'home1.dart';
import 'search.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;
  var fbm = FirebaseMessaging.instance;

  getMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification!.body);
    });
  }

  @override
  void initState() {
    fbm.getToken().then((token) {
      print(token);
    });
    getMessage();
    super.initState();
  }

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
        backgroundColor: Colors.white24,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: 1,
        destinations: destinations2,
      ),
      body: <Widget>[
        Home1(),
        Search(),
        Navigator(
          onGenerateRoute: (settings) {
            Widget page1 = Chat();
            if (settings.name == '/c') {
              page1 = PageChat();
            }
            return MaterialPageRoute(builder: (_) => page1);
          },
        ),
      ][currentPageIndex],
    );
  }
}
