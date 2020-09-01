import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:videostreaming/providers/UserProvider.dart';
import 'package:videostreaming/screens/BottomNavigationScreens/Video.dart';
import 'package:videostreaming/screens/NoEmailScreen.dart';

class LiveConfirmationPage extends StatefulWidget {
  final String channelName;
  LiveConfirmationPage({this.channelName});
  @override
  _LiveConfirmationPageState createState() => _LiveConfirmationPageState();
}

class _LiveConfirmationPageState extends State<LiveConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return (user.getEmail == null || user.getEmail.isEmpty)
        ? NoEmailScreen()
        : SafeArea(
            child: Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      Color(0xff6950FB),
                      Color(0xffB83AF3),
                    ],
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                        20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CONFIRM',
                            style: TextStyle(
                              fontFamily: 'fontbold',
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            'Are you sure you want to start a Live Session?',
                            style: TextStyle(
                              fontFamily: 'font',
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RaisedButton(
                                onPressed: onJoin,
                                child: Text(
                                  'Yes',
                                  style: TextStyle(
                                    fontFamily: 'fontbold',
                                    color: Colors.white,
                                  ),
                                ),
                                color: Color(0xff6950FB),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Future<void> onJoin() async {
    // update input validation
    if (widget.channelName.isNotEmpty) {
      await _handleCameraAndMic();
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Video(
            channelName: widget.channelName,
            role: ClientRole.Broadcaster,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }
}
