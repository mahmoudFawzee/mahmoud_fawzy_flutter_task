import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static showToast(String? message, {Color backgRoundColor = Colors.red}) {
    Fluttertoast.showToast(
      msg: message ?? 'Some Error Happened',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgRoundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
