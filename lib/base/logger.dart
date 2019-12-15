import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';


 class LoggerPrint {


   var logger = Logger();


//   Logger _logger = null;
//
//   Logger();
//
//   static Logger getLogger() {
//     if (_logger == null) {
//       _logger = Logger();
//     }
//   }

  // 로그 찍기
   void logPrint (className, logMsg) {
    debugPrint('================== $className : $logMsg');
    logger.d("Debug message");
    logger.e("Error message");
    logger.i("Info message");
    logger.v("Verbose message");
    logger.w("Warning message");
    logger.wtf("WTF message");
  }

}

