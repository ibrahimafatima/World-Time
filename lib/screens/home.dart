import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    //print(data);

    // set background img
    String bdImg = data['isDayTime'] ? 'day2.jpg' : 'night1.jpg';
    Color bdColor = data['isDayTime'] ? Colors.blue[200] : Colors.black54;
    Color bdColorTime = data['isDayTime'] ? Colors.white : Colors.white;

    return Scaffold(
      backgroundColor: bdColor,
      body : SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage ('assets/$bdImg'),
                  fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton.icon(
                        onPressed: (){},
                        icon: Icon(
                          Icons.wb_sunny,
                          color: Colors.white,
                        ),
                        label: Text(
                          '${data['temperature']} Celsius',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      FlatButton.icon(
                        onPressed: (){},
                        icon: Icon(
                          Icons.toys,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Pressure  ${data['pressure']} mb',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                  FlatButton.icon(
                    onPressed: (){},
                    icon: Icon(
                      Icons.cloud,
                      color: Colors.white,
                    ),
                    label: Text(
                      '${data['cloud']}',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: FlatButton.icon(
                        onPressed: () async{
                         dynamic result = await Navigator.pushNamed(context, '/location');
                         data = {
                           'time': result['time'],
                           'flag': result['flag'],
                           'isDayTime' : result['isDayTime'],
                           'location' : result['location'],
                           'temperature' : result['temperature'],
                           'pressure' : result['pressure'],
                           'cloud' : result['cloud']
                         };
                        },
                      color: Colors.blue[900],
                        icon: Icon(
                            Icons.edit_location,
                          color: Colors.white,
                        ),
                        label: Text(
                            'Edit Location',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 56.0,
                      color: bdColorTime
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
