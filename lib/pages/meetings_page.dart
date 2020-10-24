import 'dart:io';

import 'package:flutter/material.dart';
import 'package:icfesapp/models/user_model.dart';
import 'package:icfesapp/preferences/user_preferences.dart';
import 'package:icfesapp/providers/user_provider.dart';
import 'package:jitsi_meet/feature_flag/feature_flag_enum.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:jitsi_meet/jitsi_meeting_listener.dart';
import '../main.dart';

class MeetingsPage extends StatefulWidget {
  final String host;
  final String room;
  final String subject;
  final String description;

  MeetingsPage({
    Key key,
    @required this.host,
    @required this.room,
    @required this.subject,
    this.description,
  }) : super(key: key);

  @override
  _MeetingsPageState createState() => _MeetingsPageState();
}

class _MeetingsPageState extends State<MeetingsPage> {
  var nameText = TextEditingController();
  var emailText = TextEditingController();
  var isAudioOnly = true;
  var isAudioMuted = true;
  var isVideoMuted = true;

  @override
  void initState() {
    super.initState();

    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    final _prefs = UserPreferences();
    final userProvider = UserProvider();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: IcfesApp().accent,
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          padding: EdgeInsets.only(left: 75),
          child: Image(
            width: 300,
            image: AssetImage('assets/img/dots.png'),
            repeat: ImageRepeat.repeat,
          ),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: FutureBuilder(
            future: userProvider.getUser(_prefs.token),
            builder: (context, AsyncSnapshot<UserModel> snapshot) {
              if (snapshot.hasData) {
                nameText.text = snapshot.data.name;
                emailText.text = snapshot.data.mail;

                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          widget.subject,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      TextField(
                        controller: nameText,
                        decoration: InputDecoration(
                          labelText: "Nombre",
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        controller: emailText,
                        decoration: InputDecoration(
                          labelText: "Correo electrónico",
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      CheckboxListTile(
                        title: Text("Solo audio"),
                        value: isAudioOnly,
                        onChanged: _onAudioOnlyChanged,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      CheckboxListTile(
                        title: Text("Mute"),
                        value: isAudioMuted,
                        onChanged: _onAudioMutedChanged,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      CheckboxListTile(
                        title: Text("Apagar video"),
                        value: isVideoMuted,
                        onChanged: _onVideoMutedChanged,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: RaisedButton(
                            child: Text(
                              "Unirse a la reunión",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(color: Colors.white),
                            ),
                            onPressed: () => _joinMeeting(),
                            color: IcfesApp().accent),
                      ),
                      SizedBox(
                        height: 48.0,
                      ),
                    ],
                  ),
                );
              } else {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          )),
    );
  }

  _onAudioOnlyChanged(bool value) {
    setState(() {
      isAudioOnly = value;
    });
  }

  _onAudioMutedChanged(bool value) {
    setState(() {
      isAudioMuted = value;
    });
  }

  _onVideoMutedChanged(bool value) {
    setState(() {
      isVideoMuted = value;
    });
  }

  _joinMeeting() async {
    try {
      Map<FeatureFlagEnum, bool> featureFlags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      };

      // Here is an example, disabling features for each platform
      if (Platform.isAndroid) {
        // Disable ConnectionService usage on Android to avoid issues (see README)
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        // Disable PIP on iOS as it looks weird
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }

      // Define meetings options here
      var options = JitsiMeetingOptions()
        ..room = widget.room
        ..serverURL = widget.host
        ..subject = widget.subject
        ..userDisplayName = nameText.text
        ..userEmail = emailText.text
        ..audioOnly = isAudioOnly
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted
        ..featureFlags.addAll(featureFlags);

      debugPrint("JitsiMeetingOptions: $options");
      await JitsiMeet.joinMeeting(
        options,
        listener: JitsiMeetingListener(onConferenceWillJoin: ({message}) {
          debugPrint("${options.room} will join with message: $message");
        }, onConferenceJoined: ({message}) {
          debugPrint("${options.room} joined with message: $message");
        }, onConferenceTerminated: ({message}) {
          debugPrint("${options.room} terminated with message: $message");
        }),
        // by default, plugin default constraints are used
        //roomNameConstraints: new Map(), // to disable all constraints
        //roomNameConstraints: customContraints, // to use your own constraint(s)
      );
    } catch (error) {
      debugPrint("error: $error");
    }
  }

  void _onConferenceWillJoin({message}) {
    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined({message}) {
    debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated({message}) {
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  _onError(error) {
    debugPrint("_onError broadcasted: $error");
  }
}
