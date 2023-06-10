import 'package:flutter/foundation.dart' show kDebugMode, debugPrint;

void dPrint(String? message, { int? wrapWidth }){
  debugPrint(message,wrapWidth: wrapWidth);
  // if(kDebugMode){
  //   debugPrint(message,wrapWidth: wrapWidth);
  // }
}