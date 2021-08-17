


import 'package:flutter/material.dart';
import 'package:read_to_me/DemoFile/Api%20Demo.dart';
import 'package:read_to_me/DemoFile/Demopage.dart';
import 'package:read_to_me/DemoFile/GridView.dart';
import 'package:read_to_me/Registration/ChooseYourLanguage.dart';
import 'package:read_to_me/DemoFile/Search.dart';
import 'package:read_to_me/SplashScreen.dart';
import 'package:flutter/services.dart';
import 'package:read_to_me/DemoFile/DemoScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


// Choose your language
// Select you age
// Choose your level
// Choose your category
// Set Reminder with time and email
// Select your subscription



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ChooseYourLanguage(),

      home: SplashScreen()
    );
  }
}



asdsafs() {
  return ElevatedButton.styleFrom(
  padding: EdgeInsets.zero,
  alignment: Alignment.centerRight,
  onPrimary: Colors.white,
  primary: Colors.transparent,
  onSurface: Colors.grey,
  elevation: 0,
  );
}


// Favorites2 ka naam change krna h
// Basicspanish --> BasicSpanish