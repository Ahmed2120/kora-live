import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yalla_shot/widget/drawer.dart';
import 'package:yalla_shot/widget/fixture.dart';
import 'package:yalla_shot/providers/matches.dart';

import 'screens/loading_screen.dart';
import 'screens/match_detail.dart';
import 'screens/matches_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF456789),
          ),
          fontFamily: 'Montserrat'),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _dateTime = DateTime.now();
  var day = const Duration(days: 1);
  bool _isLoading = false;

  String getDayName() {
    var nameDay = DateFormat('EEEE').format(_dateTime);
    String name = '';
    switch (nameDay) {
      case "Saturday":
        name = "السبت";
        break;
      case "Sunday":
        name = "الاحد";
        break;
      case "Monday":
        name = "الاثنين";
        break;
      case "Tuesday":
        name = "الثلاثاء";
        break;
      case "Wednesday":
        name = "الاربعاء";
        break;
      case "Thursday":
        name = "الخميس";
        break;
      case "Friday":
        name = "الجمعة";
    }
    return name;
  }

  @override
  Widget build(BuildContext context) {
    var nameDay = DateFormat('EEEE').format(_dateTime);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          // leading: IconButton(
          //   icon: Icon(Icons.search),
          //   onPressed: () {},
          // ),
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.menu),
          //     onPressed: () {},
          //   )
          // ],
          title: const Text('KORA LIVE'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: SoccerApi().getFixtures(),
          builder: (ctx, snapshot) {
            print('${snapshot.data}');
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: LoadingScreen(),
              );
            } else if(snapshot.hasError){
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
            else {
              List<SoccerMatch> matches = snapshot.data as List<SoccerMatch>;
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: RefreshIndicator(
                  child: MatchesScreen(matches),
                  onRefresh: () async {
                    matches =
                        await SoccerApi().getFixtures() as List<SoccerMatch>;
                    setState(() {});
                  },
                ),
              );
            }
          },
        ),
        drawer: MyDrawer());
  }
}
