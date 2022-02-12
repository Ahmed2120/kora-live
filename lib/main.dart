import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yalla_shot/drawer.dart';
import 'package:yalla_shot/fixture.dart';
import 'package:yalla_shot/providers/matches.dart';

import 'loading_screen.dart';
import 'matches_screen.dart';

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
        primarySwatch: Colors.blue,
      ),
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
          title: const Text('يلا شوت '),
        ),
        body: FutureBuilder(
          future: SoccerApi().getFixtures(),
          builder: (ctx, snapshot) {
            print('${snapshot.data}');
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: LoadingScreen(),
              );
            } else {
              List<SoccerMatch> matches = snapshot.data as List<SoccerMatch>;
              return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: MatchesScreen(matches));
            }
          },
        ),
        drawer: MyDrawer());
  }
}
