import 'package:flutter/material.dart';
import 'package:yalla_shot/fixture.dart';

class HeadToHeadMatch extends StatelessWidget {
  final SoccerMatch match;
  const HeadToHeadMatch(this.match, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Image.network(match.home.logoUrl!, width: 20,),
              const SizedBox(width: 10,),
              Container(child: Text(match.home.name!), width: 80,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${match.goal.home}'),
              Column(
                children: [
                  Text('VS'),
                  Text('${match.fixture.status.elapsedTime}'),
                ],
              ),
              Text('${match.goal.away}'),
            ],
          ),
          Row(
            children: [
              Container(child: Text(match.away.name!), width: 80,),
              const SizedBox(width: 10,),
              Image.network(match.away.logoUrl!, width: 20,),
            ],
          ),
        ],
      ),
    );
  }
}
