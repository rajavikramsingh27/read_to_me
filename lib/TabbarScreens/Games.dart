

import 'package:flutter/material.dart';


class Games extends StatefulWidget {
  @override
  _GamesState createState() => _GamesState();
}



class _GamesState extends State<Games> {

  var arrCategoryList = [
    'Speaking Words',
    'Speaking Paragraphs',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black.withOpacity(0.2),
                  width: 1
                )
              )
            ),
          child: AppBar(
            elevation: 0,
            leadingWidth: 0,
            backgroundColor: Colors.white,
            title: Text(
              'Games Category',
              style:TextStyle(
                fontFamily: 'times new roman',
                fontWeight: FontWeight.bold,
                color:Colors.black,
                fontSize: 18,
              ),
            ),

          ),
        )
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
                      arrCategoryList[index],
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Favorites2()),
                // );
              },
            );
          }
      ),
    );
  }
}
