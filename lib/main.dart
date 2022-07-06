import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/screens/data.dart';
import 'package:hotel_booking_app/screens/data_home.dart';
import 'package:hotel_booking_app/screens/details_screen.dart';
import 'package:hotel_booking_app/screens/home_screen.dart';
import 'package:hotel_booking_app/screens/menu_screen.dart';
import 'package:hotel_booking_app/screens/dashboard.dart';
import 'package:hotel_booking_app/screens/splashscreen_view.dart';

void main(List<String> args) {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 195, 202, 252),
          primaryColor: Color.fromARGB(255, 195, 202, 252)),
      home: SplashScreenPage()
      //routes: {
      //  '/': (context) => TravelApp(),
      //  '/home_screen': (context) => HomeScreen(),
      //},
    );
  }
}
