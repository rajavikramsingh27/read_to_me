

import 'package:flutter/material.dart';
import 'package:read_to_me/Registration/SelectYourAge.dart';


class Emailscreen extends StatefulWidget {
  @override
  _EmailscreenState createState() => _EmailscreenState();
}

class _EmailscreenState extends State<Emailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
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
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: SafeArea(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height:30,),
                  Container (
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'READ TO ME',
                      style: TextStyle(
                          fontFamily: 'times new roman',
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight:FontWeight.bold
                      ),
                    ),
                    margin: EdgeInsets.only(left: 20,),
                  ),
                  SizedBox(height:20,),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      textAlign: TextAlign.left,
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
                        labelText: 'Email Id',
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
                  SizedBox(height:20,),
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
                        labelText: 'Password',
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
                  SizedBox(
                    height:60,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 54,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.circular(27)
                    ),
                    child:FlatButton(
                      minWidth:double.infinity,
                      height: double.infinity,
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontFamily: 'times new roman',

                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SelectYourAge()),
                        );
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: FlatButton(
                      child: Text(
                        "I don't remember the password.",
                        style: TextStyle(
                          fontFamily: 'times new roman',
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => RegistrationBirthday()),
                        // );
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: FlatButton(
                      child: Text(
                        "Already have an account.",
                        style: TextStyle(
                          fontFamily: 'times new roman',
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => RegistrationBirthday()),
                        // );
                      },
                    ),
                  )
                ],
              ),
            )
          ),
        )
    );
  }
}
