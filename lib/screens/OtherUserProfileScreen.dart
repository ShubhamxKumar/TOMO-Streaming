import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:videostreaming/providers/UserProvider.dart';
import 'package:videostreaming/widgets/DataDisplayWidget.dart';

class OtherUserProfileScreen extends StatefulWidget {
  final String photo;
  final String name;
  final int rank;
  final int views;
  final String id;
  final List fans;
  final List following;
  final List friends;
  OtherUserProfileScreen({
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
  _OtherUserProfileScreenState createState() => _OtherUserProfileScreenState();
}

class _OtherUserProfileScreenState extends State<OtherUserProfileScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);

    // var isFollowing = user.getfollowing.contains(receivedObject["id"]);
    // print(isFollowing);
    bool isFollowing = false;

    user.getfollowing.forEach((element) {
      if (element["id"] == widget.id) {
        print("HII1");
        isFollowing = true;
      }
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              '${widget.name}',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'fontbold',
              ),
            ),
            Text(
              'ID: ${widget.id}',
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'font',
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.photo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 7,
                child: Container(
                  padding: EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Live Status : ',
                        style: TextStyle(
                          fontFamily: 'fontbold',
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      Lottie.network(
                        'https://assets2.lottiefiles.com/packages/lf20_bXjlL4.json',
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.2,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  DataDisplayWidget(
                    label: 'Fans',
                    color: Colors.red,
                    icon: Icons.group,
                    value: widget.fans.length,
                  ),
                  DataDisplayWidget(
                    label: 'Friends',
                    color: Colors.amber,
                    icon: Icons.group_add,
                    value: widget.friends.length,
                  ),
                  DataDisplayWidget(
                    label: 'Following',
                    color: Colors.red,
                    icon: Icons.people,
                    value: widget.following.length,
                  ),
                  DataDisplayWidget(
                    label: 'Views',
                    color: Colors.green,
                    icon: Icons.panorama_fish_eye,
                    value: widget.views,
                  ),
                  DataDisplayWidget(
                    label: 'Rank',
                    color: Colors.blueAccent,
                    value: widget.rank,
                    icon: Icons.graphic_eq,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                                        color:
                                            loading ? Colors.grey : Colors.red,
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
                FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.envelope,
                        size: 17,
                        color: Colors.grey,
                      ),
                      Text(
                        'Message',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontFamily: 'font',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
