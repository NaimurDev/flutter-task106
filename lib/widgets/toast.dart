import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SuccessToast{
  static void show(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green.shade400,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}