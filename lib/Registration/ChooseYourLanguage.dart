

import 'package:flutter/material.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:read_to_me/Registration/SelectYourAge.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:http/http.dart' as http;


class ChooseYourLanguage extends StatefulWidget {
  @override
  _ChooseYourLanguageState createState() => _ChooseYourLanguageState();
}

class _ChooseYourLanguageState extends State<ChooseYourLanguage> {
  List<bool> listSelected = [false, false,false,false, false]; // make a list of bool value

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
                    'Choose Your Language',
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
                  onPressed: () async {
                    if (selectedLanguage.isNotEmpty) {
                      apiUserUpdate();
                    }
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

  apiUserUpdate() async {
    showLoader(context);

    final params = {
      'id':kUserID,
      'language': selectedLanguage,
      'total_attempt' : '0',
      'total_learned' : '0'
    };

    final response = await http.put(
        Uri.parse(kBaseURL+'user'),
        body: params
    );

    Navigator.pop(context);

    if(response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SelectYourAge()),
      );
    } else {
      'Error! \nSomething Went Wrong!'.showMessage(context, true);
    }
  }

  Widget _gridView(context) {

    List<String> listLanguage = [
      'English','Spenish','Dutch','Chinese','Japanese'
    ];

    return GridView.builder(
      itemCount: listLanguage.length,
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
            print('listSelected:-- $listSelected');

            // for loop
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



