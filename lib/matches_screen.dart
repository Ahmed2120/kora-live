import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yalla_shot/drawer.dart';
import 'package:yalla_shot/fixture.dart';

import 'head_to_head_match.dart';

class MatchesScreen extends StatefulWidget {
  final List<SoccerMatch> matches;

  const MatchesScreen(this.matches, {Key? key}) : super(key: key);

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
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
    final List<SoccerMatch> matches = widget.matches;
    List<String> leagues = [];
    for (var element in matches) {
      leagues.add(element.league.name!);
    }
    leagues = [...{...leagues}];
    print('${leagues.length}');
    for(var i in leagues){
      print('${i}');
    }

    var nameDay = DateFormat('EEEE').format(_dateTime);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            width: double.infinity,
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _dateTime = _dateTime.add(day);
                          });
                        },
                        icon: Icon(
                          Icons.arrow_left,
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _dateTime = _dateTime.subtract(day);
                          });
                        },
                        icon: Icon(
                          Icons.arrow_right,
                          size: 40,
                        )),
                  ],
                ),
                Text('مباريات ${getDayName()}'),
                Row(
                  children: [
                    Text(
                        '${_dateTime.year}/${_dateTime.month}/${_dateTime.day}'),
                    IconButton(
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: _dateTime,
                                  firstDate: DateTime(DateTime.now().year - 5),
                                  lastDate: DateTime(DateTime.now().year + 5))
                              .then((date) {
                            setState(() {
                              _dateTime = date!;
                            });
                          });
                        },
                        icon: Icon(Icons.date_range)),
                  ],
                )
              ],
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: leagues.length,
            padding: const EdgeInsets.all(15),
            itemBuilder: (BuildContext context, int index) {
              final matchesByLeague = matches
                  .where((element) =>
                      element.league.name == leagues[index])
                  .toList();
              return Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(matchesByLeague[0].league.logoUrl!, width: 20,),
                        const SizedBox(width: 10,),
                        Text(leagues[index]),
                      ],
                    ),
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: matchesByLeague.length,
                      itemBuilder: (BuildContext context, int index) {
                        return HeadToHeadMatch(matchesByLeague[index]);
                      }),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
