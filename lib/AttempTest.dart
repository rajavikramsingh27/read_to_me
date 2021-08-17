

import 'package:flutter/material.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:read_to_me/Results.dart';


class AttempTest extends StatefulWidget {
  @override
  _AttempTestState createState() => _AttempTestState();
}

class _AttempTestState extends State<AttempTest> {

  var intSelected = 0;

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
                        child: Container(
                          height: 10,
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              color: HexColor(bg_SecondColor),
                              borderRadius: BorderRadius.circular(30)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 30,),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        'Here is your question ? Here is your question ?Here is your question ?',
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
                    'Choose the right answer.',
                    style:TextStyle(
                      fontFamily: 'Times new roman',
                      color: Colors.black45,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 16,),
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.zero,
                        child: Container(
                          height: 54,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: (intSelected == 1)
                                  ? HexColor(bg_SecondColor)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: (intSelected == 1)
                                      ? HexColor(bg_SecondColor)
                                      : Colors.black,
                                  width: 1
                              )
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Option 1',
                            style:TextStyle(
                              fontFamily: 'Times new roman',
                              color: (intSelected == 1)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        onPressed: () {
                          intSelected = 1;

                          setState(() {

                          });
                        },

                      ),
                    ),
                    SizedBox(width: 16,),
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.zero,
                        child: Container(
                          height: 54,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: (intSelected == 2)
                                  ? HexColor(bg_SecondColor)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: (intSelected == 2)
                                      ? HexColor(bg_SecondColor)
                                      : Colors.black,
                                  width: 1
                              )
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Option 2',
                            style:TextStyle(
                              fontFamily: 'Times new roman',
                              color: (intSelected == 2)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        onPressed: () {
                          intSelected = 2;

                          setState(() {

                          });
                        },

                      ),
                    ),
                    SizedBox(width: 16,),
                  ],
                ),
                SizedBox(height: 16,),

                Row(
                  children: [
                    SizedBox(width: 16,),
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.zero,
                        child: Container(
                          height: 54,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: (intSelected == 3)
                                  ? HexColor(bg_SecondColor)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: (intSelected == 3)
                                      ? HexColor(bg_SecondColor)
                                      : Colors.black,
                                  width: 1
                              )
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Option 3',
                            style:TextStyle(
                              fontFamily: 'Times new roman',
                              color: (intSelected == 3)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        onPressed: () {
                          intSelected = 3;

                          setState(() {

                          });
                        },

                      ),
                    ),
                    SizedBox(width: 16,),
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.zero,
                        child: Container(
                          height: 54,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: (intSelected == 4)
                                  ? HexColor(bg_SecondColor)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: (intSelected == 4)
                                      ? HexColor(bg_SecondColor)
                                      : Colors.black,
                                  width: 1
                              )
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Option 4',
                            style:TextStyle(
                              fontFamily: 'Times new roman',
                              color: (intSelected == 4)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        onPressed: () {
                          intSelected = 4;

                          setState(() {

                          });
                        },

                      ),
                    ),
                    SizedBox(width: 16,),
                  ],
                ),

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
                      style:TextStyle(
                        fontFamily: 'Times new roman',
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Results()),
                    );
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
