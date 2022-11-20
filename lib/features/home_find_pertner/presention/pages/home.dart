import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form_tuqaatech/features/chat/presention/pages/page_chat.dart';
import '../../../auth/presentation/bloc/bloc_data_user_fire/bloc/data_user_fire_bloc.dart';
import '../../../chat/presention/pages/list_all_chats.dart';
import 'home_start_page.dart';
import 'search_city_partner.dart';
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
         print("...........................");
      print(message.notification!.body);
         print("...........................");
         
    });
  }

  @override
  void initState() {
    fbm.getToken().then((token) {
      print("...........................");
      print(token);
       print("...........................");
          BlocProvider.of<DataUserFireBloc>(context).add(Fireevent(firebase: token));
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
        HomeWelcome(),
        SearchPartner(),
        Navigator(
          onGenerateRoute: (settings) {
            Widget page1 = ListAllChatsUser();
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
