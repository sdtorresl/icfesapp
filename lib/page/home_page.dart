import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icfesapp/page/documents_page.dart';
import 'package:icfesapp/page/lobby_page.dart';
import 'package:icfesapp/page/rooms_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    LobbyPage(),
    RoomsPage(),
    LobbyPage(),
    DocumentsPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _topBar(context),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber[800],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text(
              'Recepción',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            title: Text(
              'Salas',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            title: Text(
              'Agenda',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text(
              'Mas',
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _createButtons(),
    );
  }

  Widget _topBar(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double barHeight = 100;
    return PreferredSize(
      preferredSize: Size(screenWidth, barHeight),
      child: Container(
        child: Stack(
          children: [
            Container(
              width: 500,
              height: 500,
              padding: EdgeInsets.all(10),
              child: SafeArea(
                child: Image.asset("assets/img/Group 101.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _createButtons() {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    child: FloatingActionButton(
      elevation: 5.0,
      child: Icon(
        Icons.video_call,
        color: Colors.white,
      ),
      onPressed: () {},
    ),
  );
}
