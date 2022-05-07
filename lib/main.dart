import 'package:bmi/screens/home.dart';
import 'package:flutter/material.dart';


void main(List<String> args) {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primaryColor: Colors.yellow,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      home: HomeScreen(),
      
    );
  }
}