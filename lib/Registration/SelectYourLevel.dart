

import 'package:flutter/material.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:read_to_me/Registration/SelectYourCategory.dart';
import 'package:http/http.dart' as http;


class SelectYourLevel extends StatefulWidget {
  @override
  _SelectYourLevelState createState() => _SelectYourLevelState();
}

class _SelectYourLevelState extends State<SelectYourLevel> {
  List<bool> listSelected = [false, false,false,];
  String selectedLevel = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
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
                      'Select Your Level',
                      style: TextStyle(
                          fontFamily: 'times new roman',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(width: 50,)
                  ],
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height
                      - MediaQuery
                          .of(context)
                          .padding
                          .bottom
                      - 92 - 100,
                  child: _gridView(context),
                ),
                Container(
                  width: 320,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: FlatButton(
                    minWidth: double.infinity,
                    height: double.infinity,
                    onPressed: () {
                      selectedLevel.isNotEmpty ? apiUserUpdate() : print('');
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          fontFamily: 'times new roman',
                          color: Colors.black,
                          fontSize: 20
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

  apiUserUpdate() async {
    showLoader(context);

    final params = {
      'id':kUserID,
      'level': selectedLevel,
    };

    final response = await http.put(
        Uri.parse(kBaseURL+'user'),
        body: params
    );

    Navigator.pop(context);

    if(response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SelectYourCategory()),
      );
    } else {
      'Error! \nSomething Went Wrong!'.showMessage(context, true);
    }
  }

  Widget _gridView(context) {

    List<String> listLevel = [
      'Beginner','Intermediate','Advanced'
    ];

    return GridView.builder(
      itemCount: listLevel.length,
      padding: EdgeInsets.only(
          top: 30,bottom: 30,
          left: 10,right: 10
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 4,
        childAspectRatio: 3,
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
                  listLevel[index],
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
            print('listSelected:-- $listSelected');

            // for loop
            for (int i = 0; i<listSelected.length; i++) {
              if (i == index) {
                listSelected[i] = true; // list m kisi b number pr value change hogi
                selectedLevel = listLevel[i];
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











