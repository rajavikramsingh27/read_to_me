import 'package:flutter/material.dart';

import 'package:loading_more_list/loading_more_list.dart';


import '../Global/Constant.dart';
import '../Global/Global.dart';



class Demopage extends StatefulWidget {
  const Demopage({key}) : super(key: key);

  @override
  _DemopageState createState() => _DemopageState();
}

class _DemopageState extends State<Demopage> {
  List<bool> listSelected = [false, false,false,false, false, false,false,false,false, false, false,false,false,]; // make a list of bool value

  String selectedLanguage = '';
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
                      'Choose Your Location',
                      style: TextStyle(
                          fontFamily: 'times new roman',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight:FontWeight.normal
                      ),
                    ),
                    SizedBox(width: 50,),

                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height:
                  MediaQuery.of(context).size.height-MediaQuery.of(context).padding.bottom
                      -92-100,
                  child: _gridView(context),
                ),

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
                        MaterialPageRoute(builder: (context) => Demopage()),
                      );
                    },
                    child:Text(
                      'Continue',
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
  Widget _gridView(context) {
    List<String> listLanguage = [
      'Delhi','Jaipur','Chandighad','Punjab','Uterpardesh',
      'India', 'Utrakhand', 'Ajmer', 'Kota',
      'Rajasthan','Chin','Nepal','Haryana',
    ];
    return GridView.builder(
      itemCount: listLanguage.length,
      padding: EdgeInsets.only(
          top: 30,bottom: 30,
          left: 16,right: 16
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 8,
        childAspectRatio: 4,
      ),
      itemBuilder: (BuildContext context, int index) {
        return FlatButton(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Container(
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: (listSelected[index] == true) ? HexColor(bg_SecondColor) : Colors.white , // selected hone pr color change
                    borderRadius: BorderRadius.circular(18)
                ),
                child: Text(
                  listLanguage[index],
                  style: TextStyle(
                    fontFamily: 'times new roman',
                    color: (listSelected[index] == true) ? Colors.white : Colors.black , // selected hone pr color change
                    fontSize: 16,
                  ),
                ),

              ),
            ],
          ),
          onPressed: () {
            print('listSelected:-- $listSelected'); // for loop
            for (int i = 0; i<listSelected.length; i++) {
              if (i == index) {
                listSelected[i] = true; // list m kisi b number pr value change hogi
                selectedLanguage = listLanguage[i];
              } else {
                listSelected[i] = false;
              }
            }
            print('listSelected:-- $listSelected');
            setState(() {

            });
          },
        );
      },
    );
  }
}


