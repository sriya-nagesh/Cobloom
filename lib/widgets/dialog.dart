//Sriya Nagesh (SUKD1902368) BIT-UCLAN
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//all flutter toast alert dialogs
alertDialog(BuildContext context, String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blueGrey[800],
      textColor: Colors.yellow[50],
      fontSize: 16.0);
}
