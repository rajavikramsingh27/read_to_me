

import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:read_to_me/Emailscreen.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:read_to_me/Registration/ChooseYourLanguage.dart';
import 'package:read_to_me/TabbarScreens/BottomNavBar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;


class LoginTypes extends StatefulWidget {
  @override
  _LoginTypesState createState() => _LoginTypesState();
}

class _LoginTypesState extends State<LoginTypes> {

  alreadyHaveAnAccount() {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 20,right: 20),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SafeArea(
          child: Container(
            height: 230,
            child: Column(
              children: [
                SizedBox(height: 30,),
                Text(
                  'To save your progress, sign up in',
                  style:TextStyle(
                      fontFamily: 'times new roman',
                      color:Colors.black,
                      fontSize:16
                  ),
                ),
                Text(
                  'one of the ways',
                  style:TextStyle(
                      fontFamily: 'times new roman',
                      color:Colors.black,
                      fontSize:18
                  ),
                ),
                SizedBox(height: 40,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container (
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color:HexColor('#3b5998'),
                          borderRadius:BorderRadius.circular(3),
                        ),
                        alignment: Alignment.center,
                        child: FlatButton(
                          minWidth: double.infinity,
                          height: double.infinity,
                          padding: EdgeInsets.zero,
                          child: Image.asset(
                            'facebook.png',
                            width:22,
                            height:22,
                          ),

                          onPressed: () {

                          },
                        )
                    ),
                    SizedBox (width: 6,),
                    Container (
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius:BorderRadius.circular(3),
                        ),
                        alignment: Alignment.center,
                        child: FlatButton(
                          minWidth: double.infinity,
                          height: double.infinity,
                          padding: EdgeInsets.zero,
                          child: Image.asset(
                            'search.png',
                            width:20,
                            height:20,
                          ),

                          onPressed: () async {
                            Navigator.pop(context);

                            GoogleSignInAccount googleSignIn;
                            googleSignIn = await GoogleSignIn().signIn();
                            googleSignIn.email.toString().showMessage(context, true);

                            apiUserCreate();
                          },

                        )
                    ),
                    SizedBox (width: 6,),
                    Container (
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius:BorderRadius.circular(3),
                        ),
                        alignment: Alignment.center,
                        child: FlatButton(
                          minWidth: double.infinity,
                          height: double.infinity,
                          padding: EdgeInsets.zero,
                          child: Image.asset(
                            'apple.png',
                            width:20,
                            height:20,
                          ),

                          onPressed: () {

                          },
                        )
                    ),
                    SizedBox (width: 6,),
                    Container (
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius:BorderRadius.circular(3),
                        ),
                        alignment: Alignment.center,
                        child: FlatButton(
                          minWidth: double.infinity,
                          height: double.infinity,
                          padding: EdgeInsets.zero,
                          child: Image.asset(
                            'envelope.png',
                            width:20,
                            height:20,
                          ),

                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Emailscreen()),
                            );
                            // Emailscreen
                          },
                        )
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  margin:EdgeInsets.only(left:20, right:20),
                  child:Text(
                    'By continuing you accept our privacy Policy and Terms of Use.',
                    textAlign: TextAlign.center,
                    style:TextStyle(
                        fontFamily: 'times new roman',
                        color:Colors.black,
                        fontSize:12
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  apiUserCreate() async {
    // showLoader(context);
    print(kBaseURL+"user/create");

    var response = await http.post(
        Uri.parse(kBaseURL+"user/create"),
        body: {
          "email":"googleSignIn.email",
          "name": "googleSignIn.displayName"
        }
    );

    //     .then((value) {
    //   Navigator.pop(context);

      print(response.statusCode);
      print(response.body);

//       Future.delayed(Duration(seconds: 3), () {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => Emailscreen()),
//   );
// });
    // })

    //     .catchError((error) {
    //   Navigator.pop(context);
    //
    //   print(error);
    //   error.toString().showMessage(context, true);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color:Colors.white,
                            width: 5
                        )
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'student.png',
                      height:74,
                    )
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'READ TO ME',
                  style:TextStyle(
                      fontFamily: 'times new roman',
                      color:Colors.black,
                      fontSize:30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'The most fun way to',
                  style:TextStyle(
                      fontFamily: 'times new roman',
                      color:Colors.white,
                      fontSize:25
                  ),
                ),
                Text(
                  'learn languages',
                  style:TextStyle(
                      fontFamily: 'times new roman',
                      color:Colors.white,
                      fontSize:25
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: FlatButton(
                    minWidth: double.infinity,
                    height:  double.infinity,
                    child: Text(
                      'Already have an account',
                      style:TextStyle(
                          fontFamily: 'times new roman',
                          color:Colors.white,
                          fontSize:16
                      ),
                    ),
                    onPressed: () {
                      alreadyHaveAnAccount();
                    },
                  ),
                  width:240,
                  height:44,
                  decoration:BoxDecoration(
                    color:Colors.blueGrey.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Terms of Service and Privacy Policy',
                  style:TextStyle(
                      fontFamily: 'times new roman',
                      color:Colors.white,
                      fontSize:16
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  width:320,
                  height:50,
                  decoration:BoxDecoration(
                    color:Colors.yellow,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: FlatButton(
                    minWidth:double.infinity,
                    height:double.infinity,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChooseYourLanguage()),
                      );
                    },
                    child:Text(
                      'Continue',
                      style:TextStyle(
                          fontFamily: 'times new roman',
                          color:Colors.black,
                          fontSize:16
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  width:320,
                  height:50,
                  decoration:BoxDecoration(
                    // color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color:Colors.white,
                          width: 1
                      )
                  ),
                  child: FlatButton(
                    minWidth:double.infinity,
                    height:double.infinity,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavBar()),
                      );
                    },
                    child:Text(
                      'Skip for Start To Read',
                      style:TextStyle(
                          fontFamily: 'times new roman',
                          color:Colors.white,
                          fontSize:16
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}




