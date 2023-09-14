import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:unlimit/app/Theme.dart';
import 'package:unlimit/app/di.dart';
import 'package:unlimit/presentation/homepage/MyHomePage.dart';

void main() async {
  await init();
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
          fontFamily: fontFamily),
      home: MyHomePage(),
    );
  }
}

Future init() async {
  await Hive.initFlutter();
}
