
import 'package:flutter/material.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:read_to_me/LibraryMore.dart';
import 'package:read_to_me/ReadBook.dart';
import 'package:read_to_me/Categories.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  List<Map<String, dynamic>> arrBooks = [];
  List<Map<String, dynamic>> arrShort_story = [];
  List<Map<String, dynamic>> arrCollection = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    Future.delayed(Duration(microseconds: 100), () {
      books();
      short_story();
      collection();
    });
  }

  books() async {
    showLoader(context);
    var url = Uri.parse(kBaseURL+'books');
    final response = await http.get(
      url,
    );

    Navigator.pop(context);

    if (response.statusCode == 200) {
      final resbody = jsonDecode(response.body);
      arrBooks = List<Map<String, dynamic>>.from(resbody);

      setState(() {

      });
    }
  }

  short_story() async {
    showLoader(context);
    var url = Uri.parse(kBaseURL+'short_story');
    final response = await http.get(
      url,
    );

    Navigator.pop(context);

    if (response.statusCode == 200) {
      final resbody = jsonDecode(response.body);
      arrShort_story = List<Map<String, dynamic>>.from(resbody);

      setState(() {

      });
    }
  }

  collection() async {
    showLoader(context);
    var url = Uri.parse(kBaseURL+'collection');
    final response = await http.get(
      url,
    );

    Navigator.pop(context);

    if (response.statusCode == 200) {
      final resbody = jsonDecode(response.body);
      arrCollection = List<Map<String, dynamic>>.from(resbody);

      setState(() {

      });
    }
  }

  var arrCategoryList = [
    'Category', 'Geners', 'Difficulty', 'Favorite', 'History'
  ];

  var arrCategoryIcon = [
    Icons.category_rounded,
    Icons.audiotrack,
    Icons.emoji_emotions,
    Icons.directions_ferry,
    Icons.save,
    Icons.cloud_download_rounded,
    Icons.history,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
          // padding: EdgeInsets.only(
          //   left: 16,
          //   right: 16,
          // ),
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
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 16,
                    right: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Library',
                        style:TextStyle(
                          fontFamily: 'times new roman',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height:24,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            alignment: Alignment.centerRight,
                            onPrimary: Colors.white,
                            primary: Colors.transparent,
                            onSurface: Colors.grey,
                            padding: EdgeInsets.zero,
                            elevation: 0,
                          ),
                          child:Image.asset(
                            'magnifying-glass.png',
                            color:Colors.white,
                            // height: 30,
                          ),
                          onPressed: () {

                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    width:MediaQuery.of(context).size.width,
                    height:heightContainer(context),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                          bottom: 30
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child:Text(
                                    'Books',
                                    style:TextStyle(
                                      color:Colors.white,
                                      fontFamily: 'Times new roman',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        alignment: Alignment.centerRight,
                                        onPrimary: Colors.white,
                                        primary: Colors.transparent,
                                        onSurface: Colors.grey,
                                        elevation: 0,
                                      ),
                                      child: Text(
                                        'MORE',
                                        textAlign: TextAlign.right,
                                        style:TextStyle(
                                          color:Colors.white,
                                          fontFamily: 'Times new roman',
                                          fontSize: 14,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => LibraryMore('Books', '')),
                                        );
                                      }
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 300,
                            child: ListView.separated(
                                padding: EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                ),
                                itemCount: arrBooks.length,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: 10,
                                  );
                                },

                                itemBuilder: (context,index) {
                                  return FlatButton(
                                    padding: EdgeInsets.zero,
                                    child: Container(
                                        width: 160,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Container(
                                                height: 230,
                                                child: arrBooks[index]["thumbnail"].toString().showImage(),
                                              )
                                            ),
                                            SizedBox(
                                              height:16,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                left: 10, right: 10
                                              ),
                                              child: Text(
                                                arrBooks[index]["author"],
                                                textAlign: TextAlign.left,
                                                style:TextStyle(
                                                  color:Colors.white,
                                                  fontFamily: 'Times new roman',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10
                                              ),
                                              child: Text(
                                                arrBooks[index]["title"],
                                                textAlign: TextAlign.left,
                                                style:TextStyle(
                                                  color:Colors.white,
                                                  fontFamily: 'Times new roman',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),

                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ReadBook(arrBooks[index])),
                                      );
                                    },
                                  );
                                }),
                          ),
                          SizedBox(height:16,),
                          Container(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child:Text(
                                    'Short Books',
                                    style:TextStyle(
                                      color:Colors.white,
                                      fontFamily: 'Times new roman',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        alignment: Alignment.centerRight,
                                        onPrimary: Colors.white,
                                        primary: Colors.transparent,
                                        onSurface: Colors.grey,
                                        elevation: 0,
                                      ),
                                      child: Text(
                                        'MORE',
                                        style:TextStyle(
                                          color:Colors.white,
                                          fontFamily: 'Times new roman',
                                          fontSize: 15,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => LibraryMore('Short Books', '')),
                                        );
                                      }
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 300,
                            child: ListView.separated(
                                padding: EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                ),
                                itemCount: arrShort_story.length,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: 10,
                                  );
                                },

                                itemBuilder: (context,index) {
                                  return FlatButton(
                                    padding: EdgeInsets.zero,
                                    child: Container(
                                        width: 160,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(10),
                                        ),

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect (
                                              borderRadius: BorderRadius.circular(10),
                                              child: Container(
                                                  height: 230,
                                                child: arrBooks[index]["thumbnail"].toString().showImage(),
                                              ),
                                            ),
                                            SizedBox(
                                              height:16,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10
                                              ),
                                              child: Text(
                                                arrShort_story[index]["author"],
                                                textAlign: TextAlign.left,
                                                style:TextStyle(
                                                  color:Colors.white,
                                                  fontFamily: 'Times new roman',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10
                                              ),
                                              child: Text(
                                                arrShort_story[index]["title"],
                                                textAlign: TextAlign.left,
                                                style:TextStyle(
                                                  color:Colors.white,
                                                  fontFamily: 'Times new roman',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ReadBook(arrShort_story[index])),
                                      );
                                    },
                                  );
                                }),

                          ),

                          SizedBox(height:30,),
                          Container(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                            ),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Collections',
                              style:TextStyle(
                                color:Colors.white,
                                fontFamily: 'Times new roman',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height:20,),
                          Container(
                            height: 200,
                            child: ListView.separated(
                                padding: EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                ),
                                itemCount: arrCollection.length,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: 10,
                                  );
                                },
                                itemBuilder: (context,index) {
                                  return FlatButton(
                                    padding: EdgeInsets.zero,
                                    child:Container(
                                        width: 300,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.grey.withOpacity(0.6),
                                            // border: Border.all(
                                            //     color: Colors.black,
                                            //     width: 1
                                            // )
                                        ),
                                        child: Stack(
                                          children: [
                                            ClipRRect (
                                              borderRadius: BorderRadius.circular(10),
                                              child: arrCollection[index]["thumbnail"].toString().showImage(),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                arrCollection[index]['title'],
                                                textAlign: TextAlign.center,
                                                style:TextStyle(
                                                    fontSize: 16,
                                                    color:Colors.white,
                                                    fontFamily: 'Times new roman',
                                                    fontWeight: FontWeight.bold
                                                ),),
                                            )
                                          ],
                                        )
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ReadBook(arrCollection[index])),
                                      );
                                    },
                                  );
                                }),
                          ),
                          SizedBox(height:16,),
                          ListView.builder(
                              padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                              ),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: arrCategoryList.length,
                              itemBuilder: (context, index) {
                                return FlatButton(
                                  padding: EdgeInsets.zero,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 16, bottom: 16
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.white.withOpacity(
                                                    (index == 0) ? 0.6 : 0
                                                )
                                            )
                                        )
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              arrCategoryIcon[index],
                                              color: Colors.white.withOpacity(0.7),
                                            ),
                                            SizedBox(width:10,),
                                            Text(
                                              arrCategoryList[index],
                                              style:TextStyle(
                                                color: Colors.white.withOpacity(0.8),
                                                fontFamily: 'Times new roman',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),

                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: Colors.white.withOpacity(0.7),
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  onPressed: () {
                                    if (index == 3 || index ==  4 || index == 5) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LibraryMore(arrCategoryList[index], '')
                                        ),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Categories(arrCategoryList[index])),
                                      );
                                    }
                                  },
                                );
                              }
                          ),
                        ],

                      ),
                    )
                ),
              ],
            ),
          )
      )
    );
  }
}
