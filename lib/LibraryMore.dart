

import 'package:flutter/material.dart';
import 'package:read_to_me/ReadBook.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LibraryMore extends StatefulWidget {
  String strType;
  String strValue;
  LibraryMore(this.strType, this.strValue);

  @override
  _LibraryMoreState createState() => _LibraryMoreState();
}



class _LibraryMoreState extends State<LibraryMore> {
  var isBooks = false;

  var arrList = [];

  category() async {
    showLoader(context);

    String endPointAPI = '';
    Map<String, dynamic> params = {};
    var response;
    var url;

    if (widget.strType.toLowerCase() == 'category'.toLowerCase()) {
      endPointAPI = 'category/books';
      params = {
        'category': widget.strValue
      };

      url = Uri.parse(kBaseURL+endPointAPI);
      response = await http.post(url,body: params);
    } else if (widget.strType.toLowerCase() == 'geners'.toLowerCase()) {
      endPointAPI = 'geners/books';
      params = {
        'geners': widget.strValue
      };

      url = Uri.parse(kBaseURL+endPointAPI);
      response = await http.post(url,body: params);
    } else if (widget.strType.toLowerCase() == 'Difficulty'.toLowerCase()) {
      endPointAPI = 'difficulty/books';
      params = {
        'difficulty': widget.strValue
      };

      url = Uri.parse(kBaseURL+endPointAPI);
      response = await http.post(url,body: params);
    }  else if (widget.strType.toLowerCase() == 'favorite'.toLowerCase()) {
      endPointAPI = 'favorite';
      url = Uri.parse(kBaseURL+endPointAPI);
      response = await http.get(url,);
    } else if (widget.strType.toLowerCase() == 'history'.toLowerCase()) {
      endPointAPI = 'history';
      url = Uri.parse(kBaseURL+endPointAPI);
      response = await http.get(url,);
    } else if (widget.strType.toLowerCase() == 'Books'.toLowerCase()) {
      endPointAPI = 'books';
      url = Uri.parse(kBaseURL+endPointAPI);
      response = await http.get(url,);
    } else if (widget.strType.toLowerCase() == 'Short Books'.toLowerCase()) {
      endPointAPI = 'short_story';
      url = Uri.parse(kBaseURL+endPointAPI);
      response = await http.get(url,);
    }

    Navigator.pop(context);

    if (response.statusCode == 200) {
      final resbody = jsonDecode(response.body);
      arrList = List<Map<String, dynamic>>.from(resbody);
      print(arrList);

      setState(() {

      });
    } else {
      print('Error! \nSomething Went Wrong');
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 100), () {
      category();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height ,
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
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white.withOpacity(0.4),
                    width: 1
                  )
                )
              ),
              child: SafeArea(
                bottom: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButton(
                      color: Colors.white,
                    ),
                    Container(
                      // width:110,
                      // color: Colors.red,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.strType,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'times new roman',
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container (
                      width: 50,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: heightContainer(context),
              child: ListView.separated(
                  itemCount: arrList.length,
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 10,
                    );
                  },
                  itemBuilder: (context,index) {
                    return Container(
                        padding: EdgeInsets.only(left: 10, right: 10,bottom: 16),
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white.withOpacity(0.5),
                              width: 1
                            )
                          )
                        ),
                        child: FlatButton(
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: 100,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.4),
                                  ),
                                  child: arrList[index]["thumbnail"].toString().showImage(),
                                )
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                  child: Container(
                                    height: 120,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              arrList[index]['author'],
                                              textAlign: TextAlign.left,
                                              style:TextStyle(
                                                color:Colors.white.withOpacity(0.7),
                                                fontFamily: 'Times new roman',
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: 6),
                                            Text(
                                              arrList[index]['title'],
                                              textAlign: TextAlign.left,
                                              style:TextStyle(
                                                color:Colors.black,
                                                fontFamily: 'Times new roman',
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          arrList[index]['difficulty'],
                                          textAlign: TextAlign.left,
                                          style:TextStyle(
                                              fontSize: 18,
                                              color:Colors.lightBlueAccent,
                                              fontFamily: 'Times new roman',
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ReadBook(arrList[index])),
                            );
                          },
                        )
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
