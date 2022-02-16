import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget MyDrawerList() {
  return Container(
    padding: EdgeInsets.only(top: 15),
    child: Column(
      children: [
        MenuItem(1, "Dashboard", Icons.dashboard_outlined, true),
        MenuItem(2, "Contacts", Icons.people_alt_outlined, true),
        MenuItem(3, "Events", Icons.event, true),
        MenuItem(4, "Notes", Icons.notes, true),
        MenuItem(5, "Settings", Icons.settings, true),
        MenuItem(6, "Notifications", Icons.notification_important_outlined, true),
        MenuItem(7, "Privacy policy", Icons.privacy_tip_outlined, true),
        MenuItem(8, "Send feedback", Icons.feedback_outlined, true),
      ],
    ),
  );
}

Widget MenuItem(int id, String title, IconData icon, bool selected) {
  return Material(
    child: InkWell(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
                child: Icon(icon, size: 20, color: Colors.black,)),
            Expanded(
              flex: 3,
              child: Text(title,
                style: const TextStyle(color: Colors.black, fontSize: 16),),)
          ],
        ),
      ),
    ),
  );
}

Widget MyHeaderDrawer() {
  return Container(
    color: Colors.blue[700],
    width: double.infinity,
    height: 200,
    padding: EdgeInsets.all(20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Container(
        //   margin: EdgeInsets.only(left: 12),
        //   height: 70,
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //     image: DecorationImage(
        //       image: AssetImage('assets/logo.png')
        //     )
        //   ),
        // ),
        Image.asset('assets/logo.png', height: 70,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Yalla shot'),
            Text('يلا شوت')
          ],
        )
      ],
    ),
  );
}