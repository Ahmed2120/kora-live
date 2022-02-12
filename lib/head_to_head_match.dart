import 'package:flutter/material.dart';
import 'package:yalla_shot/fixture.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HeadToHeadMatch extends StatelessWidget {
  final SoccerMatch match;

  const HeadToHeadMatch(this.match, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final elpased = match.fixture.status.elapsedTime ?? 'finish';
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.grey[200]),
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
              Container(
                child: Text(match.home.name!, style: const TextStyle(fontSize: 15),),
                width: 80,
              ),
            ],
          ),
          Text('${match.goal.home}', style: const TextStyle(fontSize: 17),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CircularPercentIndicator(
                    radius: 40,
                    lineWidth: 2,
                    percent: match.fixture.status.elapsedTime! > 90
                        ? 1
                        : double.parse('${match.fixture.status.elapsedTime}') /
                            90,
                    center: Text('$elpased'),
                  ),
                ],
              ),
            ],
          ),
          Text('${match.goal.away}', style: const TextStyle(fontSize: 17),),
          Row(
            children: [
              Container(
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
    );
  }
}
