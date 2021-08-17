

import 'package:flutter/material.dart';
import 'package:read_to_me/Global/Global.dart';


class DemoScreen extends StatefulWidget {
  @override
  _DemoScreenState createState() => _DemoScreenState();
}



class _DemoScreenState extends State<DemoScreen> {

  var strWrittenTextToShow = '';

  final txtWriteYourTextHere = TextEditingController();

  final fullText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
      // "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
      // "when an unknown printer took a galley of type and scrambled it to make a type "
      // "specimen book. It has survived not only five centuries, but also the leap into "
      // "electronic typesetting, remaining essentially unchanged. It was popularised in "
      // "the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, "
      // "and more recently with desktop publishing software like Aldus PageMaker including "
      // "versions of Lorem Ipsum."
  ;

  List<TextSpan> arrSpanText = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column (
            children: [
              Container(
                  margin: EdgeInsets.only(
                      left: 16, right: 16
                  ),
                  child: TextField(
                    controller: txtWriteYourTextHere,
                    textAlign: TextAlign.left,
                    maxLines: 10,
                    style: TextStyle(
                        fontFamily: 'times new roman',
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight:FontWeight.bold
                    ),
                    decoration: InputDecoration(
                      // border: InputBorder.none,
                      hintText: 'Write your text here...',
                      hintStyle: TextStyle(
                          fontFamily: 'times new roman',
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight:FontWeight.bold
                      ),
                      contentPadding: EdgeInsets.all(20),
                    ),
                    onChanged: (value) {
                      strWrittenTextToShow = value;

                      arrSpanText = mainFunctionality(fullText, strWrittenTextToShow);

                      setState(() {

                      });
                    },


                  )
              ),

              SizedBox(height: 20,),
              // RichText(
              //   textAlign: TextAlign.center,
              //   text: TextSpan(
              //       children: arrSpanText
              //   ),
              // ),
              // Container(
              //   child: RichText(
              //     textAlign: TextAlign.center,
              //     text: TextSpan(
              //         children: arrSpanText
              //     ),
              //   ),
              // ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    left: 16, right: 16,
                    top: 16, bottom: 16,
                  ),
                  padding: EdgeInsets.only(
                    left: 16, right: 16,
                    top: 16, bottom: 16,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: (arrSpanText.length == 0)
                      ? Text(
                    fullText,
                    style: TextStyle(
                        fontFamily: 'times new roman',
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight:FontWeight.bold
                    ),
                  ) : RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        children: arrSpanText
                    ),
                  ),
              )
            ],
          ),
        )
      )
    );
  }

}


