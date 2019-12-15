import 'package:flutter/material.dart';
import 'package:flutter_exam1212/base/keyboard.dart';
import 'package:flutter_exam1212/base/logger.dart';

class MenuTwo extends StatefulWidget {
  @override
  _MenuTwoState createState() => _MenuTwoState();
}

class _MenuTwoState extends State<MenuTwo> with WidgetsBindingObserver {
//  // 스크롤  컨트롤러 추가
//  ScrollController _scrollController;
//
//  bool keyboard_flag = false;
//  bool button_flag = false;
//  final FocusNode focusNode = new FocusNode();


  Keyboard keyboard;
  bool buttonFlag = false;
  Logger logger;
  // 로그
 //LoggerPrint logger = LoggerPrint();

  @override
  void initState() {
    debugPrint('movieTitle: $context');
    super.initState();
    // context this 안 넣어주면 에러뜸!!
    //Keyboard keyboard = Keyboard(context: this);
    keyboard = Keyboard(context: this, textFieldCount: 1, scrollView: true, scrollControllerHeight: 0);
    print('시작시작시작시작00');
    logger = Logger(context);
//    _scrollController = ScrollController();
//    _scrollController.addListener(_scrollListener);
//    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
//    WidgetsBinding.instance.removeObserver(this);
//    focusNode.dispose();
//    _scrollController.dispose();
  keyboard.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {

    if (keyboard.focusNodeHasFocus()) {
      logger.log(message: '저장저장저장저장');
      buttonFlag = true;
      if (MediaQuery.of(context).viewInsets.bottom > 0.0) {
        buttonFlag = false;
        logger.log(message: 'RoROROROROROROROROROROR');
      }
    } else {
      buttonFlag = false;
    }

//    if (focusNode.hasFocus) {
//      /// 키보드가 올라온 경우
//      logger.logPrint('menu', '키보드 업');
//      keyboard_flag = true;
//      button_flag = true;
//      _scrollController.animateTo(0,
//          duration: new Duration(milliseconds: 100), curve: Curves.ease);
//      if (MediaQuery.of(context).viewInsets.bottom > 0.0) {
//        button_flag = false;
//      }
//    } else {
//      /// 키보드가 내려간 경우
//      logger.logPrint('menu', '키보드 다운');
//      keyboard_flag = false;
//      button_flag = false;
//    }

  keyboard.didChangeMetrics();
  }

//  _scrollListener() {
//    if (keyboard_flag) {
//      keyboard_flag = false;
//      logger.logPrint('menu', '스크롤리스너 업');
//      _scrollController.animateTo(0,
//          duration: new Duration(milliseconds: 100), curve: Curves.ease);
//    }
//  }

  @override
  Widget build(BuildContext context) {
  //  logger.d('dddddddddddddddddddddd33');
    return Scaffold(
      appBar: AppBar(
        title: Text('menu_two'),
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
                controller: keyboard.getScrollController,
                child: new Column(
                  children: <Widget>[
                    Container(height: 100, color: Colors.green),
                    TextField(
                      focusNode: keyboard.getFocusNode(1),
                    ),
                    Container(height: 1000, color: Colors.yellow),

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
    return buttonFlag
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
                        logger.printLogList();
                      },
                    ),
                  ),
                ]),
          );
  }
}
