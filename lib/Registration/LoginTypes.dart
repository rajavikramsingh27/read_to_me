

import 'dart:convert';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:read_to_me/Emailscreen.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:read_to_me/Registration/ChooseYourLanguage.dart';
import 'package:read_to_me/TabbarScreens/BottomNavBar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


class LoginTypes extends StatefulWidget {
  @override
  _LoginTypesState createState() => _LoginTypesState();
}

class _LoginTypesState extends State<LoginTypes> {
  loginFaceBook() async {
    FacebookLogin facebookSignIn = new FacebookLogin();
    FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        final token = result.accessToken.token;

        final urlFB = Uri.parse('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
        final reponse = await http.get(urlFB).catchError((error) {
          print(error.message);
        });
        final dictResponse = Map<String, dynamic>.from(jsonDecode(reponse.body));

        final param = {'email': dictResponse['email'].toString(), 'name': dictResponse['displayName'].toString()};

        apiUserAll(context, param);

        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  alreadyHaveAnAccount() {
    showModalBottomSheet(
        context: context,
        backgroundColor:Colors.transparent,
        builder: (context) {
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
                                  loginFaceBook();
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
                                  GoogleSignInAccount googleSignIn;
                                  googleSignIn = await GoogleSignIn().signIn();

                                  final email = googleSignIn.email;
                                  final displayName = googleSignIn.displayName;

                                  final param = {'email': email, 'name': displayName};

                                  apiUserAll(context, param);
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
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
                          'Sign In with account',
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
                    // SizedBox(
                    //   height: 30,
                    // ),
                    // Container(
                    //   alignment: Alignment.center,
                    //   width:320,
                    //   height:50,
                    //   decoration:BoxDecoration(
                    //     color:Colors.yellow,
                    //     borderRadius: BorderRadius.circular(50),
                    //   ),
                    //   child: FlatButton(
                    //     minWidth:double.infinity,
                    //     height:double.infinity,
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(builder: (context) => ChooseYourLanguage()),
                    //       );
                    //     },
                    //     child:Text(
                    //       'Continue',
                    //       style:TextStyle(
                    //           fontFamily: 'times new roman',
                    //           color:Colors.black,
                    //           fontSize:16
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
        ),
        onWillPop:() {return;});
  }
}





apiUserCreate(context, Map<String, String> param) async {
  showLoader(context);
  var response = await http.post(
      Uri.parse(kBaseURL+"user/create"),
      body: param
      // {'email': email, 'name': name}
  );

  Navigator.pop(context);

  if (response.statusCode == 200) {
    final dictResponse = Map<String, dynamic>.from(jsonDecode(response.body));
    kUserID = dictResponse['id'].toString();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChooseYourLanguage()),
    );
  }
}

apiUserAll(context, Map<String, String> param) async {
  int isExist = 0;

  showLoader(context);
  final response = await http.get(Uri.parse(kBaseURL+'user/all'));
  Navigator.pop(context);

  if (response.statusCode == 200) {
    final arrResponse = List<Map<String, dynamic>>.from(jsonDecode(response.body));

    for (int i = 0; i<arrResponse.length; i++) {
      print(arrResponse[i]['email'].toString());
      if (arrResponse[i]['email'].toString() == param['email'].toString()) {
        kUserID = arrResponse[i]['id'].toString();
        isExist = 1;
        break;
      } else {
        isExist = 0;
      }
    }

    if (int.parse(isExist.toString()) == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBar()),
      );
    } else {
      apiUserCreate(context, param);
    }
  }
}
