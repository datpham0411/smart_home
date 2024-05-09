import 'package:smart_home/main_screen.dart';
import 'package:smart_home/model/network/mqtt_help.dart';
import 'package:flutter/material.dart';

import 'home_page/home_page.dart';
import 'model/adafruit_server.dart';

Future<void> main() async {
  adafruitServer.mqttHelp.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      theme:  ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
