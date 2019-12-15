import 'package:flutter/material.dart';
import 'package:flutter_exam1212/base/keyboard.dart';
import 'package:flutter_exam1212/base/logger.dart';
import 'package:flutter_exam1212/menu_two.dart';

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
  LoggerPrint logger = LoggerPrint();

  @override
  void initState() {
    super.initState();

//    _scrollController = ScrollController();
//    _scrollController.addListener(_scrollListener);
//    WidgetsBinding.instance.addObserver(this);
  ////////////////////////////////////////////////////////////////////////////////
  keyboard = Keyboard(context: this, textFieldCount: 1, scrollView: true, scrollControllerHeight: 800);
  ////////////////////////////////////////////////////////////////////////////////

  }


  @override
  void dispose() {
//    WidgetsBinding.instance.removeObserver(this);
//    focusNode.dispose();
//    _scrollController.dispose()

  ////////////////////////////////////////////////////////////////////////////////
  keyboard.dispose();
  ////////////////////////////////////////////////////////////////////////////////
    super.dispose();
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
      }
    } else {
      buttonFlag = false;
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
                    Container(height: 500, color: Colors.green),
                    TextField(
                      //focusNode: focusNode,
                      focusNode: keyboard.getFocusNode(1),
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
//    return button_flag
  print('===========================재빌드?????');
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
