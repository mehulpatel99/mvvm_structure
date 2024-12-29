import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  static toastMsg(String msg){
    Fluttertoast.showToast(msg: msg,backgroundColor: Colors.black,textColor: Colors.white);
  }

  static flushBar(String msg,BuildContext context){
    showFlushbar(context: context, flushbar: Flushbar(
      duration: const Duration(seconds: 3),
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.easeInOut,
      flushbarPosition: FlushbarPosition.TOP,
      positionOffset: 20,
      icon: const Icon(Icons.error),
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      padding: const EdgeInsets.all(15),
      message: msg,
      backgroundColor: Colors.red,
    )..show(context));
  }

  static snackBar(String msg,BuildContext context){
   return ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text(msg),backgroundColor: Colors.green,));
  }
}