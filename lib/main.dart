// import 'package:flutter/material.dart';
//
// import 'UI/MainMenu.dart';
// import 'UI/login/LoginPage.dart';
//
//
//
// void main() => runApp(pluto());
//
// // class MyApp extends StatelessWidget{
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     return new MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: LoginPage(),
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pluto/page/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Google SignIn';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.deepOrange),
    home: HomePage(),
  );
}
