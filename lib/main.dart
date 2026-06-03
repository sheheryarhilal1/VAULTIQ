import 'package:card_payment_app/Splash_screen.dart';
import 'package:card_payment_app/package.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
       home: SimPackagesScreen(),
    );
  }
}