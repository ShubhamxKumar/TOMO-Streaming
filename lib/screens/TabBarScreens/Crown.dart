import 'package:flutter/material.dart';
import 'package:videostreaming/screens/CrownScreens.dart/Daily.dart';
import 'package:videostreaming/screens/CrownScreens.dart/Monthly.dart';
import 'package:videostreaming/screens/CrownScreens.dart/Totally.dart';
import 'package:videostreaming/screens/CrownScreens.dart/Weekly.dart';

class Crown extends StatefulWidget {
  @override
  _CrownState createState() => _CrownState();
}

class _CrownState extends State<Crown> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            centerTitle: true,
            title: Text('LeaderBoard'),
            backgroundColor: Color(0xff6950FB),
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: Size.fromWidth(
                MediaQuery.of(context).size.width * 0.8,
              ),
              child: TabBar(
                indicatorPadding: EdgeInsets.all(0),
                labelPadding: EdgeInsets.all(0),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white.withOpacity(
                    0.2,
                  ),
                ),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Daily"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Weekly"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Monthly"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Totally"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Daily(),
            Weekly(),
            Monthly(),
            Totally(),
          ],
        ),
      ),
    );
  }
}
