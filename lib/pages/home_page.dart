import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icfesapp/common/expandable_fab.dart';
import 'package:icfesapp/common/fab_bottom_app_bar.dart';
import 'package:icfesapp/pages/schedule_page.dart';
import 'package:icfesapp/pages/lobby_page.dart';
import 'package:icfesapp/pages/rooms_page.dart';
import 'options_page.dart';

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
    SchedulePage(),
    OptionsPage(),
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
      bottomNavigationBar: FABBottomAppBar(
        onTabSelected: _onItemTapped,
        selectedColor: Theme.of(context).accentColor,
        color: Colors.grey,
        items: [
          FABBottomAppBarItem(iconData: Icons.home_outlined, text: 'Recepción'),
          FABBottomAppBarItem(
              iconData: Icons.people_alt_outlined, text: 'Salas'),
          FABBottomAppBarItem(iconData: Icons.today_outlined, text: 'Agenda'),
          FABBottomAppBarItem(iconData: Icons.more_horiz_outlined, text: 'Más'),
        ],
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ExpandableFab(
        distance: 100,
        children: [
          Column(
            children: [
              Text(
                "Sala 1",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              ActionButton(
                onPressed: () => {Navigator.pushNamed(context, 'transmission')},
                icon: const Icon(Icons.videocam),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "Sala 2",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              ActionButton(
                onPressed: () => {Navigator.pushNamed(context, 'transmission')},
                icon: const Icon(Icons.videocam),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _topBar(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Orientation currentOrientation = MediaQuery.of(context).orientation;
    double barHeight = currentOrientation == Orientation.portrait ? 120 : 70;

    return PreferredSize(
      preferredSize: Size(screenWidth, barHeight),
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.all(5),
        child: SafeArea(
          child: Image.asset(
            "assets/img/icfes_app.png",
            width: screenWidth,
          ),
        ),
      ),
    );
  }
}

Widget _transmisionButton(context) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    child: FloatingActionButton(
      elevation: 5.0,
      child: Icon(
        Icons.video_call,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pushNamed(context, 'transmission');
      },
    ),
  );
}
