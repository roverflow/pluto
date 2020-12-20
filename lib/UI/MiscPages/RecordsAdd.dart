

import 'package:flutter/material.dart';

class RecordsAdd extends StatefulWidget {
  @override
  _RecordsAddState createState() => _RecordsAddState();
}

class _RecordsAddState extends State<RecordsAdd> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nameController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Add Record'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Doctor Name'
                ),
              ),

            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: nameController1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Date Visited'
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
