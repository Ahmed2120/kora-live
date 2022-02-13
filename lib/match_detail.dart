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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            collapsedHeight: 200,
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
                height: 1000,
                width: double.infinity,
                color: Colors.grey,
              )
            ]
          ))
        ],
      ),
    );
  }
}
