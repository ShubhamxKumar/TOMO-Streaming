import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:videostreaming/providers/UserProvider.dart';
import 'package:videostreaming/screens/HomeScreen.dart';
import 'package:videostreaming/screens/LoginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:videostreaming/screens/SplashScreen.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        home: StreamBuilder(
          builder: (ctx, stream) {
            if (stream.hasData) {
              return HomeScreen();
            } else {
              return LoginScreen();
            }
          },
          stream: FirebaseAuth.instance.onAuthStateChanged,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
