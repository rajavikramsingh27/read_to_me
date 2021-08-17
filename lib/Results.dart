
import 'package:flutter/material.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:read_to_me/Global/Global.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
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
                    Navigator.pop(context);
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
                    '240',
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
                  FlatButton(
                    padding: EdgeInsets.zero,
                    child: Container(
                      height: 50,
                      width: 140,
                      decoration: BoxDecoration(
                        color: HexColor(bg_SecondColor),
                        borderRadius: BorderRadius.circular(27),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Share',
                        style:TextStyle(
                          fontFamily: 'Times new roman',
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    onPressed: () {

                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}
