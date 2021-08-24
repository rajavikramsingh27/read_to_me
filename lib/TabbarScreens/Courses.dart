
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:read_to_me/LessonTopicsList.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class Courses extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<Map<String, dynamic>> arrCourses = [];

  courses() async {
    showLoader(context);
    final url = Uri.parse(kBaseURL+'course');
    final response = await http.get(url,);

    Navigator.pop(context);

    if (response.statusCode == 200) {
      final resbody = jsonDecode(response.body);
      arrCourses = List<Map<String, dynamic>>.from(resbody);

      setState(() {

      });
    } else {
      'Error \nSomething Went Wrong'.showMessage(context, true);
    }

  }

  userDetails() async {
    final url = Uri.parse(kBaseURL+'user');
    final response = await http.post(url, body: {'id': kUserID});

    if (response.statusCode == 200) {
      final resbody = jsonDecode(response.body);
      final dictResponse = Map<String, dynamic>.from(resbody);
      strTotalLearned = dictResponse['total_learned'];
      strTotalAttempt = dictResponse['total_attempt'];
    } else {
      'Error \nSomething Went Wrong'.showMessage(context, true);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(microseconds: 100), () {
      courses();
      userDetails();
    });
  }


  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            width: MediaQuery
                .of(context)
                .size
                .width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
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
                          style: TextStyle(
                            fontFamily: 'times new roman',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'English',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'times new roman',
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: heightContainer(context),
                    child: ListView.separated(
                        itemCount: arrCourses.length,
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 10,
                          );
                        },
                        itemBuilder: (context, index) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              padding: EdgeInsets.all(0)
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: (index % 2 == 0)
                                    ? Colors.pinkAccent
                                    : Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(6),

                                boxShadow: [
                                  BoxShadow(
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
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Container(
                                        child: Text(
                                          arrCourses[index]['difficulty'],
                                          // 'Beginners',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontFamily: 'times new roman',
                                            fontSize: 18,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(left: 20,),
                                        decoration: BoxDecoration(
                                        ),
                                      ),
                                      Container(
                                        width: 60,
                                        height: 60,
                                        margin: EdgeInsets.only(right: 20,),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: arrCourses[index]['thumbnail'].toString().showImage(),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 20,),
                                  Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    child: Text(
                                      arrCourses[index]['description'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'times new roman',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16,),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment
                                  //       .spaceBetween,
                                  //   children: [
                                  //     Container(
                                  //       width: 120,
                                  //       height: 40,
                                  //       alignment: Alignment.center,
                                  //       child: FlatButton(
                                  //           minWidth: 120,
                                  //           height: 40,
                                  //           splashColor: Colors.white,
                                  //           child: Text(
                                  //             arrCourses[index]["lesson_count"].toString()+" Lesson",
                                  //             style: TextStyle(
                                  //               color: Colors.white,
                                  //               fontFamily: 'times new roman',
                                  //               fontSize: 14,
                                  //             ),
                                  //           ),
                                  //           onPressed: () {
                                  //
                                  //             Navigator.push(
                                  //               context,
                                  //               MaterialPageRoute(
                                  //                   builder: (context) => LessonTopicsList(
                                  //                       difficulty: arrCourses[index]['difficulty'].toString()
                                  //                   )
                                  //                       // LessonTopicsList()
                                  //               ),
                                  //             );
                                  //           }
                                  //       ),
                                  //       margin: EdgeInsets.only(left: 20, top: 0),
                                  //       decoration: BoxDecoration(
                                  //           color: Colors.grey,
                                  //           borderRadius: BorderRadius.circular(
                                  //               20)
                                  //       ),
                                  //     ),
                                  //     Expanded(child: Row(
                                  //       children: [
                                  //         Container(
                                  //
                                  //           margin: EdgeInsets.only(
                                  //               left: 30, top: 0),
                                  //           decoration: BoxDecoration(
                                  //               border: Border.all(
                                  //                   color: Colors.pinkAccent,
                                  //                   width: 0
                                  //               ),
                                  //               borderRadius: BorderRadius
                                  //                   .circular(50)
                                  //           ),
                                  //           child: Image.asset(
                                  //             'star.png',
                                  //             width: 20,
                                  //             height: 20,
                                  //           ),
                                  //         ),
                                  //         SizedBox(width: 6),
                                  //         Container(
                                  //           child: Text(
                                  //             arrCourses[index]['read_rating'].toString()+"/"+arrCourses[index]['read_total'].toString(),
                                  //             style: TextStyle(
                                  //               color: Colors.white,
                                  //               fontFamily: 'times new roman',
                                  //               fontSize: 16,
                                  //             ),
                                  //           ),
                                  //           height: 20,
                                  //         ),
                                  //         SizedBox(width: 5),
                                  //         Expanded(
                                  //           child: ClipRRect(
                                  //             borderRadius: BorderRadius.circular(
                                  //                 10),
                                  //             child: LinearProgressIndicator(
                                  //               backgroundColor: Colors.black45,
                                  //               valueColor: AlwaysStoppedAnimation<
                                  //                   Color>(Colors.yellow,),
                                  //               value: double.parse(arrCourses[index]['read_rating'].toString())
                                  //                   /double.parse(arrCourses[index]['read_total'].toString()),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         SizedBox(width: 20,)
                                  //       ],
                                  //     ))
                                  //   ],
                                  // ),
                                  // SizedBox(height: 20,)
                                ],
                              ),
                            ),
                            onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => LessonTopicsList(
                                                    difficulty: arrCourses[index]['difficulty'].toString()
                                                )
                                                    // LessonTopicsList()
                                            ),
                                          );
                            },
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


