

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:read_to_me/Registration/LoginTypes.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  var isAdultContent = false;
  var isSoundsEffect = false;
  var isDownloadsOverTheCellular = false;

  String languageSelected = 'English';
  String levelSelected = 'Beginner';

  Map<String, dynamic> dictAppDetails = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      app_details();
    });
  }

  app_details() async {
    showLoader(context);
    var url = Uri.parse(kBaseURL+'app_details');
    final response = await http.get(
      url,
    );

    Navigator.pop(context);

    if (response.statusCode == 200) {
      final resbody = jsonDecode(response.body);
      dictAppDetails = Map<String, dynamic>.from(resbody);

      setState(() {

      });
    }
  }

  apiUserUpdate(Map<String, String> param) async {
    showLoader(context);

    final paramID = {'id':kUserID,};

    final params = {};
    params.addAll(paramID);
    params.addAll(param);

    final response = await http.put(
        Uri.parse(kBaseURL+'user'),
        body: params
    );

    Navigator.pop(context);

    if(response.statusCode == 200) {
      final dictResponse = Map<String, dynamic>.from(jsonDecode(response.body));
      dictResponse['message'].toString().showMessage(context, false);
    } else {
      'Error! \nSomething Went Wrong!'.showMessage(context, true);
    }
  }

  levelLanguageSetState(String level) {
    levelSelected = level;

    setState(() {

    });

    Navigator.pop(context);
    apiUserUpdate({'level': level,});
  }

  levelLanguage() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            margin: EdgeInsets.only(left: 20,right: 20),
            decoration: BoxDecoration(
                color: HexColor(bg_SecondColor),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
            ),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Text(
                  'Language Level',
                  style:TextStyle(
                    fontFamily: 'times new roman',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.only(
                      left: 40, right: 40
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.white,
                              width: 1
                          )
                      )
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      primary: Colors.transparent,
                      onSurface: Colors.grey,
                      elevation: 0,
                    ),
                    child:Text(
                      'Beginner',
                      style:TextStyle(
                        fontFamily: 'times new roman',
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onPressed: () {
                      levelLanguageSetState('Beginner');
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(
                      left: 40, right: 40
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.white,
                              width: 1
                          )
                      )
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      primary: Colors.transparent,
                      onSurface: Colors.grey,
                      elevation: 0,
                    ),
                    child:Text(
                      'Intermediate',
                      style:TextStyle(
                        fontFamily: 'times new roman',
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onPressed: () {
                      levelLanguageSetState('Intermediate');
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(
                      left: 40, right: 40
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.white,
                              width: 1
                          )
                      )
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      primary: Colors.transparent,
                      onSurface: Colors.grey,
                      elevation: 0,
                    ),
                    child:Text(
                      'Advanced',
                      style:TextStyle(
                        fontFamily: 'times new roman',
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onPressed: () {
                      levelLanguageSetState('Advanced');
                    },
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          );
        }
    );
  }

  nativeLanguageSetState(String language) {
    languageSelected = language;

    setState(() {

    });

    Navigator.pop(context);
    apiUserUpdate({'language': language,});
  }

  nativeLanguage() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: 360,
            margin: EdgeInsets.only(left: 20,right: 20),
            decoration: BoxDecoration(
                color: HexColor(bg_SecondColor),
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
            ),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Text(
                  'Native Language',
                  style:TextStyle(
                    fontFamily: 'times new roman',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.only(
                    left: 40, right: 40
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white,
                        width: 1
                      )
                    )
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      primary: Colors.transparent,
                      onSurface: Colors.grey,
                      elevation: 0,
                    ),
                    child:Text(
                      'English',
                      style:TextStyle(
                        fontFamily: 'times new roman',
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onPressed: () {
                      nativeLanguageSetState('English');
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(
                      left: 40, right: 40
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.white,
                              width: 1
                          )
                      )
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      primary: Colors.transparent,
                      onSurface: Colors.grey,
                      elevation: 0,
                    ),
                    child:Text(
                      'Spanish',
                      style:TextStyle(
                        fontFamily: 'times new roman',
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onPressed: () {
                      nativeLanguageSetState('Spanish');
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(
                      left: 40, right: 40
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.white,
                              width: 1
                          )
                      )
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      primary: Colors.transparent,
                      onSurface: Colors.grey,
                      elevation: 0,
                    ),
                    child:Text(
                      'Portugees',
                      style:TextStyle(
                        fontFamily: 'times new roman',
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onPressed: () {
                      nativeLanguageSetState('Portugees');
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(
                      left: 40, right: 40
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.white,
                              width: 1
                          )
                      )
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      primary: Colors.transparent,
                      onSurface: Colors.grey,
                      elevation: 0,
                    ),
                    child:Text(
                      'French',
                      style:TextStyle(
                        fontFamily: 'times new roman',
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onPressed: () {
                      nativeLanguageSetState('French');
                    },
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          );
        }
    );
  }

  logOut() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            margin: EdgeInsets.only(left: 20,right: 20),
            decoration: BoxDecoration(
                color: HexColor(bg_SecondColor),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
            ),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Text(
                  'Are You Sure?',
                  style:TextStyle(
                    fontFamily: 'times new roman',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Do you want to log out ?',
                  style:TextStyle(
                    fontFamily: 'times new roman',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child:Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 40, right: 40
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.transparent,
                              onSurface: Colors.grey,
                              elevation: 0,
                            ),
                            child:Text(
                              'Log Out',
                              style:TextStyle(
                                fontFamily: 'times new roman',
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginTypes()
                                  )
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 40, right: 40
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.transparent,
                              onSurface: Colors.grey,
                              elevation: 0,
                            ),
                            child:Text(
                              'Cancel',
                              style:TextStyle(
                                fontFamily: 'times new roman',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          width:MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
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
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    'Settings',
                    style:TextStyle(
                      fontFamily: 'times new roman',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: heightContainer(context),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      bottom:20,
                    ),
                    child: Column(
                      children: [
                        // SizedBox(height: 40,),
                        // Container(
                        //   height: 54,
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(4),
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Image.asset(
                        //         'crown.png',
                        //         width:24,
                        //         height:24,
                        //       ),
                        //       SizedBox(width: 10,),
                        //       Text(
                        //         'Start a free trial',
                        //         style:TextStyle(
                        //           fontFamily: 'times new roman',
                        //           color:Colors.black,
                        //           fontSize: 16,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        SizedBox(height: 16,),

                        Container(
                            height: 50,
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Colors.white.withOpacity(0.5)
                                    )
                                )
                            ),
                            child:FlatButton(
                              minWidth: double.infinity,
                              padding: EdgeInsets.zero,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Leave Your Review',
                                    style:TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'times new roman',
                                      color:Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Platform.isIOS
                                    ? launch(dictAppDetails['appStore'].toString())
                                    : launch(dictAppDetails['playStore'].toString());
                              },
                            )
                        ),

                        Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Colors.white.withOpacity(0.5)
                                    )
                                )
                            ),
                            child: Column(
                              children: [
                                FlatButton(
                                  padding: EdgeInsets.zero,
                                  minWidth: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container (
                                              width: 26,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                color: HexColor('#3b5998'),
                                                borderRadius:BorderRadius.circular(3),
                                              ),
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                'facebook.png',
                                                width:15,
                                                height:15,
                                              ),
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            'Visit Facebook Page',
                                            style:TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'times new roman',
                                              color:Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    launch(dictAppDetails['fbPage'].toString());
                                  },
                                ),
                                FlatButton(
                                  minWidth: double.infinity,
                                  padding: EdgeInsets.zero,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'instagram.png',
                                            width: 26,
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            'Visit Instagram',
                                            style:TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'times new roman',
                                              color:Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ],
                                  ),

                                  onPressed: () {
                                    launch(dictAppDetails['instagram'].toString());
                                  },
                                ),
                                FlatButton(
                                  padding: EdgeInsets.zero,
                                  minWidth: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'youtube.png',
                                            width: 26,
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            'Visit YouTube Channel',
                                            style:TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'times new roman',
                                              color:Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ],
                                  ),

                                  onPressed: () {
                                    launch(dictAppDetails['youTubeChannel'].toString());
                                  },
                                ),
                              ],
                            )
                        ),

                        FlatButton(
                          padding: EdgeInsets.zero,
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Colors.white.withOpacity(0.5)
                                    )
                                )
                            ),
                            child: Text(
                              'Share',
                              textAlign: TextAlign.left,
                              style:TextStyle(
                                fontSize: 16,
                                fontFamily: 'times new roman',
                                color:Colors.white,
                              ),
                            ),
                          ),
                          onPressed: () {
                            final appStore = dictAppDetails['appStore'].toString();
                            final playStore = dictAppDetails['playStore'].toString();

                            Share.share('To download for iPhone visit here:- $appStore, '
                                '\n\nTo download for iPhone visit here:-  $playStore'
                            );
                          },
                        ),

                        // FlatButton(
                        //   padding: EdgeInsets.zero,
                        //   child: Container(
                        //     height: 50,
                        //     width: MediaQuery.of(context).size.width,
                        //     alignment: Alignment.centerLeft,
                        //     decoration: BoxDecoration(
                        //         border: Border(
                        //             bottom: BorderSide(
                        //                 width: 1,
                        //                 color: Colors.white.withOpacity(0.5)
                        //             )
                        //         )
                        //     ),
                        //     child: Text(
                        //       'Restore Purchases',
                        //       textAlign: TextAlign.left,
                        //       style:TextStyle(
                        //         fontSize: 16,
                        //         fontFamily: 'times new roman',
                        //         color:Colors.white,
                        //       ),
                        //     ),
                        //   ),
                        //
                        //   onPressed: () {
                        //
                        //   },
                        // ),

                        // Container(
                        //   decoration: BoxDecoration(
                        //       border: Border(
                        //           bottom: BorderSide(
                        //               width: 1,
                        //               color: Colors.white.withOpacity(0.5)
                        //           )
                        //       )
                        //   ),
                        //   child: Column(
                        //     children: [
                        //       FlatButton(
                        //         padding: EdgeInsets.zero,
                        //         child: Container(
                        //           height: 50,
                        //           width: MediaQuery.of(context).size.width,
                        //           alignment: Alignment.centerLeft,
                        //           child: Text(
                        //             'Name',
                        //             textAlign: TextAlign.left,
                        //             style:TextStyle(
                        //               fontSize: 16,
                        //               fontFamily: 'times new roman',
                        //               color:Colors.white,
                        //             ),
                        //           ),
                        //         ),
                        //
                        //         onPressed: () {
                        //
                        //         },
                        //       ),
                        //
                        //       FlatButton(
                        //         padding: EdgeInsets.zero,
                        //         child: Container(
                        //             width: MediaQuery.of(context).size.width,
                        //             alignment: Alignment.centerLeft,
                        //             child: Column(
                        //               mainAxisAlignment: MainAxisAlignment.start,
                        //               crossAxisAlignment: CrossAxisAlignment.start,
                        //               children: [
                        //                 Text(
                        //                   'Quick Sign Up',
                        //                   textAlign: TextAlign.left,
                        //                   style:TextStyle(
                        //                     fontSize: 16,
                        //                     fontFamily: 'times new roman',
                        //                     color:Colors.white,
                        //                   ),
                        //                 ),
                        //                 Text(
                        //                   'To save your progress, sign up via socail networks.',
                        //                   textAlign: TextAlign.left,
                        //                   style:TextStyle(
                        //                     fontSize: 12,
                        //                     fontFamily: 'times new roman',
                        //                     color:Colors.white.withOpacity(0.5),
                        //                   ),
                        //                 ),
                        //               ],
                        //             )
                        //         ),
                        //
                        //         onPressed: () {
                        //
                        //         },
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Colors.white.withOpacity(0.5)
                                    )
                                )
                            ),
                            child: Column(
                              children: [
                                // FlatButton(
                                //   padding: EdgeInsets.zero,
                                //   minWidth: double.infinity,
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Text(
                                //         'Learning Settings',
                                //         style:TextStyle(
                                //           fontSize: 16,
                                //           fontFamily: 'times new roman',
                                //           color:Colors.white,
                                //         ),
                                //       ),
                                //       Icon(
                                //         Icons.arrow_forward_ios_outlined,
                                //         color: Colors.white,
                                //         size: 20,
                                //       ),
                                //     ],
                                //   ),
                                //
                                //   onPressed: () {
                                //
                                //   },
                                // ),
                                // FlatButton(
                                //   padding: EdgeInsets.zero,
                                //   minWidth: double.infinity,
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Text(
                                //         'Library Settings',
                                //         style:TextStyle(
                                //           fontSize: 16,
                                //           fontFamily: 'times new roman',
                                //           color:Colors.white,
                                //         ),
                                //       ),
                                //       Icon(
                                //         Icons.arrow_forward_ios_outlined,
                                //         color: Colors.white,
                                //         size: 20,
                                //       ),
                                //     ],
                                //   ),
                                //
                                //   onPressed: () {
                                //
                                //   },
                                // ),
                                FlatButton(
                                  padding: EdgeInsets.zero,
                                  minWidth: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Native Language',
                                        style:TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'times new roman',
                                          color:Colors.white,
                                        ),
                                      ),
                                      Text(
                                        languageSelected,
                                        style:TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'times new roman',
                                          color:Colors.white.withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),

                                  onPressed: () {
                                    nativeLanguage();
                                  },
                                ),
                                FlatButton(
                                  padding: EdgeInsets.zero,
                                  minWidth: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Language Level',
                                        style:TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'times new roman',
                                          color:Colors.white,
                                        ),
                                      ),
                                      Text(
                                        levelSelected,
                                        style:TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'times new roman',
                                          color:Colors.white.withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),

                                  onPressed: () {
                                    levelLanguage();
                                  },
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Text(
                                //       'Adult Content',
                                //       style:TextStyle(
                                //         fontSize: 16,
                                //         fontFamily: 'times new roman',
                                //         color:Colors.white,
                                //       ),
                                //     ),
                                //     FlutterSwitch(
                                //       width: 80.0,
                                //       height: 40.0,
                                //       valueFontSize: 16.0,
                                //       toggleSize: 30.0,
                                //       borderRadius: 20.0,
                                //       padding: 10.0,
                                //       activeTextFontWeight: FontWeight.normal,
                                //       inactiveTextFontWeight: FontWeight.normal,
                                //       value: isAdultContent,
                                //       showOnOff: true,
                                //       onToggle: (val) {
                                //
                                //         isAdultContent = !isAdultContent;
                                //
                                //         setState(() {
                                //
                                //         });
                                //       },
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(height: 6),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Text(
                                //       'Sounds Effects',
                                //       style:TextStyle(
                                //         fontSize: 16,
                                //         fontFamily: 'times new roman',
                                //         color:Colors.white,
                                //       ),
                                //     ),
                                //     FlutterSwitch(
                                //       width: 80.0,
                                //       height: 40.0,
                                //       valueFontSize: 16.0,
                                //       toggleSize: 30.0,
                                //       borderRadius: 20.0,
                                //       padding: 10.0,
                                //       activeTextFontWeight: FontWeight.normal,
                                //       inactiveTextFontWeight: FontWeight.normal,
                                //       value: isSoundsEffect,
                                //       showOnOff: true,
                                //       onToggle: (val) {
                                //
                                //         isSoundsEffect = !isSoundsEffect;
                                //
                                //         setState(() {
                                //
                                //         });
                                //       },
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(height: 6),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Text(
                                //       'Downloads over the cellular',
                                //       style:TextStyle(
                                //         fontSize: 16,
                                //         fontFamily: 'times new roman',
                                //         color:Colors.white,
                                //       ),
                                //     ),
                                //     FlutterSwitch(
                                //       width: 80.0,
                                //       height: 40.0,
                                //       valueFontSize: 16.0,
                                //       toggleSize: 30.0,
                                //       borderRadius: 20.0,
                                //       padding: 10.0,
                                //       activeTextFontWeight: FontWeight.normal,
                                //       inactiveTextFontWeight: FontWeight.normal,
                                //       value: isDownloadsOverTheCellular,
                                //       showOnOff: true,
                                //       onToggle: (val) {
                                //
                                //         isDownloadsOverTheCellular = !isDownloadsOverTheCellular;
                                //
                                //         setState(() {
                                //
                                //         });
                                //       },
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(height: 16),
                              ],
                            )
                        ),

                        // FlatButton(
                        //   padding: EdgeInsets.zero,
                        //   child: Container(
                        //     height: 50,
                        //     alignment: Alignment.centerLeft,
                        //     width: MediaQuery.of(context).size.width,
                        //     decoration: BoxDecoration(
                        //         border: Border(
                        //             bottom: BorderSide(
                        //                 width: 1,
                        //                 color: Colors.white.withOpacity(0.5)
                        //             )
                        //         )
                        //     ),
                        //     child: Text(
                        //       'Attempt Test',
                        //       textAlign: TextAlign.left,
                        //       style:TextStyle(
                        //         fontSize: 16,
                        //         fontFamily: 'times new roman',
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ),
                        //
                        //   onPressed: () {
                        //
                        //   },
                        // ),

                        FlatButton(
                          padding: EdgeInsets.zero,
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              'Log Out',
                              style:TextStyle(
                                fontSize: 16,
                                fontFamily: 'times new roman',
                                color: Colors.red,
                              ),
                            ),
                          ),

                          onPressed: () {
                            logOut();
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ),
    );
  }
}



