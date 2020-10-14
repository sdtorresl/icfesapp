import 'package:flutter/material.dart';
import 'package:icfesapp/common/custom_webview.dart';
import 'package:icfesapp/main.dart';
import 'package:icfesapp/models/transmission_model.dart';
import 'package:icfesapp/providers/transmission_provider.dart';

class TransmissionPage extends StatefulWidget {
  final int id;

  TransmissionPage({Key key, this.id}) : super(key: key);

  @override
  _TransmissionPageState createState() => _TransmissionPageState();
}

class _TransmissionPageState extends State<TransmissionPage> {
  Widget _currentWidget;

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
                Text(
                  transmission.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Colors.black),
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(color: IcfesApp().primaryDark),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(color: IcfesApp().primaryLight),
            padding: EdgeInsets.all(10),
            child: Text(
              "Chat",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.white),
            ),
          ),
          onTap: () {
            setState(() {
              _currentWidget = chat(chatUrl);
            });
          },
        ),
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(color: IcfesApp().primaryLight),
            padding: EdgeInsets.all(10),
            child: Text(
              "Encuestas",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.white),
            ),
          ),
          onTap: () {
            setState(() {
              _currentWidget = poll(chatUrl);
            });
          },
        )
      ],
    );
  }

  Widget chat(String url) {
    return CustomWebView(url);
  }

  Widget poll(String url) {
    return Text("Hola");
  }
}
