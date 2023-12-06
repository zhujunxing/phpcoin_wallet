import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../../res/style.dart';

///横线
class DividerLine extends StatelessWidget {
 final double? left;
 final double? right;
 final double? top;
 final double? bottom;
 const DividerLine({Key? key, this.left, this.top, this.right, this.bottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left??0,top??0,right??0,bottom??0),
      child: Divider(height:Dimens.dp1, color:Colours.lineTextColor),
    );
  }
}

