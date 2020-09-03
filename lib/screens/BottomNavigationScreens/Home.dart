import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:videostreaming/screens/TabBarScreens/Feature.dart';
import 'package:videostreaming/screens/TabBarScreens/Crown.dart';
import 'package:videostreaming/screens/TabBarScreens/Nearby.dart';
import 'package:videostreaming/screens/TabBarScreens/Newest.dart';
import 'package:videostreaming/screens/TabBarScreens/Search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 66 + statusBarHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xff6950FB),
                      Color(0xffB83AF3),
                    ],
                    tileMode: TileMode.clamp,
                  ),
                ),
                child: AppBar(
                  flexibleSpace: SafeArea(
                    child: Row(
                      children: [
                        IconButton(
                          padding: const EdgeInsets.all(8.0),
                          icon: FaIcon(
                            FontAwesomeIcons.crown,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => Crown(),
                              ),
                            );
                          },
                        ),
                        Expanded(
                          child: Container(
                            child: TabBar(
                              indicatorPadding: EdgeInsets.all(0),
                              labelPadding: EdgeInsets.all(0),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.white,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                // borderRadius: BorderRadius.only(
                                //     topLeft: Radius.circular(10),
                                //     topRight: Radius.circular(10)),
                                color: Colors.white.withOpacity(
                                  0.2,
                                ),
                              ),
                              tabs: [
                                Tab(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Feature",
                                      style: TextStyle(
                                        fontFamily: 'font',
                                      ),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Nearby",
                                      style: TextStyle(
                                        fontFamily: 'font',
                                      ),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Newest",
                                      style: TextStyle(
                                        fontFamily: 'font',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          padding: const EdgeInsets.all(8.0),
                          icon: FaIcon(
                            FontAwesomeIcons.search,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => Search(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height -
                    (66 + statusBarHeight) -
                    MediaQuery.of(context).padding.top,
                child: TabBarView(
                  children: [
                    Feature(),
                    Nearby(),
                    Newest(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
