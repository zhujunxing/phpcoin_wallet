import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../../res/style.dart';



///红点
class RedDot extends StatelessWidget {
 final double? width;
 final double? height;
 const RedDot({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colours.redColor,
        shape: BoxShape.circle,
      ),
      width:width ?? Dimens.dp8,
      height:height ?? Dimens.dp8,
      color: Colours.redColor,
    );
  }
}

