import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yalla_shot/drawer.dart';
import 'package:yalla_shot/fixture.dart';
import 'package:yalla_shot/providers/matches.dart';

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
          future: SoccerApi().getFixtures(),
          builder: (ctx, snapshot) {
            List<SoccerMatch> matches = snapshot.data as List<SoccerMatch>;
            print('${snapshot.data}');
            return snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : MatchesScreen(matches);
          },
        ),
        // child: Column(
        //   children: [
        //     Container(
        //       padding: EdgeInsets.all(12),
        //       width: double.infinity,
        //       color: Colors.green,
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Row(
        //             children: [
        //               IconButton(
        //                   onPressed: () {
        //                     setState(() {
        //                       _dateTime = _dateTime.add(day);
        //
        //                     });
        //                   }, icon: Icon(Icons.arrow_left, size: 40,)),
        //               IconButton(
        //                   onPressed: () {
        //                     setState(() {
        //                       _dateTime = _dateTime.subtract(day);
        //                     });
        //                   }, icon: Icon(Icons.arrow_right, size: 40,)),
        //             ],
        //           ),
        //           Text('مباريات ${getDayName()}'),
        //           Row(
        //             children: [
        //               Text('${_dateTime.year}/${_dateTime.month}/${_dateTime
        //                   .day}'),
        //               IconButton(
        //                   onPressed: () {
        //                     showDatePicker(
        //                         context: context,
        //                         initialDate: _dateTime,
        //                         firstDate: DateTime(DateTime
        //                             .now()
        //                             .year - 5),
        //                         lastDate: DateTime(DateTime
        //                             .now()
        //                             .year + 5))
        //                         .then((date) {
        //                       setState(() {
        //                         _dateTime = date!;
        //                       });
        //                     });
        //                   },
        //                   icon: Icon(Icons.date_range)),
        //             ],
        //           )
        //         ],
        //       ),
        //     ),
        //     ListView.builder(
        //       physics: const NeverScrollableScrollPhysics(),
        //       shrinkWrap: true,
        //       itemCount: 4,
        //       padding: const EdgeInsets.all(15),
        //       itemBuilder: (BuildContext context, int index) {
        //         return Column(
        //           children: [
        //             Container(
        //               alignment: Alignment.center,
        //               width: double.infinity,
        //               padding: const EdgeInsets.all(8),
        //               decoration: BoxDecoration(color: Colors.grey),
        //               child: Text('الدوري الانجليزي'),
        //             ),
        //             ListView.builder(
        //                 physics: const NeverScrollableScrollPhysics(),
        //                 shrinkWrap: true,
        //                 itemCount: 3,
        //                 itemBuilder: (BuildContext context, int index) {
        //                   return Container(
        //                     width: double.infinity,
        //                     margin: EdgeInsets.only(bottom: 8),
        //                     padding: EdgeInsets.all(8),
        //                     decoration: BoxDecoration(color: Colors.grey[200]),
        //                     child: Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         Text('الاهلي'),
        //                         Text('VS'),
        //                         Text('الزمالك'),
        //                       ],
        //                     ),
        //                   );
        //                 }),
        //           ],
        //         );
        //       },
        //     ),
        //   ],
        // ),
      ),
      drawer: MyDrawer()
    );
  }
}

