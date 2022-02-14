import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:yalla_shot/fixture.dart';

class MatchDetail extends StatelessWidget {

  final SoccerMatch match;
  const MatchDetail(this.match, {Key? key}) : super(key: key);

  // final SoccerMatch match;
  //
  // const MatchDetail({Key? key, required this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime _date = DateTime.parse(match.fixture.date!);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 300,
            collapsedHeight: 100,
            //toolbarHeight: 200,
            pinned: true,
            elevation: 0,
            //titleSpacing: 20,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/stadium.jpg', fit: BoxFit.cover, color: Colors.blueGrey.withOpacity(0.8), colorBlendMode: BlendMode.modulate,),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.network(match.home.logoUrl!, width: 50,),
                      SizedBox(
                        child: Text(match.home.name!, style: const TextStyle(fontSize: 15),textAlign: TextAlign.center,),
                        width: 100,
                      ),
                    ],
                  ),
                  Text('${match.goal.home}'),
                  CircularPercentIndicator(
                    radius: 30,
                    lineWidth: 2,
                    percent: match.fixture.status.elapsedTime! > 90
                        ? 1
                        : double.parse('${match.fixture.status.elapsedTime}') /
                        90,
                    center: Text('${match.fixture.status.elapsedTime}', style: TextStyle(color: Colors.white),),
                  ),
                  Text('${match.goal.away}'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.network(match.away.logoUrl!, width: 50,),
                      SizedBox(
                        child: Text(match.away.name!, style: const TextStyle(fontSize: 15),textAlign: TextAlign.center,),
                        width: 100,
                      ),
                    ],
                  ),
                ],
              ),
              centerTitle: true,
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              Container(
                margin: const EdgeInsets.only(top: 18, left: 12, right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height:1.5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Colors.grey,
                              Colors.grey[200]!
                        ])
                      ),
                    ),
                    Text('Match Information'),
                    Container(
                      width: 100,
                      height: 1.5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.grey[200]!,
                          Colors.grey,
                        ])
                      ),
                    ),
                  ],
                ),
              ),
              DetailItem(title: 'League', titleData: match.league.name!, icon: Icon(Icons.height), function: (){},),
              DetailItem(title: 'Round', titleData: match.league.round!, icon: Icon(Icons.height), function: (){},),
              DetailItem(title: 'Stadium', titleData: match.fixture.venue.name!, icon: Icon(Icons.height), function: (){},),
              DetailItem(title: 'Date', titleData: '${_date.day} - ${_date.month} - ${_date.year}', icon: Icon(Icons.height), function: (){},),
            ]
          ))
        ],
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  final String title;
  final String titleData;
  final Icon icon;
  final Function function;

  const DetailItem({
    Key? key, required this.title, required this.titleData, required this.icon, required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.white,
      elevation: 2,
      child: Container(
        height: 80,
        alignment: Alignment.center,
        child: ListTile(
          onTap: function(),
          title: Row(
            children: [
              Text(title),
              Expanded(child: Text(titleData, textAlign: TextAlign.center,)),
            ],
          ),
          leading: icon
        ),
      ),
    );
  }
}
