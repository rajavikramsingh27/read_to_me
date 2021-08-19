

import 'package:flutter/material.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:read_to_me/AllProgress.dart';
import 'package:read_to_me/PickTheWords_VocabularyTest.dart';
import 'package:read_to_me/WriteForSupport.dart';


class Words extends StatefulWidget {
  @override
  _WordsState createState() => _WordsState();
}

class _WordsState extends State<Words> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          width: MediaQuery.of(context).size.width,
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
            bottom: false,
            child: Column(
              children: [
                Align(
                  alignment:Alignment.centerLeft,
                  child: Text(
                    'Words',
                    style:TextStyle(
                      fontFamily: 'times new roman',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height:heightContainer(context),
                  width:MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                            bottom: 20
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.white.withOpacity(0.5),
                                width: 1
                              )
                            )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Total attempted',
                                    style:TextStyle(
                                      fontFamily: 'times new roman',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  Text(
                                    strTotalAttempt,
                                    style:TextStyle(
                                      fontFamily: 'times new roman',
                                      fontSize: 64,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Total learned',
                                    style:TextStyle(
                                      fontFamily: 'times new roman',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  Text(
                                    strTotalLearned,
                                    style:TextStyle(
                                      fontFamily: 'times new roman',
                                      fontSize: 64,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.centerRight,
                            onPrimary: Colors.white,
                            primary: Colors.transparent,
                            onSurface: Colors.grey,
                            elevation: 0,
                          ),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.white.withOpacity(0.5),
                                        width: 1
                                    )
                                )
                            ),
                            child: Text(
                              'All Progress',
                              style:TextStyle(
                                fontFamily: 'times new roman',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AllProgress()),
                            );
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.centerRight,
                            onPrimary: Colors.white,
                            primary: Colors.transparent,
                            onSurface: Colors.grey,
                            elevation: 0,
                          ),
                          child: Container(
                            height: 50,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.white.withOpacity(0.5),
                                        width: 1
                                    )
                                )
                            ),
                            child: Text(
                              'Attemp a Test',
                              style:TextStyle(
                                fontFamily: 'times new roman',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PickTheWords_VocabularyTest()),
                            );
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.centerRight,
                            onPrimary: Colors.white,
                            primary: Colors.transparent,
                            onSurface: Colors.grey,
                            elevation: 0,
                          ),
                          child: Container(
                            height: 50,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.white.withOpacity(0.5),
                                        width: 1
                                    )
                                )
                            ),
                            child: Text(
                              'Write For Support',
                              style:TextStyle(
                                fontFamily: 'times new roman',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WriteForSupport()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}

