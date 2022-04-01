import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ToastUtil {



  static toast(BuildContext context,String msg, {ToastGravity? gravity}) {
    Fluttertoast.showToast(msg: msg,gravity: gravity??ToastGravity.CENTER);
  }


}
