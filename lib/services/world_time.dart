import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location;  //location url
  String time;  //the actual time of the country
  String flag;  //the country flag
  String url; // location url
  bool isDayTime;
  dynamic weather;
  dynamic temperature;
  dynamic pressure;
  dynamic cloud;
  //String m;  //test

  WorldTime ({ this.location, this.flag, this.url });

  Future <void> getData () async {

    try{

      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode (response.body);

      Response tempResponse = await get('http://api.openweathermap.org/data/2.5/weather?q=$location&appid=8268b9e8952d305479192a9faf144049');
      Map tempData = jsonDecode (tempResponse.body);


      //Get the property needed
      String _utcDatetime = data['utc_datetime'];
      String _offsetSign = data['utc_offset'].substring(0,1);

      //All weather values
      weather = tempData['main'];

      //Getting real temperature values
      temperature = weather['temp'] - 273.15;
      temperature = temperature.toString().substring(0,4);

      //Getting humidity values
      pressure = weather['pressure'];

      //Getting cloud description
      cloud = tempData['weather'][0];
      cloud = cloud['description'];


      //calculate the time depending on time zone sign value
      if(_offsetSign == '+') {
        String _utcOffset = data['utc_offset'].substring(1,3);
        String _utcOffsetMinutes = data['utc_offset'].substring(4,6);

        //convert utc_datetime to normal date and get number of hours added or deducted
        DateTime now = DateTime.parse(_utcDatetime);

        now = now.add(Duration(hours: int.parse(_utcOffset), minutes: int.parse(_utcOffsetMinutes)));

        isDayTime = now.hour > 6 && now.hour < 18 ? true : false;

        //set the time property
        time = DateFormat.jm().format(now);

      }else{
        String _utcOffset = data['utc_offset'].substring(0,3);
        String _utcOffsetMinutes = data['utc_offset'].substring(4,6);

        //convert utc_dattime to normal date and get number of hours added or deducted
        DateTime now = DateTime.parse(_utcDatetime);

        now = now.add(Duration(hours: int.parse(_utcOffset), minutes: int.parse(_utcOffsetMinutes)));

        isDayTime = now.hour > 6 && now.hour < 18 ? true : false;


        //set the time property
        time = DateFormat.jm().format(now);
      }


    }catch(e){
      time = 'Ooops...😕';
      location = 'Check your internet!';
      flag = 'no flag';
      url = 'no url';
      isDayTime = true;
       temperature = 'Connecting...';
       pressure = 'Connecting...';
       cloud = 'Connecting...';

    }

  }

}