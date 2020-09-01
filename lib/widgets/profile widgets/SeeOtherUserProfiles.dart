import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videostreaming/providers/UserProvider.dart';
import 'package:videostreaming/screens/OtherUserProfileScreen.dart';

class OtherUserProfile extends StatefulWidget {
  final String photo;
  final String name;
  final int rank;
  final int views;
  final String id;
  final List fans;
  final List following;
  final List friends;
  OtherUserProfile({
    this.name,
    this.photo,
    this.rank,
    this.views,
    this.fans,
    this.following,
    this.id,
    this.friends,
  });
  @override
  _OtherUserProfileState createState() => _OtherUserProfileState();
}

class _OtherUserProfileState extends State<OtherUserProfile> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    bool isFollowing = false;

    user.getfollowing.forEach((element) {
      if (element["id"] == widget.id) {
        isFollowing = true;
      }
    });
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(widget.photo),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget.name}',
                    style: TextStyle(
                      fontFamily: 'fontbold',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'ID : ${widget.id}',
                    style: TextStyle(
                      fontFamily: 'font',
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '${widget.fans.length}',
                        style: TextStyle(
                          fontFamily: 'fontbold',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Fans',
                        style: TextStyle(
                          fontFamily: 'font',
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '${widget.following.length}',
                        style: TextStyle(
                          fontFamily: 'fontbold',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Following',
                        style: TextStyle(
                          fontFamily: 'font',
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '${widget.friends.length}',
                        style: TextStyle(
                          fontFamily: 'fontbold',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Friends',
                        style: TextStyle(
                          fontFamily: 'font',
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey[300],
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Rank : ',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'fontbold',
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        '${widget.rank}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'font',
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Views : ',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'fontbold',
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        '${widget.views}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'font',
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Bio : ',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'fontbold',
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'This is your sample bio.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'font',
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              OtherUserProfileScreen(
                            fans: widget.fans,
                            following: widget.following,
                            friends: widget.friends,
                            id: widget.id,
                            name: widget.name,
                            photo: widget.photo,
                            rank: widget.rank,
                            views: widget.views,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontFamily: 'fontbold',
                        color: Colors.black,
                        fontSize: 16.5,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: isFollowing
                        ? () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('ALert'),
                                  content: Text(
                                      'You already follow this person. Do you wish to unfollow him/her?'),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () async {
                                        setState(() {
                                          loading = false;
                                        });
                                        setState(() {
                                          loading = true;
                                        });
                                        try {
                                          user
                                              .deleteFollowing(
                                                  widget.name, widget.id)
                                              .then((s) {
                                            setState(() {
                                              loading = false;
                                            });
                                            Navigator.of(context).pop();
                                          });
                                        } catch (err) {
                                          print(err.message);
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      child: Text(
                                        'UnFollow',
                                        style: TextStyle(
                                          fontFamily: 'fontbold',
                                          color: loading
                                              ? Colors.grey
                                              : Colors.red,
                                        ),
                                      ),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        setState(() {
                                          loading = false;
                                        });
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                          fontFamily: 'font',
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        : () async {
                            setState(() {
                              loading = true;
                            });
                            user.addFollowing(widget.name, widget.id).then((s) {
                              setState(() {
                                loading = false;
                              });
                            });
                          },
                    child: isFollowing
                        ? Text(
                            'Following',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontFamily: 'fontbold',
                            ),
                          )
                        : Text(
                            '+Follow',
                            style: TextStyle(
                              color: loading ? Colors.grey : Colors.red,
                              fontSize: 18,
                              fontFamily: 'fontbold',
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              child: FlatButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.report_problem,
                      color: Colors.grey,
                      size: 17,
                    ),
                    Text(
                      ' Report this user.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
