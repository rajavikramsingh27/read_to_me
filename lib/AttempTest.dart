

import 'package:flutter/material.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:read_to_me/Results.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class AttempTest extends StatefulWidget {
  Map<String, dynamic> dictTestDetails;

  AttempTest(this.dictTestDetails);

  @override
  _AttempTestState createState() => _AttempTestState();
}


class _AttempTestState extends State<AttempTest> {
  List<Map<String, dynamic>> arrLessonOptions;
  List<bool> arrSelect = [];

  double submitAnswer = 0;

  int correctAnswerCount = 0;
  String selectctedAnswer = '';

  progress_submit(Map<String, dynamic> params) async {
    showLoader(context);
    final url = Uri.parse(kBaseURL+'progress/submit');
    print(params);

    final response = await http.post(
        url, body: params
    );

    Navigator.pop(context);

    if (response.statusCode == 200) {
      final dictResponse = Map<String, dynamic>.from(jsonDecode(response.body));
      dictResponse['message'].toString().showMessage(context, false);

      (arrSelect.contains(true)) ? submitAnswer += 1 : null;
      for (int i = 0; i <arrSelect.length; i++) {
        arrSelect[i] = false;
      }

      if (submitAnswer/arrLessonOptions.length == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Results(correctAnswerCount))
        );
      } else {
        setState(() {});
      }
    } else {
      'Error! \n Something went wrong'.showMessage(context, true);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    arrLessonOptions = List<Map<String, dynamic>>.from(
        widget.dictTestDetails['lesson_options']
    );

    for (int i = 0; i<arrLessonOptions.length; i++) {
      arrSelect.add(false);
    }

  }

  Widget gridView(context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: arrLessonOptions.length,
      padding: EdgeInsets.only(
          // top: 30,bottom: 30,
          left: 16,right: 16
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 4,
        childAspectRatio: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        return FlatButton(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              FlatButton(
                padding: EdgeInsets.zero,
                child: Container(
                  height: 54,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: arrSelect[index]
                          ? HexColor(bg_SecondColor)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          color: arrSelect[index]
                              ? HexColor(bg_SecondColor)
                              : Colors.black,
                          width: 1
                      )
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    arrLessonOptions[index]['wordActual'],
                    style:TextStyle(
                      fontFamily: 'Times new roman',
                      color: arrSelect[index]
                          ? Colors.white
                          : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),

                onPressed: () {
                  for (int i = 0; i<arrSelect.length; i++) {
                    arrSelect[i] = (i == index) ? true : false;
                  }

                  selectctedAnswer = arrLessonOptions[index]['lesson_answer'];

                  setState(() {

                  });
                },

              ),
            ],
          ),

          onPressed: () {
            setState(() {

            });
          },
        );
      },

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            brightness: Brightness.light,
          )
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SafeArea(
                  child: Row(
                    children: [
                      BackButton(),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: LinearProgressIndicator(
                              backgroundColor: Colors.black26,
                              valueColor: AlwaysStoppedAnimation<
                                  Color>(HexColor(bg_SecondColor),),
                              value: submitAnswer/arrLessonOptions.length
                          ),
                        )
                      ),
                      SizedBox(width: 30),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 30,),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        arrLessonOptions[submitAnswer.toInt()]['lesson_question'].toString(),
                        style:TextStyle(
                          fontFamily: 'Times new roman',
                          color: HexColor(bg_SecondColor),
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 30,
                    left: 16,
                    right: 16,
                  ),
                  child: Text(
                    (submitAnswer.toInt()+1).toString()+'. Choose the right answer.',
                    style:TextStyle(
                      fontFamily: 'Times new roman',
                      color: Colors.black45,
                      fontSize: 16,
                    ),
                  ),
                ),
                gridView(context),
                SizedBox(height: 60,),
                FlatButton(
                  padding: EdgeInsets.zero,
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        left: 20,
                        right: 20
                    ),
                    decoration: BoxDecoration(
                      color: HexColor(bg_SecondColor),
                      borderRadius: BorderRadius.circular(27),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontFamily: 'Times new roman',
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  onPressed: () {
                    bool is_answer_correct = false;

                    if (submitAnswer < arrLessonOptions.length) {
                      if (arrLessonOptions[submitAnswer.toInt()]['lesson_answer'].toString() == selectctedAnswer) {
                        correctAnswerCount = correctAnswerCount += 1;
                        strTotalLearned = (int.parse(strTotalLearned)+1).toString();

                        is_answer_correct = true;
                      } else {
                        is_answer_correct = false;
                      }
                    }

                    strTotalAttempt = (int.parse(strTotalAttempt)+1).toString();

                    final params = {
                      "userID":kUserID,
                      "answer_right": arrLessonOptions[submitAnswer.toInt()]['lesson_answer'],
                      "answer_your": selectctedAnswer,
                      "is_answer_correct": is_answer_correct.toString(),
                      "question": arrLessonOptions[submitAnswer.toInt()]['lesson_question'],
                      "total_learned": strTotalLearned,
                      "total_attempt": strTotalAttempt,
                      'created_time': DateTime.now().toString()
                    };

                    progress_submit(params);
                  },
                ),

                SizedBox(height: 20,),
              ],
            ),
          ],
        ),
    );
  }

}
