



import 'package:flutter/material.dart';
import 'package:read_to_me/Emailscreen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}



class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        child: Column(
          children: [
            Container(
                width:30,
                height:30,
                margin:EdgeInsets.only(left:310,top:390),
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius:BorderRadius.circular(50),
                ),
              child:FlatButton(
                minWidth: 30,
                height:30,
                splashColor:Colors.red,
                padding: EdgeInsets.zero,
                child:Image.asset(
                  'close.png',
                  height:15,
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => BottomNavBar()),
                  // );
                },
              )
              ,
            ),
            Container(
              child:Column(
                children: [
                  Container(
                    width:100,
                    height:100,
                    margin:EdgeInsets.only(top:0),
                    decoration:BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  Container(
                    width:400,
                    height:1,
                    margin:EdgeInsets.only(left:0,top:0),
                    decoration:BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  Container(
                    child:Text(
                      'To save your progress, sign up in',
                      style:TextStyle(
                          color:Colors.white,
                          fontSize:18
                      ),
                    ),
                    width:300,
                    height:25,
                    margin:EdgeInsets.only(left:30,top:30),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  Container(
                    child:Text(
                      'one of the ways',
                      style:TextStyle(
                          color:Colors.white,
                          fontSize:18
                      ),
                    ),
                    width:300,
                    height:25,
                    margin:EdgeInsets.only(left:115,top:0),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        child:Image.asset(
                          'facebook.png',
                        ),
                        width:40,
                        height:40,
                        margin:EdgeInsets.only(left:70,top:20),
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius:BorderRadius.circular(5),
                          )
                        ),
                      Container(
                          child: Column(
                            children: [
                              Container(
                                  child:Image.asset(
                                    'search.png',
                                  ),
                                  width:22,
                                  height:22,
                                  margin:EdgeInsets.only(left:0,top:10),
                                  decoration: BoxDecoration(
                                    borderRadius:BorderRadius.circular(5),
                                  )
                              ),
                            ],
                          ),
                          width:40,
                          height:40,
                          margin:EdgeInsets.only(left:20,top:20),
                          decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius:BorderRadius.circular(5),
                          )
                      ),
                      Container(
                        width:40,
                        height:40,
                        margin:EdgeInsets.only(left:20,top:20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:BorderRadius.circular(5),
                        ),
                        child:FlatButton(
                          minWidth: 40,
                          height:40,
                          splashColor: Colors.red,
                          padding: EdgeInsets.zero,
                          child:Image.asset(
                            'mail.png',
                            height: 22,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>Emailscreen()),
                            );
                          },
                        ),
                      ),
                      Container(
                          child: Column(
                            children: [
                              Container(
                                  child:Image.asset(
                                    'apple.png',
                                  ),
                                  width:22,
                                  height:22,
                                  margin:EdgeInsets.only(left:0,top:07),
                                  decoration: BoxDecoration(
                                    borderRadius:BorderRadius.circular(5),
                                  )
                              ),
                            ],
                          ),
                          width:40,
                          height:40,
                          margin:EdgeInsets.only(left:20,top:20),
                          decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius:BorderRadius.circular(5),
                          )
                      ),
                    ],
                  ),
                  Container(
                    child:Text(
                      'By continuing you accept our privacy Policy and Terms of',
                      style:TextStyle(
                          color:Colors.white,
                          fontSize:10
                      ),
                    ),
                    width:300,
                    height:10,
                    margin:EdgeInsets.only(left:40,top:20),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  Container(
                    child:Text(
                      'Use.',
                      style:TextStyle(
                          color:Colors.white,
                          fontSize:10
                      ),
                    ),
                    width:300,
                    height:11,
                    margin:EdgeInsets.only(left:170,top:03),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ],
              ),
              width:400,
              height:300,
              margin:EdgeInsets.only(top:10),
              decoration:BoxDecoration(
                color: Colors.purpleAccent
              ),
            ),
          ],
        ),
      ),
    );
  }



}