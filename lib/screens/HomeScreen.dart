import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:videostreaming/providers/UserProvider.dart';
import 'package:videostreaming/screens/BottomNavigationScreens/Favorite.dart';
import 'package:videostreaming/screens/BottomNavigationScreens/Home.dart';
import 'package:videostreaming/screens/BottomNavigationScreens/Messages.dart';
import 'package:videostreaming/screens/BottomNavigationScreens/Profile.dart';
import 'package:videostreaming/screens/TestScreen.dart';
import 'package:videostreaming/widgets/BtmNavigationBar.dart';

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
        bottomNavigationBar: SizedBox(
          height: 65,
          child: BtmNavigationBar(
            onTap: _selectedScreen,
            selectedScreenIndex: _selectedScreenIndex,
          ),
        ),
        body: _screens[_selectedScreenIndex],
      ),
    );
  }
}
