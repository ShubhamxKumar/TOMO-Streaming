import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:videostreaming/providers/UserProvider.dart';
import 'package:videostreaming/screens/BottomNavigationScreens/Favorite.dart';
import 'package:videostreaming/screens/BottomNavigationScreens/Home.dart';
import 'package:videostreaming/screens/BottomNavigationScreens/Messages.dart';
import 'package:videostreaming/screens/BottomNavigationScreens/Profile.dart';
import 'package:videostreaming/screens/TestScreen.dart';
import 'package:videostreaming/widgets/BtmNavigationBar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var index = 0;
  @override
  void didChangeDependencies() {
    if (index == 0) {
      Provider.of<UserProvider>(context, listen: false).loadUser();
      index++;
    } else {
      return;
    }
    super.didChangeDependencies();
  }

  int _selectedScreenIndex = 0;
  void _selectedScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    final List<Widget> _screens = [
      Home(),
      Favorite(),
      TestScreen(),
      Messages(),
      Profile(),
    ];
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          items: [
            FaIcon(
              FontAwesomeIcons.home,
              color: _selectedScreenIndex == 0 ? Colors.white : Colors.black,
            ),
            FaIcon(
              FontAwesomeIcons.solidHeart,
              color: _selectedScreenIndex == 1 ? Colors.white : Colors.black,
            ),
            Container(
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
            FaIcon(
              FontAwesomeIcons.facebookMessenger,
              color: _selectedScreenIndex == 3 ? Colors.white : Colors.black,
            ),
            Icon(
              Icons.person,
              color: _selectedScreenIndex == 4 ? Colors.white : Colors.black,
            ),
          ],
          onTap: (value) {
            setState(
              () {
                print(value);
                _selectedScreenIndex = value;
              },
            );
          },
          buttonBackgroundColor: Color(0xff6950FB),
          backgroundColor: Colors.white,
          color: Colors.white,
          animationDuration: Duration(
            milliseconds: 500,
          ),
        ),
        body: _screens[_selectedScreenIndex],
      ),
    );
  }
}
