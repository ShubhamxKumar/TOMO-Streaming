import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:videostreaming/screens/CrownScreens.dart/widgets/LeaderBoardTile.dart';
import 'package:videostreaming/screens/CrownScreens.dart/widgets/WinnersCircleCard.dart';

class Daily extends StatefulWidget {
  @override
  _DailyState createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  List LeaderBoard = [
    {
      'index': 1,
      'name': 'John Doe',
      'views': 999845,
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.explicit.bing.net%2Fth%3Fid%3DOIP.-l7U8CSRm-8TQ2TfM5SaeQHaKE%26pid%3DApi&f=1',
    },
    {
      'index': 2,
      'name': 'Sara Dane',
      "views": 988562,
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.jmreEH6yJdq8upJAWyOOqAHaJY%26pid%3DApi&f=1',
    },
    {
      'index': 3,
      'name': 'Scarlett',
      'views': 965412,
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.CLhTP-UgIxS855hdQ-aMJAHaHd%26pid%3DApi&f=1',
    },
    {
      'index': 4,
      'name': 'Jane Austen',
      'views': 987456,
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.-QTqxxcZT08TlxjxaFvuhQHaE7%26pid%3DApi&f=1',
    },
    {
      'index': 5,
      'name': 'Jane Austen',
      'views': 987456,
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.-QTqxxcZT08TlxjxaFvuhQHaE7%26pid%3DApi&f=1',
    },
    {
      'index': 6,
      'name': 'Jane Austen',
      'views': 987456,
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.-QTqxxcZT08TlxjxaFvuhQHaE7%26pid%3DApi&f=1',
    },
    {
      'index': 7,
      'name': 'Jane Austen',
      'views': 987456,
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.-QTqxxcZT08TlxjxaFvuhQHaE7%26pid%3DApi&f=1',
    },
  ];
  List Winners = [
    {
      'name': 'Betty Vega',
      'views': 1026489,
      'position': 2,
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.explicit.bing.net%2Fth%3Fid%3DOIP.-l7U8CSRm-8TQ2TfM5SaeQHaKE%26pid%3DApi&f=1',
    },
    {
      'name': 'Myrtie Clark',
      'views': 1259785,
      'position': 1,
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.-QTqxxcZT08TlxjxaFvuhQHaE7%26pid%3DApi&f=1',
    },
    {
      'name': 'Ida Palmer',
      'views': 1012465,
      'position': 3,
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.CLhTP-UgIxS855hdQ-aMJAHaHd%26pid%3DApi&f=1',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff6950FB),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Color(0xff6950FB),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: Winners.map((e) {
                      return WinnersCircleCard(
                        name: e['name'],
                        pos: e['position'],
                        photo: e['photo'],
                        views: e['views'],
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(0),
                child: Column(
                  children: LeaderBoard.map(
                    (e) {
                      return LeaderBoardTile(
                        index: e['index'],
                        name: e['name'],
                        photo: e['photo'],
                        views: e['views'],
                      );
                    },
                  ).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
