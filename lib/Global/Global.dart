

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:iphone_has_notch/iphone_has_notch.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:read_to_me/Global/Constant.dart';
import 'package:toast/toast.dart';



class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}


double heightContainer(context) {
  return (Platform.isIOS)
      ? MediaQuery.of(context).size.height
      - (IphoneHasNotch.hasNotch ? MediaQuery.of(context).viewPadding.top : 0)
      - (IphoneHasNotch.hasNotch ? 129 : 114)
      : MediaQuery.of(context).size.height-138;
}

// launchURL(String _url) async {
//   await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
// }

 void launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

showLoader(context) {
  showModalBottomSheet(
      context: context,
      backgroundColor:Colors.transparent,
      builder: (context) {
        return Align(
          alignment: Alignment.topCenter,
          child: LoadingBouncingLine.circle(
            size: 80.0,
            borderSize: 0,
            borderColor: Colors.transparent,
            backgroundColor: HexColor(bg_BlueColor),
            duration: Duration(seconds:1),
          ),
        );
      }
    );
}

Widget showLoader_1(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 1)),
      builder: (ctx, snapshot) {
        return CircularProgressIndicator(
              semanticsLabel: 'Linear progress indicator',
              color: Colors.red,
              backgroundColor: Colors.blue,
            );
      }
    );
  }

List<TextSpan> mainFunctionality(String fullText, String strWrittenTextToShow) {
  List<TextSpan> arrSpanText = [];

  final arrWrittenText = strWrittenTextToShow.split(' ');

  for (var i = 0; i< arrWrittenText.length; i++) {
    arrSpanText.add(
        TextSpan(
            text: (i == arrWrittenText.length-1) ? arrWrittenText[i] : arrWrittenText[i] +' ',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontFamily: 'times new roman',
              fontSize: 18,
            )
        )
    );
  }

  var strUnSelectedText = fullText.replaceAll(strWrittenTextToShow, '');
  final arrUnSelectedText = strUnSelectedText.split(' ');

  for (var i = 0; i< arrUnSelectedText.length; i++) {
    arrSpanText.add(
        TextSpan(
            text: arrUnSelectedText[i] +' ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontFamily: 'times new roman',
              fontSize: 18,
            )
        )
    );
  }

  // for (var i = 0; i< arrFullTtext.length; i++) {
  //   arrSpanText.add(
  //       TextSpan(
  //           text: arrFullTtext[i] +' ',
  //           style: TextStyle(
  //             color: Colors.black,
  //             fontWeight: FontWeight.bold,
  //             fontFamily: 'times new roman',
  //             fontSize: 18,
  //           )
  //       )
  //   );
  // }



  // for (var i = 0; i< arrWrittenText.length; i++) {
  //   for (var j = 0; j< arrFullTtext.length; j++) {
  //     if (arrWrittenText[i].toLowerCase() == arrFullTtext[j].toLowerCase()) {
  //       arrSpanText[j] = TextSpan(
  //           text: arrFullTtext[j] +' ',
  //           style: TextStyle(
  //             fontSize: 18,
  //             color: Colors.blue,
  //             fontWeight: FontWeight.bold,
  //             fontFamily: 'times new roman',
  //           )
  //       );
  //     }
  //   }
  // }


  return arrSpanText;
}

extension MessageSnackBar on String {

  showMessage(context, bool isError) {
    Toast.show(
        this,
        context,
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: 3,
        gravity:  Toast.TOP
    );
  }

  showImage() {
    return this.isNotEmpty
        ? Image(
      height: double.infinity,
      width: double.infinity,
      image: NetworkImage(this, ),
      fit: BoxFit.fill,
    ) : Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12
      ),
    ) ;
  }

  isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

}

