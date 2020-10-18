import 'package:flutter/material.dart';
import 'package:icfesapp/common/custom_webview.dart';
import 'package:icfesapp/main.dart';
import 'package:icfesapp/models/transmission_model.dart';
import 'package:icfesapp/providers/transmission_provider.dart';
import 'package:vimeoplayer/vimeoplayer.dart';

class TransmissionPage extends StatefulWidget {
  final int id;

  TransmissionPage({Key key, this.id}) : super(key: key);

  @override
  _TransmissionPageState createState() => _TransmissionPageState();
}

class _TransmissionPageState extends State<TransmissionPage> {
  Widget _currentWidget;
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    TransmissionProvider transProvider = TransmissionProvider();

    return FutureBuilder(
      future: transProvider.getTransmission(widget.id),
      builder:
          (BuildContext context, AsyncSnapshot<TransmissionModel> snapshot) {
        if (snapshot.hasData) {
          TransmissionModel transmission = snapshot.data;
          if (_currentWidget == null) {
            _currentWidget =
                chat("https://www6.cbox.ws/box/?boxid=850491&boxtag=RQtfaw");
          }

          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: IcfesApp().accent,
              ),
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    transmission.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(color: Colors.black),
                  ),
                ),
                Container(
                  child:
                      VimeoPlayer(id: transmission.videoCode, autoPlay: true),
                ),
                bottomSelector(
                    chatUrl:
                        "https://www6.cbox.ws/box/?boxid=850491&boxtag=RQtfaw"),
                Expanded(child: _currentWidget),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget bottomSelector({String chatUrl}) {
    List<Map<String, dynamic>> tabs = [
      {"title": 'Comentarios', "widget": chat(chatUrl)},
      {"title": "Encuesta", "widget": poll(chatUrl)}
    ];

    double totalWidth = MediaQuery.of(context).size.width;
    double tabWidth = totalWidth / tabs.length;

    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: tabs.map((tab) {
          int currentIndex = tabs.indexOf(tab);
          bool selected = currentIndex == _selectedTab;

          Function onTabFunction = () {
            setState(() {
              _selectedTab = currentIndex;
              _currentWidget = tab["widget"];
            });
          };

          return _tab(tab["title"], onTabFunction, selected, tabWidth);
        }).toList(),
      ),
    );
  }

  Widget _tab(String title, Function onTap, bool selected, double width) {
    double borderRadius = 10;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: selected ? IcfesApp().primaryLight : IcfesApp().grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          ),
        ),
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: selected ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget chat(String url) {
    return CustomWebView(url);
  }

  Widget poll(String url) {
    return Text("Hola");
  }
}
