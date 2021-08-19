

import 'package:flutter/material.dart';
import 'package:read_to_me/CoursesQuestions.dart';
import 'package:http/http.dart' as http;
import 'package:read_to_me/Global/Global.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'dart:convert';


class LessonTopicsList extends StatefulWidget {
  final String difficulty;

  LessonTopicsList({this.difficulty,});

  @override
  _LessonTopicsListState createState() => _LessonTopicsListState();
}

class _LessonTopicsListState extends State<LessonTopicsList> {
  List<Map<String, dynamic>> arrLessons = [];

  showCoursesQuestions(context, Map<String,dynamic> dictTestDetails) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return Container(
            height: 340,
            margin: EdgeInsets.only(
                left: 20,
                right: 20
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )
            ),
            child: CoursesQuestions(dictTestDetails),
          );
        }
    );
  }

  courses() async {
    showLoader(context);
    final url = Uri.parse(kBaseURL+'course/test');

    final params = {'difficulty':widget.difficulty};
    print(params);
    final response = await http.post(url,body: params);

    Navigator.pop(context);

    if (response.statusCode == 200) {
      final resbody = jsonDecode(response.body);
      arrLessons = List<Map<String, dynamic>>.from(resbody);

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

    print(widget.difficulty);
    Future.delayed(Duration(milliseconds: 100), () {
      courses();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
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
          child: Stack(
            children: [
              ListView.separated(
                  itemCount: arrLessons.length,

                  padding: EdgeInsets.only(
                      top: 60,
                      bottom: 20,
                      left: 20,
                      right: 20
                  ),

                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 10,
                    );
                  },

                  itemBuilder: (context, index) {
                    return Container(
                      alignment: (index%2 == 0)
                          ? Alignment.centerLeft
                          : Alignment.centerRight,

                      child: Column(
                        children: [
                          Image.asset(
                            'man.png',
                            height: 100,
                          ),
                          FlatButton(
                            padding: EdgeInsets.zero,
                            child: Container(
                              height: 40,
                              width: 220,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Text(
                                (index+1).toString() + '. '+arrLessons[index]['title'],
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    fontFamily: 'times new roman'
                                ),
                              ),
                            ),
                            onPressed: () {
                              showCoursesQuestions(context, arrLessons[index]);
                            },
                          )
                        ],
                      ),
                    );
                  }),
              SafeArea(
                child: BackButton(
                  color: Colors.white,
                ),
              ),
            ],
          )
      ),
    );
  }
}


