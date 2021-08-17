import 'package:flutter/material.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:read_to_me/LessonTopicsList.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:read_to_me/TabbarScreens/Games.dart';
import 'package:read_to_me/TabbarScreens/Library.dart';
import 'package:read_to_me/TabbarScreens/Courses.dart';
import 'package:read_to_me/TabbarScreens/Words.dart';
import 'package:read_to_me/TabbarScreens/Setting.dart';



class Api_1 extends StatefulWidget {
  const Api_1({key}) : super(key: key);

  @override
  _Api_1State createState() => _Api_1State();
}

class _Api_1State extends State<Api_1> {
  user_list() async {
    var user_list_get = await http.get(
      Uri.parse(
          'https://us-central1-read-to-me-cf92d.cloudfunctions.net/user/user_list'),
    );
    // print(user_list_get.statusCode);
    // print(user_list_get.body);

    List<Map<String, dynamic>> listbody = [];
    var resbody = jsonDecode(user_list_get.body);
    listbody = List<Map<String, dynamic>>.from(resbody);
    // print(listbody);

    Map<String, dynamic> mapRes = listbody[0];
    // print(mapRes);

    String name = mapRes["name"];
    // print(name);
    String gav = mapRes["gav"];

    // print(gav);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user_list();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Courses',
                        style:TextStyle(
                          fontFamily: 'times new roman',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'English',
                        style:TextStyle(
                          fontWeight: FontWeight.w600,
                          color:Colors.white,
                          fontFamily: 'times new roman',
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width:MediaQuery.of(context).size.width,
                  height:heightContainer(context),
                  child:ListView.separated(
                      itemCount: 4,
                      padding: EdgeInsets.only(
                          top: 20,
                          bottom: 20
                      ),
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 10,
                        );
                      },
                      itemBuilder:(context,index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: (index%2 == 0 ) ? Colors.pinkAccent : Colors.lightBlueAccent,
                            borderRadius: BorderRadius.circular(6),

                            boxShadow: [
                              BoxShadow (
                                color: Colors.grey,
                                blurRadius: 10,
                                offset: Offset(0, 0), // Shadow position
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child:Text(
                                      'Beginners',
                                      style:TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: 'times new roman',
                                        fontSize: 18,
                                      ),
                                    ),
                                    margin:EdgeInsets.only(left:20,),
                                    decoration:BoxDecoration(
                                    ),
                                  ),
                                  Container(
                                    width:60,
                                    height:60,
                                    margin:EdgeInsets.only(right:20,),
                                    child:Image.asset(
                                      'student.png',
                                    ),
                                    decoration:BoxDecoration(
                                        borderRadius:BorderRadius.circular(30),
                                        color: Colors.white
                                    ),
                                    padding: EdgeInsets.all(4),
                                  ),
                                ],
                              ),

                              SizedBox(height: 20,),
                              Container(
                                margin:EdgeInsets.only(left:20,right:20),
                                child:Text(
                                  'Lorem Ipsum is simply dummy text of the printing and'
                                      ' typesetting industry. Lorem Ipsum has been the '
                                      'industrys standard dummy text ever since the, '
                                      'when an unknown printer took a galley of type '
                                      'and scrambled it to make a type specimen book.',
                                  style:TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'times new roman',
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(height: 16,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 120,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: FlatButton(
                                        minWidth:120,
                                        height:40,
                                        splashColor:Colors.white,
                                        child:Text(
                                          '10 Lessons',
                                          style:TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'times new roman',
                                            fontSize: 14,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => LessonTopicsList()),
                                          );
                                        }
                                    ),
                                    margin: EdgeInsets.only(left:20,top:0),
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                  ),
                                  Expanded(child:Row(
                                    children: [
                                      Container(
                                        margin:EdgeInsets.only(left:30,top:0),
                                        decoration:BoxDecoration(
                                            border:Border.all(
                                                color:Colors.pinkAccent,
                                                width:0
                                            ),
                                            borderRadius:BorderRadius.circular(50)
                                        ),
                                        child:Image.asset(
                                          'star.png',
                                          width:20,
                                          height:20,
                                        ),
                                      ),
                                      SizedBox(width:6),
                                      Container(
                                        child:Text(
                                          '5/6',
                                          style:TextStyle(
                                            color:Colors.white,
                                            fontFamily: 'times new roman',
                                            fontSize: 16,
                                          ),
                                        ),
                                        height:20,
                                      ),
                                      SizedBox(width:5),
                                      Expanded(
                                        child:ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child:  LinearProgressIndicator(
                                            backgroundColor: Colors.black45,
                                            valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow,),
                                            value: 0.4,
                                          ),
                                        ),
                                      ),

                                      // Container(
                                      //   width: 70,
                                      //   height: 5,
                                      //   margin: EdgeInsets.only(left:05,top:02),
                                      //   decoration: BoxDecoration(
                                      //       color:Colors.black38,
                                      //       borderRadius:BorderRadius.circular(20)
                                      //   ),
                                      //   child: Column(
                                      //     children: [
                                      //       Container(
                                      //         width:30,
                                      //         height:5,
                                      //         margin:EdgeInsets.only(left:0,top:0),
                                      //         alignment: Alignment.center,
                                      //         decoration: BoxDecoration(
                                      //             color: Colors.white,
                                      //             borderRadius: BorderRadius.circular(20)
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      SizedBox(width:20,)
                                    ],
                                  ))
                                ],
                              ),
                              SizedBox(height:20,)
                            ],
                          ),
                        );

                      }
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
