
import 'package:flutter/material.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:read_to_me/AttempTest.dart';


class PickTheWords_VocabularyTest extends StatefulWidget {
  @override
  _PickTheWords_VocabularyTestState createState() => _PickTheWords_VocabularyTestState();
}

class _PickTheWords_VocabularyTestState extends State<PickTheWords_VocabularyTest> {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AttempTest()),
                  );
                },
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
          itemCount: 24,
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
                height: 54,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                      color: HexColor(bg_SecondColor),
                      borderRadius: BorderRadius.circular(2)
                  ),
                child: Text(
                    'Word - '+(index+1).toString(),
                    style:TextStyle(
                      fontFamily: 'times new roman',
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
              ),
              onPressed: () {

              },
            );

          }
      ),
    );
  }
}
