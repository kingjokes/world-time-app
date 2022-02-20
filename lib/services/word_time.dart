import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:core';

class WorldTime{
  String location; //location name for the UI
  String flag; // url to asset flag icon
  String url;// location url for api endpoint
  var time;
  var isDayTime; //true if day or false if not

  WorldTime({required this.location,required this.flag, required this.url});


   Future<void> getTime() async{

    var url = Uri.parse('http://worldtimeapi.org/api/timezone/${this.url}');
    var response = await http.get(url);
    Map data = jsonDecode(response.body);

    //get properties from data
    String datetime = data['datetime'];

    var dateValue = new DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(datetime).toLocal();

    //set isDayTime
    isDayTime = dateValue.hour > 6 && dateValue.hour <20;
    //the time of the location
    time =  DateFormat.jm().format(dateValue);




  }







}