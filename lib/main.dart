import 'package:flutter/material.dart';
import 'package:myactivityapp/activityDetail.dart';
import 'HomeScreen.dart';
//import 'package:intl/date_symbol_data_local.dart';
//import 'package:intl/intl.dart';
//import 'package:intl/intl_standalone.dart';

void main() async {
  //Intl.defaultLocale = await findSystemLocale();
  //await initializeDateFormatting();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      initialRoute: '/home',
      routes: {
        '/home': ((context) => HomeScreen()),
        '/activitydetail': (context) => ActivityDetail(),
      },
    ),
  );
}
