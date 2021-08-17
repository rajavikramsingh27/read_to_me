

import 'package:flutter/material.dart';
import 'package:read_to_me/Registration/LoginTypes.dart';
import 'package:firebase_auth/firebase_auth.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds:2),() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginTypes()),
      );
    });

  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                Colors.orange,
              ]
          )
      ),
    );
  }
}
