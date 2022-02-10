import 'package:flutter/material.dart';

class HeadToHeadMatch extends StatelessWidget {
  const HeadToHeadMatch({Key? key}) : super(key: key);

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
              Image.asset('assets/logo.png', width: 20,),
              const SizedBox(width: 10,),
              Text('الاهلي'),
            ],
          ),
          Column(
            children: [
              Text('VS'),
              Text('70'),
            ],
          ),
          Row(
            children: [
              Text('الزمالك'),
              const SizedBox(width: 10,),
              Image.asset('assets/logo.png', width: 20,),
            ],
          ),
        ],
      ),
    );
  }
}
