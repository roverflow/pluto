import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Testing',
      home:new Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(

          backgroundColor: Colors.amber,
          title: const Text('About'),

        ),
        body: Center(
          child: Text('\nMade by the student team pwn function for Jyothy Institute of Technology Hackathon.\n\n\n\nMembers:\nAditya Krishnan\nVinay Mulugund\nTushar Thakur\nMedesh\n\n\nVersion 1.0',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25
            ),
          ),),
      ),
    );
  }
}