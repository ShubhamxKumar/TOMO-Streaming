import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:videostreaming/widgets/LiveUserTile.dart';
import 'package:videostreaming/widgets/profile%20widgets/SeeOtherUserProfiles.dart';

class Feature extends StatefulWidget {
  @override
  _FeatureState createState() => _FeatureState();
}

class _FeatureState extends State<Feature> {
  List UsersLive = [
    {
      'name': 'John Doe',
      'rank': 1,
      'views': 1625,
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.explicit.bing.net%2Fth%3Fid%3DOIP.-l7U8CSRm-8TQ2TfM5SaeQHaKE%26pid%3DApi&f=1',
      'friends': [],
      'fans': [],
      'following': [],
      'id': '1234560',
    },
    {
      'name': 'Sara Dane',
      "rank": 2,
      'views': 1253,
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.jmreEH6yJdq8upJAWyOOqAHaJY%26pid%3DApi&f=1',
      'friends': [],
      'fans': [],
      'following': [],
      'id': '1234569',
    },
    {
      'name': 'Scarlett',
      'rank': 3,
      'views': 1542,
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.CLhTP-UgIxS855hdQ-aMJAHaHd%26pid%3DApi&f=1',
      'friends': [],
      'fans': [],
      'following': [],
      'id': '1234568',
    },
    {
      'name': 'Jane Austen',
      'rank': 4,
      'views': 1765,
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.-QTqxxcZT08TlxjxaFvuhQHaE7%26pid%3DApi&f=1',
      'friends': [],
      'fans': [],
      'following': [],
      'id': '1234567',
    },
  ];

  void showOtherUserProfile(
    BuildContext ctx,
    String photo,
    String name,
    int rank,
    int views,
    String id,
    List fans,
    List following,
    List friends,
  ) {
    showModalBottomSheet(
      context: ctx,
      builder: (s) {
        return OtherUserProfile(
          fans: fans,
          following: following,
          friends: friends,
          id: id,
          name: name,
          photo: photo,
          rank: rank,
          views: views,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Center(
            child: Container(
              padding: EdgeInsets.only(
                top: 0,
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
            child: StreamBuilder(
                stream: Firestore.instance.collection('Users').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return GridView(
                    children: [
                      for (var i = 0; i < snapshot.data.documents.length; i++)
                        if (snapshot.data.documents[i].data()['live'] == true)
                          LiveUserTile(
                            name: snapshot.data.documents[i].data()['fullname'],
                            photo:
                                snapshot.data.documents[i].data()['profilepic'],
                            rank: snapshot.data.documents[i].data()['rank'],
                            views: snapshot.data.documents[i].data()['views'],
                            onTap: showOtherUserProfile,
                            fans: snapshot.data.documents[i].data()['fans'],
                            following:
                                snapshot.data.documents[i].data()['following'],
                            friends:
                                snapshot.data.documents[i].data()['friends'],
                            id: snapshot.data.documents[i].data()['ide'],
                          ),
                    ],
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 1.5,  
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                      
                    ),
                  );
                },),),
      ),
    );
  }
}
