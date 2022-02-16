import 'package:flutter/material.dart';
import 'package:yalla_shot/widget/fixture.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../screens/match_detail.dart';

class HeadToHeadMatch extends StatelessWidget {
  final SoccerMatch match;

  const HeadToHeadMatch(this.match, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final elpased = match.fixture.status.elapsedTime ?? 'finish';
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MatchDetail(match))),
        splashColor: Colors.blue,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.grey[200]!.withOpacity(0.8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.network(
                    match.home.logoUrl!,
                    width: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    child: Text(match.home.name!, style: const TextStyle(fontSize: 15),),
                    width: 80,
                  ),
                ],
              ),
              Text('${match.goal.home}', style: const TextStyle(fontSize: 17),),
              CircularPercentIndicator(
                radius: 40,
                lineWidth: 2,
                percent: match.fixture.status.elapsedTime! > 90
                    ? 1
                    : double.parse('${match.fixture.status.elapsedTime}') /
                        90,
                center: Text('$elpased'),
              ),
              Text('${match.goal.away}', style: const TextStyle(fontSize: 17),),
              Row(
                children: [
                  SizedBox(
                    child: Text(match.away.name!, style: const TextStyle(fontSize: 15),),
                    width: 80,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.network(
                    match.away.logoUrl!,
                    width: 25,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
