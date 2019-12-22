import 'package:flutter/material.dart';
import 'package:flutter_exam1212/base/logger.dart';
import 'package:meta/meta.dart';

class Keyboard  {
  // context 필수 값!!
  var context;
  // textField 몇개인지
  int textFieldCount;
  // textField focusNode
  List<FocusNode> _focusNode = List();

  bool _keyboardFlag = false;

  // 스크롤 컨트롤러 필요한지 묻는 것!
  bool scrollView = false;
  // 스크롤  컨트롤러
  ScrollController _scrollController;

  // 키보드 생성시 화면 컨트롤 높이 조절
  double scrollControllerHeight;

  // 생성자 - @required 안 넣어주면 에러 뜸!!!!!!
  Keyboard(
      {@required this.context,
      @required this.textFieldCount,
      this.scrollView,
      this.scrollControllerHeight})
      : assert(context != null),
        assert(textFieldCount != null) {
    WidgetsBinding.instance.addObserver(context);
    // 스크롤컨트롤러 필요하면 생성
    if (scrollView) {
      _scrollController = ScrollController();
      _scrollController.addListener(_scrollListener);
    }
    // 텍스트필드 갯수 만큼 포커스 노드 생성
    for (var i = 0; i < textFieldCount + 1; i++) {
      _focusNode.add(FocusNode());
    }
  }

  _scrollListener() {
    if (_keyboardFlag) {
      Logger.i('이거는 스크롤컨트롤러 입니다.', thisClass: this);
      _keyboardFlag = false;
      _scrollController.animateTo(scrollControllerHeight,
          duration: new Duration(milliseconds: 100), curve: Curves.ease);
    }
  }

  bool focusNodeHasFocus() {
    for (var x in _focusNode) {
      if (x.hasFocus) {
        return true;
      }
    }
    return false;
  }

  ScrollController get getScrollController => _scrollController;

  // 1부터 시작!!
  FocusNode getFocusNode(int i) {
    Logger.i('이거는 겟포커스 노드 입니다.', thisClass: this);
    return _focusNode[i - 1];
  }


  void dispose() {
    WidgetsBinding.instance.removeObserver(context);
    for (var x in _focusNode) {
      x.dispose();
    }
    if (scrollView) {
      _scrollController.dispose();
    }
  }

  void didChangeMetrics() {
    bool focusNodeHasFocus = false;
    for (var x in _focusNode) {
      if (x.hasFocus) {
        focusNodeHasFocus = true;
        break;
      }
    }
    if (focusNodeHasFocus) {
      /// 키보드가 올라온 경우
      _keyboardFlag = true;
      _scrollController.animateTo(scrollControllerHeight,
          duration: new Duration(milliseconds: 100), curve: Curves.ease);
    } else {
      /// 키보드가 내려간 경우
      _keyboardFlag = false;
    }
  }



//  bool button() {
//    if (focusNodeHasFocus()) {
//      if (MediaQuery.of(context).viewInsets.bottom > 0.0) {
//        return false;
//      }
//      return true;
//    } else {
//      return false;
//    }
//  }


  // bool 반대로 저장하기
//  void changeKeyboardFlag() {
//    keyboardFlag = !keyboardFlag;
//  }
//
//  void changeButtonFlag() {
//    buttonFlag = !buttonFlag;
//  }



//  bool getBool() {
//    return true;
//  }


// 세터
//  void setKeyboardFlag(bool keyboardFlag) {
//    this.keyboardFlag = keyboardFlag;
//  }
//
//  void setButtonFlag(bool buttonFlag) {
//    this.buttonFlag = buttonFlag;
//  }

// 게터
// bool get getKeyboardFlag => _keyboardFlag;

//  bool get getButtonFlag => buttonFlag;


//  bool getButtonFlag() {
//    bool focusNodeHasFocus = false;
//    for (var x in focusNode) {
//      if (x.hasFocus) {
//        focusNodeHasFocus = true;
//        break;
//      }
//    }
//    if (focusNodeHasFocus) {
//      if(MediaQuery.of(context).viewInsets.bottom > 0.0) {
//        print('button1');
//        return false;
//      }else {
//        print('button2');
//        return true;
//      }
//    } else {
//      print('button3');
//      return false;
//    }
//  }

//  @override
//  void initState() {
//    _scrollController = ScrollController();
//    _scrollController.addListener(_scrollListener);
////    WidgetsBinding.instance.addObserver(this);
//  }
//
//  @override
//  void dispose() {
////    WidgetsBinding.instance.removeObserver(this);
//    focusNode.dispose();
//    _scrollController.dispose();
//    super.dispose();
//  }

//  @override
//  void didChangeMetrics() {
//    if (focusNode.hasFocus) {
//      /// 키보드가 올라온 경우
//      keyboard_flag = true;
//      button_flag = true;
//      _scrollController.animateTo(0,
//          duration: new Duration(milliseconds: 100), curve: Curves.ease);
//      if (MediaQuery.of(context).viewInsets.bottom > 0.0) {
//        button_flag = false;
//      }
//    } else {
//      /// 키보드가 내려간 경우
//      keyboard_flag = false;
//      button_flag = false;
//    }
//  }
//
//  _scrollListener() {
//    if (keyboard_flag) {
//      keyboard_flag = false;
//      _scrollController.animateTo(0,
//          duration: new Duration(milliseconds: 100), curve: Curves.ease);
//    }
//  }



// textfield 에 넣어 줘야됨.
//  focusNode: focusNode,

// SingleChildScrollView 에 컨트롤러에 넣어 줘야됨.
//  controller: _scrollController,



// 버튼 플래그 에 따라 버튼 생성 비생성 나눠줘야됨.
//  return button_flag
//  ? new Container()
//      : Align(



// 그냥쓴거야 필요없음.
// setter 한꺼번에 표현 가능
//  var person2 = Person()
//    ..setName('홍길동')
//    ..setAge(10);

}
