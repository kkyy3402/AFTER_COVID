import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String msg){
  Fluttertoast.showToast(
      webPosition: "center",
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM_LEFT,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.red,
      webBgColor: "linear-gradient(to right, #333333dd, #333333dd)",
      textColor: Colors.white,
      fontSize: 16.0
  );
}