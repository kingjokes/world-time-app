import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/word_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String timeLoader = 'loading';

  void setupWorldTime() async {
    try{
      WorldTime worldTime = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
      await worldTime.getTime();
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        'location': worldTime.location,
        'flag': worldTime.flag,
        'time': worldTime.time,
        'isDayTime': worldTime.isDayTime
      });
    }catch(error){
      print(error.toString());
      setState(() {
        timeLoader="Could not get time data";
      });
    }

  }

  @override
  void initState(){
    super.initState();
    setupWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child:SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        )
      )
    );
  }
}
