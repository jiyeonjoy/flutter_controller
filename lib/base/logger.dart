import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

//enum Level {
// verbose,
// debug,
// info,
// warning,
// error,
//}

 class Logger {

  var context;
  String className;
  dynamic msg;
  static List<String> logList = [];

  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(context) {
   int idx = context.toString().indexOf('(');
   String className = context.toString().substring(0, idx);
   if (_cache.containsKey(className)) {
    return _cache[className];
   } else {
    final logger = Logger._internal(className);
    _cache[className] = logger;
    return logger;
   }
  }

  Logger._internal(this.className);



  void log({dynamic message, key, value}){
   if(!kReleaseMode) {
    if(message!=null){
     debugPrint('==============$className: $message');
     saveLogList('$className: $message');
    }
    if(key!=null) {
     debugPrint('==============$className: key = $key && value = $value');
     saveLogList('$className: key = $key && value = $value');
    }
   }
  }



  // 로그 리스트 저장 - 시간 저장
 void saveLogList(message) {
  var now = DateTime.now();
  logList.add('$now : $message');
 }


 // 로그 전체 출력!!! - 제한을 두면 거꾸로 최신부터 출력됨.
 void printLogList({int limit}) {
  if(!kReleaseMode) {

   if(limit==null) {
    for (String x in logList) {
     debugPrint(x);
    }
   } else if(0 <limit && limit < logList.length) {
    for(int i = logList.length-1; i>logList.length-1-limit; i--) {
     debugPrint(logList[i]);
    }
   } else {
    for (String x in logList) {
     debugPrint(x);
    }
   }
  }
 }

 // 디버그 모드 릴리즈 모드 구분할 수 있나?
//  if(kReleaseMode){ // is Release Mode ??
//  print('release mode');
//  } else {
//  print('debug mode');
//  }



//  void v(dynamic message, [dynamic error, StackTrace stackTrace]) {
//   debugPrint('==============${Level.verbose} class : $className : $message');
//  }
//
//  /// Log a message at level [Level.debug].
//  void d(dynamic message, [dynamic error, StackTrace stackTrace]) {
//   debugPrint('==============${Level.debug} class : $className : $message');
//  }
//
//  /// Log a message at level [Level.info].
//  void i(dynamic message, [dynamic error, StackTrace stackTrace]) {
//   //log(Level.info, message, error, stackTrace);
//   debugPrint('==============${Level.info} class : $className : $message');
//  }
//
//  /// Log a message at level [Level.warning].
//  void w(dynamic message, [dynamic error, StackTrace stackTrace]) {
//   //log(Level.warning, message, error, stackTrace);
//   debugPrint('==============${Level.warning} class : $className : $message');
//  }
//
//  /// Log a message at level [Level.error].
//  void e(dynamic message, [dynamic error, StackTrace stackTrace]) {
//   //log(Level.error, message, error, stackTrace);
//   debugPrint('==============${Level.error} class : $className : $message');
//  }
 }




//   Logger _logger = null;
//
//   Logger();
//
//   static Logger getLogger() {
//     if (_logger == null) {
//       _logger = Logger();
//     }
//   }

//  // 로그 찍기
//   void logPrint (className, logMsg) {
//    debugPrint('================== $className : $logMsg');
//    logger.d("Debug message");
//    logger.e("Error message");
//    logger.i("Info message");
//    logger.v("Verbose message");
//    logger.w("Warning message");
//    logger.wtf("WTF message");
//  }


