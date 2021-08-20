

import 'package:flutter/material.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class Results extends StatefulWidget {
  int correctAnswer;

  Results(this.correctAnswer);

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
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
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SafeArea(
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.only(right: 16)
                  ),
                  child: Text(
                    'Close',
                    style:TextStyle(
                      fontFamily: 'Times new roman',
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    showRating(context);
                  },
                )
              )
            ),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height-91,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 30, right: 30
                    ),
                    child: Text(
                      'Based on your answer, your score for how many words you know:',
                      style:TextStyle(
                        fontFamily: 'Times new roman',
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 60,),
                  Text(
                    (widget.correctAnswer*10).toString(),
                    style:TextStyle(
                      fontSize: 40,
                      fontFamily: 'times new roman',
                      color: HexColor(bg_SecondColor),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text(
                    'Just Started',
                    style:TextStyle(
                        fontSize: 16,
                        fontFamily: 'times new roman',
                        color: Colors.white,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  SizedBox(height: 60,),
                  // FlatButton(
                  //   padding: EdgeInsets.zero,
                  //   child: Container(
                  //     height: 50,
                  //     width: 140,
                  //     decoration: BoxDecoration(
                  //       color: HexColor(bg_SecondColor),
                  //       borderRadius: BorderRadius.circular(27),
                  //     ),
                  //     alignment: Alignment.center,
                  //     child: Text(
                  //       'Submit',
                  //       style:TextStyle(
                  //         fontFamily: 'Times new roman',
                  //         color: Colors.white,
                  //         fontSize: 16,
                  //       ),
                  //     ),
                  //   ),
                  //
                  //   onPressed: () {
                  //
                  //   },
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}



double sizeRatingIcon = 40;

showRating(context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: 260,
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(
              left: 16, right: 16
          ),
          padding: EdgeInsets.only(
              left: 16, right: 16
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text(
                'Rate this book according your experience.',
                textAlign: TextAlign.center,
                style:TextStyle(
                  fontSize: 16,
                  fontFamily: 'times new roman',
                  fontWeight: FontWeight.normal,
                  color: HexColor(bg_FirstColor),
                ),
              ),
              SizedBox(height: 20,),
              RatingBar.builder(
                  initialRating: 3,
                  itemCount: 5,
                  itemSize: 54,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.red,
                        );
                      case 1:
                        return Icon(
                          Icons.sentiment_dissatisfied,
                          color: Colors.redAccent,
                        );
                      case 2:
                        return Icon(
                          Icons.sentiment_neutral,
                          color: Colors.amber,
                        );
                      case 3:
                        return Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.lightGreen,
                        );
                      case 4:
                        return Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.green,
                        );
                    }
                  },
                  onRatingUpdate: (rating) {
                    print(rating);
                  }),
              SizedBox(height: 40,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          primary: HexColor(bg_FirstColor),
                          elevation: 0,
                          fixedSize: Size.fromHeight(50)
                      ),
                      child: Text(
                        'Submit',
                        style:TextStyle(
                          fontFamily: 'times new roman',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {

                      },
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          primary: HexColor(bg_FirstColor),
                          elevation: 0,
                          fixedSize: Size.fromHeight(50)
                      ),
                      child: Text(
                        'Cancel',
                        style:TextStyle(
                          fontFamily: 'times new roman',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context)..pop()..pop()..pop()..pop();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
  );

}