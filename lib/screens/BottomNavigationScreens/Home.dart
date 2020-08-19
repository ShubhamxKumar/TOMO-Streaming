import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:videostreaming/screens/TestScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Center(
            child: Container(
              padding: EdgeInsets.only(
                top: 20,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff6950FB),
                    Color(0xffB83AF3),
                  ],
                ),
              ),
              child: AppBar(
                flexibleSpace: SafeArea(
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
                          child: FaIcon(FontAwesomeIcons.crown),
                        ),
                      ),
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
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: FaIcon(FontAwesomeIcons.search),
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            TestScreen(),
            TestScreen(),
            TestScreen(),
            TestScreen(),
            TestScreen(),
          ],
        ),
      ),
    );
  }
}
