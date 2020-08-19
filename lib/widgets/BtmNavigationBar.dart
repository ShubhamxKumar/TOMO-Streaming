import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BtmNavigationBar extends StatefulWidget {
  final Function onTap;
  final int selectedScreenIndex;
  BtmNavigationBar({this.onTap, this.selectedScreenIndex});
  @override
  _BtmNavigationBarState createState() => _BtmNavigationBarState();
}

class _BtmNavigationBarState extends State<BtmNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      iconSize: 28,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black.withOpacity(0.2),
      selectedItemColor: Color(0xff6950FB),
      selectedLabelStyle: TextStyle(
        fontSize: 14,
      ),
      currentIndex: widget.selectedScreenIndex,
      
      onTap: widget.onTap,
      items: [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.home),
          title: SizedBox.shrink(),
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.solidHeart),
          title: SizedBox.shrink(),
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff6950FB),
                  Color(0xffB83AF3),
                ],
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/splash_icon.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: SizedBox.shrink(),
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.facebookMessenger),
          title: SizedBox.shrink(),
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: SizedBox.shrink(),
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}
