import 'package:flutter/material.dart';
import 'package:world_times/screens/home.dart';
import 'package:world_times/screens/choose_location.dart';
import 'package:world_times/screens/loading.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((_) {

    runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation()
      },
    ));

  });

}

