import 'package:flutter/material.dart';
import 'package:pluto/UI/pages/about.dart';
import 'package:pluto/UI/pages/account.dart';
import 'package:pluto/UI/pages/doctors_list.dart';
import 'package:pluto/UI/pages/records.dart';
import 'package:pluto/page/home_page.dart';
import 'package:pluto/provider/google_sign_in.dart';
import 'package:provider/provider.dart';





class pluto extends StatelessWidget {
  static const String _title = 'Pluto';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatefulWidget {
  MainMenu({Key key}) : super(key: key);

  @override
  MainMenuTrigger createState() => MainMenuTrigger();
}

class MainMenuTrigger extends State<MainMenu> {
  // int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  // TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Profile',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Records',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: Doctors',
  //     style: optionStyle,
  //   ),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  PageController _pageController = PageController();
  List<Widget> _screen = [
    AccountsPage(),RecordsPage(),DoctorsPage()
  ];

  int _selectedIndex = 0;
  void _onPageChanged(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  void _itemTapped(int selectedIndex)
  {
    _pageController.jumpToPage(selectedIndex);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(

              child: Text("PLUTO",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50
              ),
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),
            new Container (
              decoration: new BoxDecoration (
                  color: Colors.black87
              ),
              child: new ListTile(

                title: Text('About',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),);
                },
              ),
            ),

            new Container (
              decoration: new BoxDecoration (
                  color: Colors.black87
              ),
              child: new ListTile(

                title: Text('Logout',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                ),
                onTap: () {
                  final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),);
                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Pluto'),
      ),
      body: Center(
        child: PageView(
          controller: _pageController,
          children: _screen,
          onPageChanged: _onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        )//_widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _itemTapped,
        backgroundColor: Colors.black87,
        currentIndex: this._selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blueAccent[800],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes_outlined),
            label: 'Records',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_rounded ),
            label: 'Doctors',
          ),
        ],
        //currentIndex: _selectedIndex,
        //onTap: _onItemTapped,
      ),
    );
  }
}