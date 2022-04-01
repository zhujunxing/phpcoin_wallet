import 'package:flutter/material.dart';

import '../../res/style.dart';
import '../../utils/screen.dart';


class StatusBar extends StatelessWidget {
  final Color? color;

  const StatusBar({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.transparent,
      height:Screen.statusBarHeight != 0 ? Screen.statusBarHeight : Dimens.dp44,
    );
  }
}
