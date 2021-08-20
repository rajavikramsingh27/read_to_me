


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:read_to_me/Global/Global.dart';
import 'package:read_to_me/Global/Constant.dart';



import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_tts/flutter_tts.dart';



import 'dart:async';
import 'dart:math';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class ReadBook extends StatefulWidget {
  Map<String, dynamic> dictReadBooks = {};

  ReadBook(this.dictReadBooks);

  @override
  _ReadBookState createState() => _ReadBookState();
}

class _ReadBookState extends State<ReadBook> {
  FlutterTts flutterTts;

  bool isCurrentLanguageInstalled = false;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;

  String _newVoiceText =
      "Lincoln was born into poverty in a log cabin and was raised on the frontier primarily in Indiana. "
      "He was self-educated and became a lawyer, Whig Party leader, Illinois state legislator, and U.S."
      "Congressman from Illinois. In 1849, he returned to his law practice but became vexed by the opening of additional lands to"
      "slavery as a result of the Kansas–Nebraska Act. He reentered politics in 1854, becoming a leader in the new Republican Party"
      "and he reached a national audience in the 1858 debates against Stephen Douglas. Lincoln ran for President in 1860, sweeping the North"
      "in victory. Pro-slavery elements in the South equated his success with the North's rejection of their right to practice slavery, and southern"
      "states began seceding from the Union. To secure its independence, the new Confederate States fired on Fort Sumter, a U.S. fort in the South"
      "ln called up forces to suppress the rebellion and restore the Union."
  ;

      // 'भारत ने श्रीलंका को वनडे सीरीज के दूसरे मैच में मात दे दी है. कोलंबो में खेले गए इस मुकाबले में टीम इंडिया ने '
      // '3 विकेट से जीत दर्ज की. इसी के साथ उसने वनडे सीरीज पर भी कब्जा कर लिया है.';

// Speech To Text from here

  String read_Listing = 'Read';

  bool _hasSpeech = false;
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = '';
  String lastError = '';
  String lastStatus = '';
  String language = 'en-us'; //'hi-IN';
  int resultListened = 200;
  List<LocaleName> _localeNames = [];
  SpeechToText speech = SpeechToText();

  List<TextSpan> arrSpanText = [];
  List<InlineSpan> arrSpanText_Reading = [];

  String strSpoken = '';
  String str_Will_Speak = '';

  bool isReading = true;
  bool isReading_Tap = true;
  bool isListen_Tap = true;

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;

    if (engine != null) {
      print(engine);
    }

  }


  // Future _speak() async {
  //   await flutterTts.setVolume(volume);
  //   await flutterTts.setSpeechRate(rate);
  //   await flutterTts.setPitch(pitch);
  //
  //   if (_newVoiceText != null) {
  //     if (_newVoiceText.isNotEmpty) {
  //       await flutterTts.awaitSpeakCompletion(true);
  //       await flutterTts.speak(_newVoiceText);
  //     }
  //   }
  //
  // }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future _pause() async {
    print('pausing');
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  Future<void> initSpeechState() async {
    var hasSpeech = await speech.initialize(
        onError: errorListener,
        onStatus: statusListener,
        // debugLogging: true,
        finalTimeout: Duration(minutes: 30)
    );

    // if (hasSpeech) {
    //   _localeNames = await speech.locales();
    //
    //   var systemLocale = await speech.systemLocale();
    //   language = systemLocale?.localeId ?? '';
    // }

    _hasSpeech = hasSpeech;

    setState(() {

    });

  }


  void startListening() {
    lastWords = '';
    lastError = '';

    read_Listing = "Listening...";

    speech.listen(
        onResult: resultListener,
        listenFor: Duration(minutes: 3),
        pauseFor: Duration(minutes: 1),
        partialResults: false,
        localeId: language,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: false,
        listenMode: ListenMode.confirmation
    );


    setState(() {

    });
  }

  void stopListening() {
    speech.stop();
    read_Listing = "Read";

    print('stop listening stop listening stop listening stop listening stop listening stop listening ');

    setState(() {
      level = 0.0;
    });
  }

  void cancelListening() {
    speech.cancel();
    read_Listing = "Read";

    setState(() {
      level = 0.0;
    });
  }



  void soundLevelListener(double level) {
    print('soundLevelListenersoundLevelListenersoundLevelListenersoundLevelListenersoundLevelListener');

    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
    setState(() {
      this.level = level;
    });
  }



  void errorListener(SpeechRecognitionError error) {
    print("Received error status: $error, listening: ${speech.isListening}");

    // stopListening();
    read_Listing = "Read";

    speech.stop();
    flutterTts.stop();

    speech = SpeechToText();
    flutterTts = FlutterTts();

    setState(() {

    });
  }

  void statusListener(String status) {
    setState(() {
      lastStatus = '$status';
    });

  }

  // Speech To Text to here
  @override
  initState() {
    super.initState();

    initTextToSpeech();
    initSpeechState();

    _newVoiceText = widget.dictReadBooks['description'];

    Future.delayed(Duration(microseconds: 100), () {
      history();
    });
  }

  @override
  void dispose() {
    super.dispose();

    speech.stop();
    flutterTts.stop();
  }

  initTextToSpeech() {
    flutterTts = FlutterTts();

    flutterTts.setLanguage(language);
    // flutterTts.setLanguage('en-US');

    if (isAndroid) {
      _getDefaultEngine();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    if (isWeb || isIOS) {
      flutterTts.setPauseHandler(() {
        setState(() {
          print("Paused");
          ttsState = TtsState.paused;
        });
      });

      flutterTts.setContinueHandler(() {
        setState(() {
          print("Continued");
          ttsState = TtsState.continued;
        });
      });
    }

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          title: Text(
            'Books',
            textAlign: TextAlign.left,
            style:TextStyle(
              color:Colors.black,
              fontFamily: 'Times new roman',
              fontSize: 18,
            ),
          ),
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: ClipRRect(
                      borderRadius:BorderRadius.circular(6),
                      child: Container(
                        width: 120,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                        ),
                        child: widget.dictReadBooks["thumbnail"].toString().showImage(),
                      )
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          right: 16
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.dictReadBooks["author"].toString(),
                                  textAlign: TextAlign.left,
                                  style:TextStyle(
                                    color:Colors.black,
                                    fontFamily: 'Times new roman',
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  widget.dictReadBooks["title"].toString(),
                                  textAlign: TextAlign.left,
                                  style:TextStyle(
                                      fontSize: 26,
                                      color:Colors.black,
                                      fontFamily: 'Times new roman',
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Original',
                              textAlign: TextAlign.left,
                              style:TextStyle(
                                  fontSize: 16,
                                  color:Colors.black,
                                  fontFamily: 'Times new roman',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed:() {

                                    },
                                    icon: Image.asset(
                                      'download.png',
                                      height: 26,
                                    )
                                ),
                                IconButton(
                                    onPressed:() {
                                      favorite();
                                    },
                                    icon: Image.asset(
                                      (widget.dictReadBooks['favorite'].toString() == 'true')
                                          ? 'bookmark_1.png'
                                          : 'bookmark-not.png' ,
                                      height: 26,
                                    )
                                ),
                                IconButton(
                                    onPressed:() {

                                    },
                                    icon: Image.asset(
                                      'upload.png',
                                      height: 26,
                                    )
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                  ),
                ],
              ),
              SizedBox(height: 16,),
              Container(
                height: 50,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Visibility(
                      visible: isReading_Tap,
                      child: Expanded(
                        child: Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: HexColor(bg_FirstColor),
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.transparent
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Visibility(
                                  visible: (read_Listing.toLowerCase() == 'read'.toLowerCase())
                                      ? true : false,
                                  child: Image.asset(
                                    'agenda.png',
                                    height: 22,
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  // width:50,
                                  height: 20,
                                  alignment: Alignment.center,
                                  child: Text(
                                    read_Listing,
                                    style: TextStyle(
                                      fontFamily: 'Times new roman',
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),



                            onPressed: () {
                              isReading = true;
                              isReading_Tap = true;
                              isListen_Tap = false;

                              arrSpanText_Reading = mainFunctionality_Reading(true);

                              !_hasSpeech || speech.isListening
                                  ? stopListening()
                                  : startListening();
                            },

                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isListen_Tap,
                      child: Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 16),
                          height: double.infinity,
                          decoration:BoxDecoration(
                              color: HexColor(bg_FirstColor),
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.transparent,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(
                                    'headphones.png',
                                    height: 22,
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  height: 20,
                                  alignment: Alignment.center,
                                  child: Text(
                                    (ttsState == TtsState.playing) ? 'Stop' : 'Listen',
                                    style: TextStyle(
                                      fontFamily: 'Times new roman',
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            onPressed: () {
                              isReading = false;
                              isReading_Tap = false;
                              isListen_Tap = true;

                              setState(() {

                              });
                              (ttsState == TtsState.playing) ? _stop() : speak_WordByWord(flutterTts, _newVoiceText);
                            },
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !(isReading_Tap && isListen_Tap),
                      child: Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 16),
                          height: double.infinity,
                          decoration:BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.transparent,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Stop',
                                    style: TextStyle(
                                      fontFamily: 'Times new roman',
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            onPressed: () {
                              isReading_Tap = true;
                              isListen_Tap = true;

                              stopListening();
                              _stop();
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Visibility(
                visible: !isReading,
                child: Container(
                  margin: EdgeInsets.only(left:20, right:20),
                  child: (arrSpanText.length == 0)
                      ? Text(
                    _newVoiceText,
                    style: TextStyle(
                        fontFamily: 'times new roman',
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight:FontWeight.normal
                    ),
                  ) : RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        children: arrSpanText
                    ),
                  ),


                  /*
                Text(
                  _newVoiceText,
                  style: TextStyle(
                      fontFamily: 'times new roman',
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight:FontWeight.normal
                  ),
                )
                 */

                  // (arrSpanText.length == 0 || arrSpanText_Reading.length == 0)
                  //     ? Text(
                  //   _newVoiceText,
                  //   style: TextStyle(
                  //       fontFamily: 'times new roman',
                  //       fontSize: 16,
                  //       color: Colors.black,
                  //       fontWeight:FontWeight.normal
                  //   ),
                  // ) : isReading ? RichText(
                  //   textAlign: TextAlign.left,
                  //   text: TextSpan(
                  //       children: arrSpanText_Reading
                  //   ),
                  // ) : RichText(
                  //   textAlign: TextAlign.left,
                  //   text: TextSpan(
                  //       children: arrSpanText
                  //   ),
                  // ),
                ),
              ),
              Visibility(
                visible: isReading,
                child: Container(
                  margin: EdgeInsets.only(left:20, right:20),
                  child: (arrSpanText_Reading.length == 0)
                      ? Text(
                    _newVoiceText,
                    style: TextStyle(
                        fontFamily: 'times new roman',
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight:FontWeight.normal
                    ),
                  ) : RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        children: arrSpanText_Reading
                    ),
                  ),


                  /*
                Text(
                  _newVoiceText,
                  style: TextStyle(
                      fontFamily: 'times new roman',
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight:FontWeight.normal
                  ),
                )
                 */

                  // (arrSpanText.length == 0 || arrSpanText_Reading.length == 0)
                  //     ? Text(
                  //   _newVoiceText,
                  //   style: TextStyle(
                  //       fontFamily: 'times new roman',
                  //       fontSize: 16,
                  //       color: Colors.black,
                  //       fontWeight:FontWeight.normal
                  //   ),
                  // ) : isReading ? RichText(
                  //   textAlign: TextAlign.left,
                  //   text: TextSpan(
                  //       children: arrSpanText_Reading
                  //   ),
                  // ) : RichText(
                  //   textAlign: TextAlign.left,
                  //   text: TextSpan(
                  //       children: arrSpanText
                  //   ),
                  // ),
                ),
              ),
            ],
          ),

        )
    );
  }

  favorite()  async {
    try {
      showLoader(context);
      final url = Uri.parse(kBaseURL+'books');
      final params = {
        'id': widget.dictReadBooks['id'],
        'favorite': (widget.dictReadBooks['favorite'].toString() == 'true')
            ? 'false'
            : 'true'
      };

      final response = await http.put(url, body: params);
      Navigator.pop(context);

      if (response.statusCode == 200) {
        final dictResponse = Map<String, dynamic>.from(jsonDecode(response.body));
        dictResponse['message'].toString().showMessage(context, false);

        final dictData = Map<String, dynamic>.from(dictResponse['data']);
        widget.dictReadBooks['favorite'] = dictData['favorite'];

        setState(() {

        });
      } else {

      }
    } on Exception catch (error) {
      print(error);
      // error.message.showMessage(context, true);
    }
  }

  history()  async {
    try {
      final url = Uri.parse(kBaseURL + 'books');
      final params = {
        'id': widget.dictReadBooks['id'],
        'history': 'true'
      };
      final response = await http.put(url, body: params);
    } on Exception catch (error) {
      print(error);
    }
  }

  speak_WordByWord(FlutterTts flutterTts, String fullString) async {
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.6);
    await flutterTts.setPitch(0.45);

    final arrFullString = fullString.split((' '));
    var strWrittenTextToShow = '';

    for (int i = 0; i<arrFullString.length; i++) {
      if (arrFullString[i].isNotEmpty) {
        await flutterTts.awaitSpeakCompletion(true);
        await flutterTts.speak(arrFullString[i]);

        strWrittenTextToShow = strWrittenTextToShow.isEmpty
            ? arrFullString[i]
            : strWrittenTextToShow+' '+arrFullString[i];

        arrSpanText = mainFunctionality(fullString, strWrittenTextToShow);

        setState(() {

        });

      }

    }

    // if (speakWord != null) {
    //   if (speakWord.isNotEmpty) {
    //     await flutterTts.awaitSpeakCompletion(true);
    //     await flutterTts.speak(speakWord);
    //   }
    // }

  }

  List<InlineSpan> mainFunctionality_Reading(bool isSuccess) {
    List<InlineSpan> arrSpanText = [];

    final arrWrittenText = strSpoken.split(' ');

    for (var i = 0; i< arrWrittenText.length; i++) {
      arrSpanText.add(
          TextSpan(
              text: arrWrittenText[i] +' ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'times new roman',
                fontSize: 18,
              )
          )
      );
    }

    var strUnSelectedText = _newVoiceText.replaceAll(
        // strSpoken,
        strSpoken.isEmpty ? strSpoken : strSpoken+' ',
        ''
    );

    final arrUnSelectedText = strUnSelectedText.split(' ');

    str_Will_Speak = arrUnSelectedText[0];

    for (var i = 0; i< arrUnSelectedText.length; i++) {
      arrSpanText.add(
          TextSpan(
              text: (!isSuccess && i == 0)
                  ? arrUnSelectedText[i]
                  : arrUnSelectedText[i] +' ',
              style: TextStyle(
                color: (i == 0) ? (isSuccess ? Colors.blue : Colors.red) : Colors.black,
                fontWeight: (i == 0) ? FontWeight.bold : FontWeight.normal,
                fontFamily: 'times new roman',
                fontSize: 18,
              ),
            recognizer: TapGestureRecognizer()..onTap = () async {
              await flutterTts.awaitSpeakCompletion(true);
              await flutterTts.speak(str_Will_Speak);
            },
          )
      );

      if (!isSuccess && i == 0) {
        arrSpanText.add(
            WidgetSpan(
              child: GestureDetector(
                child: Image.asset(
                  'speeker_Red.png',
                  height: 16,
                ),
                onTap: () async {
                  await flutterTts.awaitSpeakCompletion(true);
                  await flutterTts.speak(str_Will_Speak);
                },
              )
            )
        );

        arrSpanText.add(
            TextSpan(
                text: ' ',
            )
        );

      }
    }

    if (isSuccess) {
      stopListening();
      startListening();
    } else {
      stopListening();
    }

    return arrSpanText;
  }

  void resultListener(SpeechRecognitionResult result) {
    // print('resultListenerresultListenerresultListenerresultListenerresultListenerresultListenerresultListener');

    ++resultListened;

    lastWords = '${result.recognizedWords} - ${result.finalResult}';

    // print('recognizedWords:--- '+result.recognizedWords);
    // print('str_Will_Speak:--- '+str_Will_Speak);
    // print(result.recognizedWords == str_Will_Speak);

    read_Listing = "Read";

    if (result.recognizedWords == str_Will_Speak) {
      strSpoken = strSpoken.isEmpty ? result.recognizedWords : strSpoken+' '+result.recognizedWords;

      arrSpanText_Reading = mainFunctionality_Reading(true);

      setState(() {

      });
    } else if (result.recognizedWords != str_Will_Speak) {
      arrSpanText_Reading = mainFunctionality_Reading(false);

      setState(() {

      });
    }

  }

}



enum TtsState {
  playing, stopped, paused, continued
}
