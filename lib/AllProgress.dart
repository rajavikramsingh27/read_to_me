

import 'package:flutter/material.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:flutter/cupertino.dart';
import 'package:read_to_me/ReadBook.dart';


import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;


class AllProgress extends StatefulWidget {
  @override
  _AllProgressState createState() => _AllProgressState();
}

class _AllProgressState extends State<AllProgress> {

  int selectedIndex = 0;

  List<Map<String, dynamic>> arrAttemtTest = [];

  List<Map<String, dynamic>> arrToday = [];
  List<Map<String, dynamic>> arrWeek = [];
  List<Map<String, dynamic>> arrMonth = [];

  FlutterTts flutterTts;
  TtsState ttsState = TtsState.stopped;
  String language = 'en-us'; //'hi-IN';

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;

  selectedTest(int selected) {
    flutterTts = FlutterTts();

    selectedIndex = selected;

    setState(() {

    });
  }

  progress() async {
    showLoader(context);
    final url = Uri.parse(kBaseURL+'progress');
    final response = await http.get(url,);
    Navigator.pop(context);

    if (response.statusCode == 200) {
      final resbody = jsonDecode(response.body);
      final arrAttemtTest_1 = List<Map<String, dynamic>>.from(resbody);

      for (int i = 0; i<arrAttemtTest_1.length; i++) {
        final created_time = arrAttemtTest_1[i]['created_time'].toString();
        final inputFormat = DateFormat('yyyy-MM-dd hh:mm:ss');
        final createdDate = inputFormat.parse(created_time);

        final date2 = DateTime.now();
        final difference = date2.difference(createdDate).inDays;
        print(difference);

        if (difference == 0) {
          arrToday.add(arrAttemtTest_1[i]);
        } else if (difference < 7) {
          arrWeek.add(arrAttemtTest_1[i]);
        } else if (difference < 30) {
          arrMonth.add(arrAttemtTest_1[i]);
        }
      }

      arrAttemtTest = arrToday;
      setState(() {

      });
    } else {
      'Error \nSomething Went Wrong'.showMessage(context, true);
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initTextToSpeech();

    Future.delayed(Duration(microseconds: 100), () {
      progress();
    });
  }

  @override
  void dispose() {
    super.dispose();

    flutterTts.stop();
  }

  initTextToSpeech() {
    flutterTts = FlutterTts();

    flutterTts.setLanguage(language);
    // flutterTts.setLanguage('en-US');

    if (isAndroid) {
      _getDefaultEngine();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    if (isWeb || isIOS) {
      flutterTts.setPauseHandler(() {
        setState(() {
          print("Paused");
          ttsState = TtsState.paused;
        });
      });

      flutterTts.setContinueHandler(() {
        setState(() {
          print("Continued");
          ttsState = TtsState.continued;
        });
      });
    }

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });

  }

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;

    if (engine != null) {
      print(engine);
    }

  }

  speak(FlutterTts flutterTts, String fullString) async {
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.6);
    await flutterTts.setPitch(0.45);

    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.speak(fullString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: HexColor(bg_SecondColor),
                  width: 1
              )
            )
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            elevation: 0,
            centerTitle: true,
            leading: BackButton(
              color: HexColor(bg_SecondColor),
            ),
            title: Text(
              'All Progress',
              style:TextStyle(
                fontFamily: 'times new roman',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: HexColor(bg_SecondColor),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.black,
                          width: 1
                      )
                  )
              ),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            primary: Colors.transparent,
                            elevation: 0
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: (selectedIndex == 0)
                                  ? HexColor(bg_SecondColor)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 6,),
                              Text(
                                'Today',
                                style:TextStyle(
                                  fontFamily: 'times new roman',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: (selectedIndex == 0)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              SizedBox(height: 3,),
                              Text(
                                arrToday.length.toString(),
                                style:TextStyle(
                                  fontFamily: 'times new roman',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: (selectedIndex == 0)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              SizedBox(height: 6,),
                            ],
                          ),
                        ),
                        onPressed: () {
                          arrAttemtTest = arrToday;
                          selectedTest(0);
                        },
                      )
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            primary: Colors.transparent,
                            elevation: 0
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: (selectedIndex == 1)
                                  ? HexColor(bg_SecondColor)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 6,),
                              Text(
                                'This Week',
                                style:TextStyle(
                                  fontFamily: 'times new roman',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: (selectedIndex == 1)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              SizedBox(height: 3,),
                              Text(
                                arrWeek.length.toString(),
                                style:TextStyle(
                                  fontFamily: 'times new roman',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: (selectedIndex == 1)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              SizedBox(height: 6,),
                            ],
                          ),
                        ),
                        onPressed: () {
                          arrAttemtTest = arrWeek;
                          selectedTest(1);
                        },
                      )
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            primary: Colors.transparent,
                            elevation: 0
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: (selectedIndex == 2)
                                  ? HexColor(bg_SecondColor)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 6,),
                              Text(
                                'This Month',
                                style:TextStyle(
                                  fontFamily: 'times new roman',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: (selectedIndex == 2)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              SizedBox(height: 3,),
                              Text(
                                arrMonth.length.toString(),
                                style:TextStyle(
                                  fontFamily: 'times new roman',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: (selectedIndex == 2)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              SizedBox(height: 6,),
                            ],
                          ),
                        ),
                        onPressed: () {
                          arrAttemtTest = arrMonth;
                          selectedTest(2);
                        },
                      )
                  ),
                ],
              ),
            ),
            Container(
              width:MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height-167,
              child:ListView.builder(
                  itemCount: arrAttemtTest.length,
                  padding: EdgeInsets.only(
                    bottom: 20
                  ),
                  itemBuilder:(context,index) {
                    return Container(
                      padding: EdgeInsets.only(
                        top: 10, bottom: 10
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: HexColor(bg_SecondColor),
                                  width: 1
                              )
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  arrAttemtTest[index]['question'],
                                  style:TextStyle(
                                    fontFamily: 'times new roman',
                                    fontSize: 18,
                                    color: HexColor(bg_SecondColor),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      arrAttemtTest[index]['answer_right'],
                                      style:TextStyle(
                                        fontFamily: 'times new roman',
                                        fontSize: 16,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        right: 20
                                      ),
                                      child: Text(
                                        arrAttemtTest[index]['answer_your'],
                                        style:TextStyle(
                                          fontFamily: 'times new roman',
                                          fontSize: 16,
                                          color: (arrAttemtTest[index]['is_answer_correct'] == 'true')
                                              ? Colors.redAccent
                                              : Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.speaker,
                              size: 30,
                              color: HexColor(bg_SecondColor),
                            ),
                            onPressed: () {
                              speak(flutterTts, arrAttemtTest[index]['answer_right']);
                            },
                          )
                        ],
                      ),
                    );

                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
