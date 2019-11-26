import 'package:flutter/material.dart';
import 'package:world_times/services/world_time.dart';


class ChooseLocation extends StatefulWidget {

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime> locations = [
    WorldTime(location: 'Abidjan', url: 'Africa/Abidjan', flag: 'abidjan.png'),
    WorldTime(location: 'Algiers', url: 'Africa/Algiers', flag: 'algiers.png'),
    WorldTime(location: 'Bissau', url: 'Africa/Bissau', flag: 'bissau.png'),
    WorldTime(location: 'Casablanca', url: 'Africa/Casablanca', flag: 'egypt.png'),
    WorldTime(location: 'Juba', url: 'Africa/Juba', flag: 'sa.png'),
    WorldTime(location: 'London', url: 'Europe/London', flag: 'uk.png'),
    WorldTime(location: 'Sydney', url: 'Australia/Sydney', flag: 'austalia.png'),
    WorldTime(location: 'Accra', url: 'Africa/Accra', flag: 'ghana.png'),
    WorldTime(location: 'Kuala Lumpur', url: 'Asia/Kuala_Lumpur', flag: 'malaysia.png'),
    WorldTime(location: 'Johannesburg', url: 'Africa/Johannesburg', flag: 'sa.png'),
    WorldTime(location: 'Doha', url: 'Asia/Qatar', flag: 'qatar.png'),
    WorldTime(location: 'Conakry', url: 'Africa/Conakry', flag: 'guinea.png'),
    WorldTime(location: 'Cairo', url: 'Africa/Cairo', flag: 'egypt.png'),
    WorldTime(location: 'Chicago', url: 'America/Chicago', flag: 'usa.png'),
    WorldTime(location: 'Los Angeles', url: 'America/Los_Angeles', flag: 'usa.png'),



  ];

  void updateTime (index) async{
    WorldTime instance = locations[index];
    await instance.getData();
    
    Navigator.pop(context, {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );
          }
      )
    );
  }
}
