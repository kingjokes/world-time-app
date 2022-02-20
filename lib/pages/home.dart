import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data ={} ;

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : (ModalRoute.of(context)?.settings.arguments as Map);


    //set Background
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return  Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,100,0,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton.icon(
                    onPressed: () async{
                     dynamic result = await Navigator.pushNamed(context, '/location');
                     setState(() {
                       data={
                         'location': result['location'],
                         'flag': result['flag'],
                         'time': result['time'],
                         'isDayTime': result['isDayTime']
                       };
                     });
                    },
                    icon: Icon(
                        Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: const Text('Edit Location'),
                  style: TextButton.styleFrom(
                    primary: Colors.grey[300]
                  ),
                ),
                const SizedBox(height: 20,),
                Center(
                  child: Text(
                    data['location'],
                    style: const TextStyle(
                        fontSize: 28,
                        letterSpacing: 2.0,
                      color: Colors.white
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Center(
                  child: Text(
                    data['time'],
                    style: const TextStyle(
                      fontSize: 66,
                        color: Colors.white

                    ),
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
