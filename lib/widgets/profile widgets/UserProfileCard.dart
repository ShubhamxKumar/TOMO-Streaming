import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videostreaming/providers/UserProvider.dart';

class UserProfileCard extends StatefulWidget {
  final String name;
  final String uid;
  final String id;
  final String photo;
  final int rank;
  final int views;
  final List fans;
  final List friends;
  final int wallet;
  final List following;
  UserProfileCard({
    this.fans,
    this.friends,
    this.name,
    this.uid,
    this.photo,
    this.rank,
    this.views,
    this.wallet,
    this.following,
    this.id,
  });
  @override
  _UserProfileCardState createState() => _UserProfileCardState();
}

class _UserProfileCardState extends State<UserProfileCard> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 50,
      ),
      child: Card(
        elevation: 9,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  transform: Matrix4.translationValues(0.0, -65.0, 0.0),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(widget.photo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                '${widget.name}',
                style: TextStyle(
                  fontFamily: 'fontbold',
                  color: Colors.black,
                  fontSize: 23,
                ),
              ),
              Text(
                'ID: ${widget.id}',
                style: TextStyle(
                  fontFamily: 'font',
                  color: Colors.black.withOpacity(0.3),
                  fontSize: 15,
                ),
              ),
              FlatButton(
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  try {
                    var res = await FirebaseAuth.instance.signOut();
                    Provider.of<UserProvider>(context, listen: false)
                        .clearUserInfo();
                  } catch (err) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text(err.message),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  _isLoading = false;
                                });
                              },
                              child: Text('OK'),
                            )
                          ],
                        );
                      },
                    );
                  }
                },
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text(
                        'Logout',
                        style: TextStyle(
                          fontFamily: 'font',
                          color: Color(0xff6950FB),
                          fontSize: 20,
                        ),
                      ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1.5,
                color: Colors.black.withOpacity(0.2),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'FRIENDS',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.3),
                            fontFamily: 'fontbold',
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '${widget.friends.length}',
                          style: TextStyle(
                            fontFamily: 'fontbold',
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'FOLLOWING',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.3),
                            fontFamily: 'fontbold',
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '${widget.following.length}',
                          style: TextStyle(
                            fontFamily: 'fontbold',
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'FANS',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.3),
                            fontFamily: 'fontbold',
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '${widget.fans.length}',
                          style: TextStyle(
                            fontFamily: 'fontbold',
                            color: Colors.black,
                            fontSize: 20,
                          ),
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
}
