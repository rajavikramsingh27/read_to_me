


import 'package:flutter/material.dart';
import 'package:read_to_me/TabbarScreens/Games.dart';
import 'package:read_to_me/TabbarScreens/Library.dart';
import 'package:read_to_me/TabbarScreens/Courses.dart';
import 'package:read_to_me/TabbarScreens/Words.dart';
import 'package:read_to_me/TabbarScreens/Setting.dart';
import 'package:iphone_has_notch/iphone_has_notch.dart';



class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}



class _BottomNavBarState extends State<BottomNavBar> {
  var selectedIndex = 0;
  double iconWidth = 24;

  double leftSpace = 4;
  double bottomNavBarFontSize = 14;

  bottomNavBarFontStyle() {
    return TextStyle(
      fontFamily: 'times new roman',
      fontSize: bottomNavBarFontSize,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    );
  }

  var arrScreens = [
    Courses(),
    Library(),
    // Games(),
    Words(),
    Setting(),
  ];

  selectedTab(int selected) {
    selectedIndex = selected;

    setState(() {

    });

  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        arrScreens[selectedIndex],
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: SafeArea(
            bottom: (IphoneHasNotch.hasNotch ? true : false),
            child: Container(
              height: 56,
              margin: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 6,
              ),
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16
              ),
              decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(0, 0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(32)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                      onPrimary: Colors.white,
                      primary: Colors.transparent,
                      onSurface: Colors.grey,
                      elevation: 0,
                    ),
                    child: Row(
                      children: [
                        (selectedIndex == 0)
                            ? Image.asset(
                          "degree.png",
                          color: Colors.white,
                          height: iconWidth,
                        )
                            : Image.asset(
                          'degreeUnselected.png',
                          height:iconWidth,
                        ),
                        Visibility(
                          visible: (selectedIndex == 0) ? true : false,
                          child:Container(
                            padding: EdgeInsets.only(
                                left: leftSpace
                            ),
                            child: Text(
                              'Courses',
                              style:bottomNavBarFontStyle(),
                            ),
                          ),
                        )
                      ],
                    ),
                    onPressed: () {
                      selectedTab(0);
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                      onPrimary: Colors.white,
                      primary: Colors.transparent,
                      onSurface: Colors.grey,
                      elevation: 0,
                    ),
                    child: Row(
                      children: [
                        (selectedIndex == 1)
                            ? Image.asset(
                          "courses.png",
                          color: Colors.white,
                          height: iconWidth,
                        )
                            : Image.asset(
                          'coursesUnselected.png',
                          height:iconWidth,
                        ),
                        Visibility(
                          visible: (selectedIndex == 1) ? true : false,
                          child:Container(
                            padding: EdgeInsets.only(
                                left: leftSpace
                            ),
                            child: Text(
                              'Library',
                              style:bottomNavBarFontStyle(),
                            ),
                          ),
                        )
                      ],
                    ),
                    onPressed: () {
                      selectedTab(1);
                    },
                  ),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     padding: EdgeInsets.zero,
                  //     alignment: Alignment.center,
                  //     onPrimary: Colors.white,
                  //     primary: Colors.transparent,
                  //     onSurface: Colors.grey,
                  //     elevation: 0,
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       (selectedIndex == 2)
                  //           ? Image.asset(
                  //         "games.png",
                  //         color: Colors.white,
                  //         height: iconWidth,
                  //       )
                  //           : Image.asset(
                  //         'gamesUnselected.png',
                  //         height:iconWidth,
                  //       ),
                  //       Visibility(
                  //         visible: (selectedIndex == 2) ? true : false,
                  //         child:Container(
                  //           padding: EdgeInsets.only(
                  //               left: leftSpace
                  //           ),
                  //           child: Text(
                  //             'Games',
                  //             style:bottomNavBarFontStyle(),
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  //   onPressed: () {
                  //     selectedTab(2);
                  //   },
                  // ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                      onPrimary: Colors.white,
                      primary: Colors.transparent,
                      onSurface: Colors.grey,
                      elevation: 0,
                    ),
                    child: Row(
                      children: [
                        (selectedIndex == 2)
                            ? Image.asset(
                          'chatSelected.png',
                          color: Colors.white,
                          height: iconWidth,
                        )
                            : Image.asset(
                          'chatUnselected.png',
                          height:iconWidth,
                        ),
                        Visibility(
                          visible: (selectedIndex == 2) ? true : false,
                          child:Container(
                            padding: EdgeInsets.only(
                                left: leftSpace
                            ),
                            child: Text(
                              'Words',
                              style:bottomNavBarFontStyle(),
                            ),
                          ),
                        )
                      ],
                    ),
                    onPressed: () {
                      selectedTab(2);
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                      onPrimary: Colors.white,
                      primary: Colors.transparent,
                      onSurface: Colors.grey,
                      elevation: 0,
                    ),
                    child: Row(
                      children: [
                        (selectedIndex == 3)
                            ? Image.asset(
                          "settings.png",
                          color: Colors.white,
                          height: iconWidth,
                        )
                            : Image.asset(
                          'settingsUnselected.png',
                          height:iconWidth,
                        ),
                        Visibility(
                          visible: (selectedIndex == 3) ? true : false,
                          child:Container(
                            padding: EdgeInsets.only(
                                left: leftSpace
                            ),
                            child: Text(
                              'Settings',
                              style:bottomNavBarFontStyle(),
                            ),
                          ),
                        )
                      ],
                    ),
                    onPressed: () {
                      selectedTab(3);
                    },
                  ),
                ],
              ),
            ),
          )
        )
      ],
    );
  }

}


