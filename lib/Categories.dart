

import 'package:flutter/material.dart';
import 'package:read_to_me/LibraryMore.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class Categories extends StatefulWidget {
  String strType;
  Categories(this.strType);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  var arrCategoryList = [];

  category() async {
    showLoader(context);

    String endPointAPI = '';

    if (widget.strType.toLowerCase() == 'category'.toLowerCase()) {
      endPointAPI = 'category';
    } else if (widget.strType.toLowerCase() == 'geners'.toLowerCase()) {
      endPointAPI = 'geners';
    } else if (widget.strType.toLowerCase() == 'difficulty'.toLowerCase()) {
      endPointAPI = 'difficulty';
    }

    var url = Uri.parse(kBaseURL+endPointAPI);
    final response = await http.get(url,);
    print(response.body);

    Navigator.pop(context);

    if (response.statusCode == 200) {
      final resbody = jsonDecode(response.body);
      arrCategoryList = List<Map<String, dynamic>>.from(resbody);

      setState(() {

      });
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
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Column(
          children: [
            AppBar(
              brightness: Brightness.light,
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                widget.strType,
                style:TextStyle(
                  fontWeight: FontWeight.normal,
                  color:Colors.black,
                  fontFamily: 'Times new roman',
                  fontSize: 18,
                ),
              ),
              leading: BackButton(
                color: Colors.black,
              ),
            ),
            Container(
              height: 1,
              color: Colors.black,
            )
          ],
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: arrCategoryList.length,
          itemBuilder: (context, index) {
            return FlatButton(
              padding: EdgeInsets.zero,
              child: Container(
                padding: EdgeInsets.only(
                    left: 20, right: 20,
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
                    Text(
                      arrCategoryList[index]['title'],
                      style:TextStyle(
                        color: Colors.black,
                        fontFamily: 'Times new roman',
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LibraryMore(
                      widget.strType,
                      arrCategoryList[index]['title']),
                  ),
                );
              },
            );
          }
      ),
    );
  }
}
