import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_times/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setUpWorldTime() async{
    WorldTime instance = WorldTime(location: 'Sydney', flag: 'Sydney.png', url: 'Australia/Sydney');
    await instance.getData(); //print(instance.m);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
      'temperature' : instance.temperature,
      'pressure' : instance.pressure,
      'cloud' : instance.cloud
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 70.0,
        ),
      ),
    );
  }
}
