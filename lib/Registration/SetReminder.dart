

import 'package:flutter/material.dart';
import 'package:read_to_me/TabbarScreens/BottomNavBar.dart';


class SetReminder extends StatefulWidget {
  @override
  _SetReminderState createState() => _SetReminderState();
}

class _SetReminderState extends State<SetReminder> {
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
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButton(
                      color: Colors.white,
                    ),
                    Text(
                      'Set Your Reminder',
                      style: TextStyle(
                          fontFamily: 'times new roman',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight:FontWeight.normal
                      ),
                    ),
                    SizedBox(width: 50,)
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )
                      ),
                      labelText: 'Time',
                      labelStyle: TextStyle(
                          fontFamily: 'times new roman',
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight:FontWeight.normal
                      ),
                      hintStyle: TextStyle(
                          fontFamily: 'times new roman',
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight:FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(height:10),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontFamily: 'times new roman',
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight:FontWeight.normal
                      ),
                      hintStyle: TextStyle(
                          fontFamily: 'times new roman',
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight:FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(height:60),
                Container(
                  alignment: Alignment.center,
                  width:320,
                  height:50,
                  decoration:BoxDecoration(
                    color:Colors.yellow,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: FlatButton(
                    minWidth:double.infinity,
                    height:double.infinity,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavBar()),
                      );
                    },
                    child:Text(
                      'Set Reminder',
                      style:TextStyle(
                          fontFamily: 'times new roman',
                          color:Colors.black,
                          fontSize:20
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
