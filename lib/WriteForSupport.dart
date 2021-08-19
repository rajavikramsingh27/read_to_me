

import 'package:flutter/material.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class WriteForSupport extends StatefulWidget {
  @override
  _WriteForSupportState createState() => _WriteForSupportState();
}

class _WriteForSupportState extends State<WriteForSupport> {

  final txtEmail = TextEditingController();
  final txtMessage = TextEditingController();

  returnFunction() {
    return;
  }

  support() async {
    showLoader(context);
    final url = Uri.parse(kBaseURL+'support');
    final params = {
      'email': txtEmail.text,
      'message': txtMessage.text
    };

    final response = await http.post(
      url, body: params
    );

    Navigator.pop(context);

    if (response.statusCode == 200) {
       final dictResponse = Map<String, dynamic>.from(jsonDecode(response.body));
       dictResponse['message'].toString().showMessage(context, true);

       Future.delayed(Duration(seconds: 1), () {
         Navigator.pop(context);
       });
    } else {
      'Error! \n Something went wrong'.showMessage(context, true);
    }
  }

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
                color: Colors.black45,
                width: 1
              )
            )
          ),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            centerTitle: true,
            title: Text(
              'Write For Support',
              style:TextStyle(
                fontFamily: 'times new roman',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            leading: BackButton(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 30,
                right: 30
              ),
              child: TextField(
                controller: txtEmail,
                style:TextStyle(
                  fontFamily: 'times new roman',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 1
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1
                    ),
                  ),
                  hintText: 'Enter your email',
                  contentPadding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 30,
                  right: 30
              ),
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: TextField(
                controller: txtMessage,
                maxLines: 10,
                style:TextStyle(
                  fontFamily: 'times new roman',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Type your message here...',
                  contentPadding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              padding: EdgeInsets.zero,
              child: Container(
                height: 54,
                width: 200,
                // margin: EdgeInsets.only(
                //     left: 20,
                //     right: 20
                // ),
                decoration: BoxDecoration(
                  color: HexColor(bg_SecondColor),
                  borderRadius: BorderRadius.circular(27),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Send',
                  style:TextStyle(
                    fontFamily: 'Times new roman',
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),

              onPressed: () {
                if (txtEmail.text.isEmpty) {
                  'Enter a email-ID'.showMessage(context, true);
                } else if (!txtEmail.text.isValidEmail()) {
                  'Enter a valid email-ID'.showMessage(context, true);
                } else if (txtMessage.text.isEmpty) {
                  'Enter a message about support'.showMessage(context, true);
                } else {
                  support();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
