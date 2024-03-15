import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationMenu(), // Using NavigationMenu widget as the home
    );
  }
}

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.message_rounded, color: Color(0xff618FCA),), label: 'المحادثات'),
          NavigationDestination(icon: Icon(Icons.home_outlined, color: Color(0xff618FCA)), label: 'الرئيسية'),
        ],
      ),
    );
  }
}
