

import 'package:flutter/material.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:read_to_me/AttempTest.dart';


class CoursesQuestions extends StatefulWidget {
  List<Map<String,dynamic>> lesson_options;
  CoursesQuestions(this.lesson_options);

  @override
  _CoursesQuestionsState createState() => _CoursesQuestionsState();
}

class _CoursesQuestionsState extends State<CoursesQuestions> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(widget.lesson_options);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16,),
        Container(
          width: 140,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: HexColor(bg_BlueColor),
              borderRadius: BorderRadius.circular(22)
          ),

          child: FlatButton(
            minWidth: double.infinity,
            height: double.infinity,
            child: Text(
              'BEGIN',
              style:TextStyle(
                fontFamily: 'Times new roman',
                color: Colors.white,
                fontSize: 16,
              ),
            ),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AttempTest()),
              );
            },
          )
        ),
        SizedBox(height: 16,),
        ListView.builder(
            shrinkWrap: true,
            itemCount: widget.lesson_options.length,
            itemBuilder: (context,index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 10,
              top: 10
            ),
                decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1,
                        color: Colors.black
                    )
                )
            ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.lesson_options[index]['wordActual'],
                  style:TextStyle(
                    fontFamily: 'Times new roman',
                    fontSize: 16,
                  ),
                ),
                    Text(
                      widget.lesson_options[index]['wordParllel'],
                  style:TextStyle(
                    color: Colors.black26,
                    fontFamily: 'Times new roman',
                    fontSize: 14,
                  ),
                ),
                  ],
                ),
              );
            }),
      ],

    );
  }

}


