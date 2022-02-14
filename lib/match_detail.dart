import 'package:flutter/material.dart';
import 'package:yalla_shot/fixture.dart';

class MatchDetail extends StatelessWidget {
  const MatchDetail({Key? key}) : super(key: key);

  // final SoccerMatch match;
  //
  // const MatchDetail({Key? key, required this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            collapsedHeight: 100,
            //toolbarHeight: 200,
            pinned: true,
            elevation: 0,
            //titleSpacing: 20,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/logo.png', width: 50,),
                      Text('الاهلي')
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/logo.png', width: 50,),
                      Text('الزمالك')
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
                margin: EdgeInsets.only(top: 12, left: 12, right: 12),
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
              DetailItem(title: 'title', titleData: 'title data', icon: Icon(Icons.height), function: (){},),
              DetailItem(title: 'title', titleData: 'title data', icon: Icon(Icons.height), function: (){},),
              DetailItem(title: 'title', titleData: 'title data', icon: Icon(Icons.height), function: (){},),
              DetailItem(title: 'title', titleData: 'title data', icon: Icon(Icons.height), function: (){},),
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
