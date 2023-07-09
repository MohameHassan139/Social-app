import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toast({required String msg, Color color = Colors.red}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 30,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
