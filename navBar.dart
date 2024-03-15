import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'نورهان عادل',
                  style: TextStyle(fontFamily: 'Almarai'),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            accountEmail: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'ITEnginnerNourhan@outlook.com',
                  style: TextStyle(fontFamily: 'Almarai'),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/me.jpeg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  alignment: Alignment.topRight,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage('assets/ocean.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.topRight,
              ),
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'الملف الشخصي',
                  style: TextStyle(fontFamily: 'Almarai'),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(width: 8), // Adjust the space between icon and text
                Icon(Icons.account_circle,
                color: Color(0xff618FCA),
                ),
              ],
            ),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'الإعدادات والخصوصية',
                  style: TextStyle(fontFamily: 'Almarai'),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(width: 8),
                Icon(Icons.settings
                  ,
                  color: Color(0xff618FCA),),
              ],
            ),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'مستجدات شكواك',
                  style: TextStyle(fontFamily: 'Almarai'),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(width: 8),
                Icon(Icons.notifications,
                  color: Color(0xff618FCA),),
              ],
            ),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'سياسات التطبيق',
                  style: TextStyle(fontFamily: 'Almarai'),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(width: 8),
                Icon(Icons.policy,
                    color: Color(0xff618FCA),),
              ],
            ),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'الخروج',
                  style: TextStyle(fontFamily: 'Almarai'),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(width: 8),
                Icon(Icons.logout,
    color: Color(0xff618FCA),),
              ],
            ),
            onTap: () => null,
          ),
          Divider(),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug tap
      home: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text('App Title'),
        ),
        body: Container(),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
