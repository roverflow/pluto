import 'package:flutter/material.dart';
import 'package:pluto/UI/MiscPages/RecordsAdd.dart';



class RecordsPage extends StatefulWidget {
  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RecordsAdd()))
        },
        tooltip: "Add me",
        child: Icon(Icons.add),

      ),
    );
  }
}
