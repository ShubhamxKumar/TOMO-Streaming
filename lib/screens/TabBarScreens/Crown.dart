import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:videostreaming/widgets/LiveUserTile.dart';

class Crown extends StatefulWidget {
  @override
  _CrownState createState() => _CrownState();
}

class _CrownState extends State<Crown> {
  List UsersLive = [
    {
      'name': 'John Doe',
      'rank': 1,
      'views': 1625,
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.explicit.bing.net%2Fth%3Fid%3DOIP.-l7U8CSRm-8TQ2TfM5SaeQHaKE%26pid%3DApi&f=1',
    },
    {
      'name': 'Sara Dane',
      "rank": 2,
      'views': 1253,
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.jmreEH6yJdq8upJAWyOOqAHaJY%26pid%3DApi&f=1',
    },
    {
      'name': 'Scarlett',
      'rank': 3,
      'views': 1542,
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.CLhTP-UgIxS855hdQ-aMJAHaHd%26pid%3DApi&f=1',
    },
    {
      'name': 'Jane Austen',
      'rank': 4,
      'views': 1765,
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.-QTqxxcZT08TlxjxaFvuhQHaE7%26pid%3DApi&f=1',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Center(
            child: Container(
              padding: EdgeInsets.only(
                top: 5,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: AppBar(
                flexibleSpace: SafeArea(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 14,
                    ),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'View',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'font',
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_drop_down,
                              ),
                              onPressed: null,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.globe,
                              color: Colors.grey,
                            ),
                            Text(
                              ' Global',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'font',
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_drop_down,
                              ),
                              onPressed: null,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
          ),
        ),
        body: Container(
            padding: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GridView(
              children: UsersLive.map((user) {
                return LiveUserTile(
                  name: user['name'],
                  photo: user['photo'],
                  rank: user['rank'],
                  views: user['views'],
                );
              }).toList(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
              ),
            )),
      ),
    );
  }
}
