import 'package:flutter/material.dart';
import 'package:flutter_exam1212/base/keyboard.dart';
import 'package:flutter_exam1212/base/logger.dart';
import 'package:flutter_exam1212/menu_two.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();

}




class _MenuState extends State<Menu> with WidgetsBindingObserver {

//  // 스크롤  컨트롤러 추가
//  ScrollController _scrollController;

//  bool keyboard_flag = false;
 // bool button_flag = false;
//  final FocusNode focusNode = new FocusNode();

  ////////////////////////////////////////////////////////////////////////////////
  Keyboard keyboard;
  bool buttonFlag = false;
  ////////////////////////////////////////////////////////////////////////////////
  // 로그
  //LoggerPrint logger = LoggerPrint();

  Logger logger;

  TextEditingController _textController;
  @override
  void initState() {
    super.initState();

    print('시작시작시작시작0000000000000');
    //logger = Logger(context);
    //developer.log('log me', name: 'my.app.category');



//    _scrollController = ScrollController();
//    _scrollController.addListener(_scrollListener);
//    WidgetsBinding.instance.addObserver(this);
  ////////////////////////////////////////////////////////////////////////////////
  keyboard = Keyboard(context: this, textFieldCount: 1, scrollView: true, scrollControllerHeight: 800);
  ////////////////////////////////////////////////////////////////////////////////


    _textController = TextEditingController();

  }


  @override
  void dispose() {
//    WidgetsBinding.instance.removeObserver(this);
//    focusNode.dispose();
//    _scrollController.dispose()

  //logger.log(message: 'RMXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
  ////////////////////////////////////////////////////////////////////////////////
  keyboard.dispose();
  ////////////////////////////////////////////////////////////////////////////////
    super.dispose();

  _textController.dispose();
  }

  @override
  void didChangeMetrics() {
//    if (keyboard.focusNode[0].hasFocus) {
//      /// 키보드가 올라온 경우
////      logger.logPrint('menu', '키보드 업');
////      keyboard_flag = true;
//      button_flag = true;
////      _scrollController.animateTo(800,
////          duration: new Duration(milliseconds: 100), curve: Curves.ease);
//      if (MediaQuery.of(context).viewInsets.bottom > 0.0) {
//        button_flag = false;
//      }
//    } else {
////      /// 키보드가 내려간 경우
////      logger.logPrint('menu', '키보드 다운');
////      keyboard_flag = false;
//      button_flag = false;
//    }

    ////////////////////////////////////////////////////////////////////////////////
    if (keyboard.focusNodeHasFocus()) {
      buttonFlag = true;
      if (MediaQuery.of(context).viewInsets.bottom > 0.0) {
        buttonFlag = false;
      //  logger.log(message: '키보드 올라왔어요~~~!!!');
      //  Logger logger = Logger(context);  logger.logPrint('menu', '키보드 다운');
      }
    } else {
      buttonFlag = false;
    //  logger.log(key: '키보드 내려왔어요~~~!!!', value: buttonFlag);
    }
    keyboard.didChangeMetrics();
    ////////////////////////////////////////////////////////////////////////////////

  }


//  _scrollListener() {
//    if (keyboard_flag) {
//      keyboard_flag = false;
//      logger.logPrint('menu', '스크롤리스너 업');
//      _scrollController.animateTo(800,
//          duration: new Duration(milliseconds: 100), curve: Curves.ease);
//    }
//  }

  @override
  Widget build(BuildContext context) {
    Logger.i('시작ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ', context: context);
   // logger.d('dddddddddddddddddddddd22');
    return Scaffold(
      appBar: AppBar(
        title: Text('menu'),
      ),
      // 키보드 내리기
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Stack(
          children: <Widget>[
            SafeArea(
              child: SingleChildScrollView(
                //controller: _scrollController,
                ////////////////////////////////////////////////////////////////////////////////
                controller: keyboard.getScrollController,
                ////////////////////////////////////////////////////////////////////////////////
                child: new Column(
                  children: <Widget>[
                    Container(height: 500, color: Colors.red),
                    new Container(
                      width: 300.0,
                      height: 104.0,
                      color: Colors.yellow,
                      child: new Image.asset(
                        'assets/images/img@3x.png',
                        //fit: BoxFit.contain,
                        //fit: BoxFit.cover,
                        //fit: BoxFit.fill,
                        //fit: BoxFit.fitHeight,
                        //fit: BoxFit.fitWidth,
                        //fit: BoxFit.none,
                        //fit: BoxFit.scaleDown,
                        width: 10.0,
                        height: 10.0,
                      ),
                    ),
                    Container(height: 500, color: Colors.green),
                    TextField(
                      controller: _textController,
                      //focusNode: focusNode,
                      ////////////////////////////////////////////////////////////////////////////////
                      focusNode: keyboard.getFocusNode(1),
                      ////////////////////////////////////////////////////////////////////////////////
                    ),
                    Container(height: 500, color: Colors.yellow),
                  ],
                ),
              ),
            ),
            buttonBlock(),
          ],
        ),
      ),
    );
  }

  Widget buttonBlock() {
    Logger.i('버튼이네...................');
//    return button_flag
//  print('===========================재빌드?????');
  // 직접 값 변경 안해주면 재빌드 안됨 ㅜㅜㅜㅜㅜ왜그러지?나도모름.....
  ////////////////////////////////////////////////////////////////////////////////
    return buttonFlag
    ////////////////////////////////////////////////////////////////////////////////
        ? new Container()
        : Align(
            // 화면 아래 배치
            alignment: new Alignment(0.0, 0.85),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: RaisedButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 50),
                      color: Colors.orange,
                      child: Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (counter) => MenuTwo()));
                      },
                    ),
                  ),
                ]),
          );
  }
}
