import 'package:flutter/material.dart';
import 'package:pluto/UI/ChatUI/helper/constants.dart';
import 'package:pluto/UI/ChatUI/views/search.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

class DoctorsPage extends StatefulWidget {
  @override
  _DoctorsPageState createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: ()  {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
        },
        tooltip: "Add me",
        child: Icon(Icons.search),
      ),
    );
  }
}
