import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yalla_shot/widget/drawer.dart';
import 'package:yalla_shot/widget/fixture.dart';

import '../widget/head_to_head_match.dart';
import 'match_detail.dart';

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
    final size = MediaQuery.of(context).size;
    final List<SoccerMatch> matches = widget.matches;
    List<String> leagues = [];
    for (var element in matches) {
      leagues.add(element.league.name!);
    }
    leagues = [
      ...{...leagues}
    ];
    for (var i in leagues) {
      print('${i}');
    }

    var nameDay = DateFormat('EEEE').format(_dateTime);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          color: Colors.grey[300],
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
                      icon: const Icon(
                        Icons.arrow_left,
                        size: 40,
                        color: Color(0xFF456789),
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _dateTime = _dateTime.subtract(day);
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_right,
                        size: 40,
                        color: Color(0xFF456789),
                      )),
                ],
              ),
              Text('مباريات ${getDayName()}'),
              Row(
                children: [
                  Text('${_dateTime.year}/${_dateTime.month}/${_dateTime.day}'),
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
                      icon: const Icon(Icons.date_range, color: Color(0xFF456789),)),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          height: size.height - 150,
          child: ListView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: leagues.length,
            padding: const EdgeInsets.all(0),
            itemBuilder: (BuildContext context, int index) {
              final matchesByLeague = matches
                  .where((element) => element.league.name == leagues[index])
                  .toList();
              return Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color(0xFF577495),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        matchesByLeague[0].league.logoUrl == null
                            ? Image.asset('assets/logo.png')
                            : Image.network(
                                matchesByLeague[0].league.logoUrl!,
                                width: 25,
                              ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          leagues[index],
                          style: const TextStyle(fontSize: 15, color: Colors.white),
                        ),
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
        ),
      ],
    );
  }
}
