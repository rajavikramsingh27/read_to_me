

import 'package:flutter/material.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:read_to_me/Global/Global.dart';


class AllProgress extends StatefulWidget {
  @override
  _AllProgressState createState() => _AllProgressState();
}

class _AllProgressState extends State<AllProgress> {

  int selectedIndex = 0;

  selectedTest(int selected) {
    selectedIndex = selected;

    setState(() {

    });
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
                                '0',
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
                                '0',
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
                                '0',
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
                  itemCount: 14,
                  padding: EdgeInsets.only(
                    bottom: 20
                  ),
                  itemBuilder:(context,index) {
                    return Container(
                      // height: 111,
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
                                  'Final',
                                  style:TextStyle(
                                    fontFamily: 'times new roman',
                                    fontSize: 20,
                                    color: HexColor(bg_SecondColor),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  'end, ending',
                                  style:TextStyle(
                                    fontFamily: 'times new roman',
                                    fontSize: 15,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            )
                          ),
                          Icon(
                            Icons.speaker,
                            size: 30,
                            color: HexColor(bg_SecondColor),
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
