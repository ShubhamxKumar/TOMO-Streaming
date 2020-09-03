import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:videostreaming/providers/UserProvider.dart';
import 'package:videostreaming/screens/NoEmailScreen.dart';
import 'package:videostreaming/screens/UpdateProfileScreen.dart';
import 'package:videostreaming/widgets/profile%20widgets/LongCardButtons.dart';
import 'package:videostreaming/widgets/profile%20widgets/UserProfileCard.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return (user.getLoading)
        ? SafeArea(
            child: Scaffold(
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
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
                child: Column(
                  children: [
                    Lottie.network(
                      'https://assets2.lottiefiles.com/datafiles/bEYvzB8QfV3EM9a/data.json',
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.1,
                      fit: BoxFit.cover,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
          )
        : (user.getEmail == null || user.getEmail.isEmpty)
            ? NoEmailScreen()
            : Scaffold(
                  body: Container(
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xff6950FB),
                                Color(0xffB83AF3),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.elliptical(
                                  MediaQuery.of(context).size.width * 0.5, 60),
                              bottomRight: Radius.elliptical(
                                  MediaQuery.of(context).size.width * 0.5, 60),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.25,
                        ),
                        Container(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: IconButton(
                                        icon: FaIcon(
                                          FontAwesomeIcons.userEdit,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  UpdateProfileScreen(),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                Center(
                                  child: UserProfileCard(
                                    fans: user.getfans,
                                    following: user.getfollowing,
                                    friends: user.getfriends,
                                    name: user.getUserName,
                                    uid: user.getUid,
                                    id: user.getId,
                                    photo: user.getphoto,
                                    rank: user.getrank,
                                    views: user.getviews,
                                    wallet: user.getwallet,
                                  ),
                                ),
                                Center(
                                  child: Card(
                                    elevation: 9,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      margin: EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      child: Column(
                                        children: [
                                          LongCardButtons(
                                            icon: FontAwesomeIcons
                                                .solidPlayCircle,
                                            label: 'My Live Stream',
                                            iconColor: Colors.red,
                                          ),
                                          LongCardButtons(
                                            icon: FontAwesomeIcons
                                                .facebookMessenger,
                                            label: 'Messages',
                                            iconColor:
                                                Colors.blue.withOpacity(0.9),
                                          ),
                                          LongCardButtons(
                                            icon: Icons.group,
                                            label: 'Groups',
                                            iconColor: Colors.purple,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Card(
                                    elevation: 9,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      margin: EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      child: Column(
                                        children: [
                                          LongCardButtons(
                                            icon: FontAwesomeIcons.wallet,
                                            label: 'Wallet',
                                            iconColor: Colors.orange,
                                          ),
                                          LongCardButtons(
                                            icon: Icons.graphic_eq,
                                            label: 'My Level',
                                            iconColor:
                                                Colors.blue.withOpacity(0.9),
                                          ),
                                          LongCardButtons(
                                            icon: Icons.people,
                                            label: 'Find Friends',
                                            iconColor: Colors.green,
                                          ),
                                          LongCardButtons(
                                            icon: Icons.list,
                                            label: 'BlackList',
                                            iconColor: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
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
