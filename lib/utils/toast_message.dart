import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastMessage(String message){
  Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16,
  );
}