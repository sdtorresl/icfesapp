import 'package:flutter/material.dart';
import 'package:icfesapp/common/recorded_list.dart';
import 'package:icfesapp/common/room_list.dart';
import 'package:icfesapp/main.dart';
import 'package:icfesapp/providers/prerecorded_provider.dart';
import 'package:icfesapp/providers/rooms_provider.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({Key key}) : super(key: key);
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  void initState() {
    super.initState();

    _currentWidget = roomSelector(context);
  }

  Widget _currentWidget;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      child: _currentWidget,
      duration: Duration(seconds: 1),
      transitionBuilder: (child, animation) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const beginOpacity = Opacity(opacity: 0);
        const endOpacity = Opacity(opacity: 1);

        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Widget roomSelector(context) {
    return Scaffold(
      body: Center(
        child: ListView(children: [
          SizedBox(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Selecciona la Sala',
                style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'PoppinsMedium',
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            height: 50,
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: IcfesApp().primary,
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              title: Text(
                "En vivo",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PoppinsMedium',
                ),
              ),
              subtitle: Text("Lorem ipsum dolor sit amet, consectetur ",
                  style: TextStyle(fontFamily: 'Montserrat')),
              trailing: Icon(
                IconData(0xe900, fontFamily: 'VideoCall'),
                color: Colors.white,
                size: 50,
              ),
              onTap: () {
                setState(() => {_currentWidget = roomList(context)});
              },
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: Colors.deepPurpleAccent,
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              title: Text(
                "Galería de experiencias",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PoppinsMedium',
                ),
              ),
              subtitle: Text("Lorem ipsum dolor sit amet, consectetur",
                  style: TextStyle(fontFamily: 'Montserrat')),
              trailing: Icon(
                IconData(0xe900, fontFamily: 'VideoCall'),
                color: Colors.white,
                size: 50,
              ),
              enabled: true,
              onTap: () {
                setState(() => {_currentWidget = recordedList(context)});
              },
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: IcfesApp().primaryLight,
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              title: Text(
                "Sala Colombia",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PoppinsMedium',
                ),
              ),
              subtitle: Text(
                "Lorem ipsum dolor sit amet, consectetur ",
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              trailing: Icon(
                IconData(0xe900, fontFamily: 'VideoCall'),
                color: Colors.white,
                size: 50,
              ),
              onTap: () {
                setState(() => {_currentWidget = historicList(context)});
              },
            ),
          ),
          SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }

  Widget roomList(context) {
    final roomsProvider = RoomsProvider();
    return ListView(children: <Widget>[
      Container(
        color: Color.fromRGBO(243, 243, 243, 1),
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() => {_currentWidget = roomSelector(context)});
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: IcfesApp().accent,
                  size: 40,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "En vivo",
                style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'PoppinsMedium',
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ]),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Color.fromRGBO(243, 243, 243, 1),
        child: FutureBuilder(
          future: roomsProvider.getRooms(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return RoomList(rooms: snapshot.data);
            } else {
              return Container(
                height: 400,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    ]);
  }

  Widget recordedList(context) {
    final prerecordedProvider = PrerecordedProvider();
    return ListView(children: <Widget>[
      Container(
        color: Color.fromRGBO(243, 243, 243, 1),
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() => {_currentWidget = roomSelector(context)});
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: IcfesApp().accent,
                      size: 40,
                    ),
                  ),
                  Text(
                    "Galería de experiencias",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'PoppinsMedium',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ]),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Color.fromRGBO(243, 243, 243, 1),
        child: FutureBuilder(
          future: prerecordedProvider.getPrerecorded(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return RecordedList(
                recorded: snapshot.data,
              );
            } else {
              return Container(
                height: 400,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    ]);
  }

  Widget historicList(context) {
    final prerecordedProvider = PrerecordedProvider();
    return ListView(children: <Widget>[
      Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        color: Color.fromRGBO(243, 243, 243, 1),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() => {_currentWidget = roomSelector(context)});
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: IcfesApp().accent,
                  size: 40,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Sala Colombia",
                style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'PoppinsMedium',
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ]),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Color.fromRGBO(243, 243, 243, 1),
        child: FutureBuilder(
          future: prerecordedProvider.getHistoric(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return RecordedList(
                recorded: snapshot.data,
              );
            } else {
              return Container(
                height: 400,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    ]);
  }
}
