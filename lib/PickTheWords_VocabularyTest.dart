
import 'package:flutter/material.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:read_to_me/AttempTest.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PickTheWords_VocabularyTest extends StatefulWidget {
  @override
  _PickTheWords_VocabularyTestState createState() => _PickTheWords_VocabularyTestState();
}

class _PickTheWords_VocabularyTestState extends State<PickTheWords_VocabularyTest> {

  List<bool> arrSelect = [];

  List<Map<String, dynamic>> arrAttemtTest = [];
  Map<String, dynamic> dictTestDetails;

  attemtTest() async {
    showLoader(context);
    final url = Uri.parse(kBaseURL+'attemt_test');
    final response = await http.get(url,);
    Navigator.pop(context);

    if (response.statusCode == 200) {
      final resbody = jsonDecode(response.body);
      arrAttemtTest = List<Map<String, dynamic>>.from(resbody);

      for (int i = 0; i<arrAttemtTest.length; i++) {
        arrSelect.add(false);
      }
      print(arrSelect);

      setState(() {

      });
    } else {
      'Error \nSomething Went Wrong'.showMessage(context, true);
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(microseconds: 100), () {
      attemtTest();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            brightness: Brightness.light,
            leading: BackButton(
              color: HexColor(bg_SecondColor),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.check_rounded,
                  color: Colors.green,
                  size: 30,
                ),
                onPressed: () {

                  dictTestDetails.isNotEmpty ? Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AttempTest(dictTestDetails)),
                  ) : null;                },
              )
            ],
            title: Text(
              'Pick The Words You Know',
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
      body: ListView.separated(
          itemCount: arrAttemtTest.length,
          separatorBuilder:(context,index) {
            return SizedBox(
              height: 6,
            );
            },
          padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 20,
              bottom: 20
          ),
          itemBuilder:(context,index) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.all(0)
              ),

              child: Container(
                // height: 54,
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  left: 10 , top: 10, bottom: 10
                ),
                decoration: BoxDecoration(
                  color: arrSelect[index] ? HexColor(bg_SecondColor) : Colors.white,
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                    color: HexColor(bg_SecondColor),
                    width: 1
                  )
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ('(')+(index+1).toString() +'.) ',
                      style:TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        // color: !arrSelect[index] ? HexColor(bg_SecondColor) : Colors.white,
                        fontFamily: 'times new roman',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Title:- ',
                              style:TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                // color: !arrSelect[index] ? HexColor(bg_SecondColor) : Colors.white,
                                fontFamily: 'times new roman',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              arrAttemtTest[index]['title'].toString(),
                              style:TextStyle(
                                fontSize: 16,
                                // color: Colors.black,
                                color: !arrSelect[index] ? HexColor(bg_SecondColor) : Colors.white,
                                fontFamily: 'times new roman',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text(
                              'Difficulty:- ',
                              style:TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                // color: !arrSelect[index] ? HexColor(bg_SecondColor) : Colors.white,
                                fontFamily: 'times new roman',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              arrAttemtTest[index]['difficulty'].toString(),
                              style:TextStyle(
                                fontSize: 16,
                                // color: Colors.black,
                                color: !arrSelect[index] ? HexColor(bg_SecondColor) : Colors.white,
                                fontFamily: 'times new roman',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ),

              onPressed: () {
                dictTestDetails = arrAttemtTest[index];

                for (int i = 0; i<arrSelect.length; i++) {
                  arrSelect[i] = (i == index) ? true : false;
                }

                setState(() {

                });
              },

            );

          }
      ),
    );
  }
}
