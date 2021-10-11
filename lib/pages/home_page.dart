import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icfesapp/common/expandable_fab.dart';
import 'package:icfesapp/common/fab_bottom_app_bar.dart';
import 'package:icfesapp/models/room_model.dart';
import 'package:icfesapp/pages/schedule_page.dart';
import 'package:icfesapp/pages/lobby_page.dart';
import 'package:icfesapp/pages/rooms_page.dart';
import 'package:icfesapp/pages/transmission_page.dart';
import 'package:icfesapp/providers/rooms_provider.dart';
import 'options_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController _tabController;
  final roomsProvider = RoomsProvider();

  static const List<Widget> _widgetOptions = <Widget>[
    LobbyPage(),
    RoomsPage(),
    SchedulePage(),
    OptionsPage(),
  ];

  void _onItemTapped(int index) {
    _tabController.animateTo(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _tabController = TabController(vsync: this, length: _widgetOptions.length);
    _tabController.addListener(() {
      setState(() {
        if (_tabController.indexIsChanging ||
            (_tabController.animation.value == _tabController.index)) {
          setState(() {
            _selectedIndex = _tabController.index;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _topBar(context),
      body: TabBarView(
        controller: _tabController,
        children: _widgetOptions,
      ),
      //_widgetOptions.elementAt(_selectedIndex),
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
      floatingActionButton: FutureBuilder(
        future: roomsProvider.getRooms(),
        builder:
            (BuildContext context, AsyncSnapshot<List<RoomModel>> snapshot) {
          if (snapshot.hasData) {
            List<Widget> rooms = [];

            for (var room in snapshot.data) {
              rooms.add(
                Column(
                  children: [
                    ActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransmissionPage(id: room.id),
                          ),
                        );
                      },
                      icon: const Icon(Icons.videocam),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      room.title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 15),
                    ),
                  ],
                ),
              );
            }

            return ExpandableFab(
              distance: 100,
              children: rooms,
            );
          } else {
            return SizedBox();
          }
        },
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
