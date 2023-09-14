import 'package:flutter/material.dart';
import 'package:unlimit/app/Theme.dart';
import 'package:unlimit/app/di.dart';
import 'package:unlimit/presentation/MyHomePage.dart';

void main() async{
  await inject();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: fontFamily
      ),
      home: MyHomePage(),
    );
  }
}
