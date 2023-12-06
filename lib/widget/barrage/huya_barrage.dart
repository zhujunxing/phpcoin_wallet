import 'package:flutter/material.dart';

import '../../res/style.dart';

///
/// 虎牙弹幕样式
///
class HuyaBarrage {
  static Widget normal(String text) {
    return Text(
      text,
      style:TextStyle(color: Colors.white,
        fontSize: Dimens.sp12,
      ),
    );
  }

  static Widget level_1(String text) {
    return Text(
      text,
      style: const TextStyle(color: Color(0xFFE9A33A)),
    );
  }

  static Widget level_2(String text) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(.8),
            borderRadius: BorderRadius.circular(50)),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static Widget level_3(String text, int count) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(.8),
            borderRadius: BorderRadius.circular(50)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
            Image.asset('assets/images/timg.jpeg',height: 30,width: 30,),
            Text(
              'x $count',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
