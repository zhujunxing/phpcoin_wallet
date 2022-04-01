import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../../res/resource.dart';
import '../../res/style.dart';

///进入箭头
class JoinRight extends StatelessWidget {
 final double? left;
 final double? right;
 final double? top;
 final double? bottom;
 final double? size;

 final Color? color;

const  JoinRight(
      {Key? key, this.left, this.right, this.top, this.bottom, this.size, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ImageIcon(
            AssetImage(ImageResource.right),
            color:color??Colours.grayColor,
            size: size??Dimens.sp18,
          ),
        ],
      ),
      margin: EdgeInsets.fromLTRB(left??0,top??0,right??0,bottom??0),
    );
  }
}

