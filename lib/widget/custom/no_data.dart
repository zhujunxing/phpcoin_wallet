import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../lang/string.dart';
import '../../res/colors.dart';
import '../../res/style.dart';
import '../../utils/screen.dart';



///无数据占位
class NoData extends StatelessWidget {
 final String? content;
 final String? image;


 final Color? textColor;
 final EdgeInsets? margin;
 final bool? isScreen;
 final Color? imageColor;
 const NoData({Key? key, this.content, this.image,this.textColor,this.margin=EdgeInsets.zero,this.isScreen=false,this.imageColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return Container(
      width:isScreen!?Screen.width:null,
      height: isScreen!?Screen.height:null,
      alignment: Alignment.center,
      margin: margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         image == null || image!.isEmpty
              ? const SizedBox()
              : Image(
            image: AssetImage(image!),
            width: Dimens.dp120,
            height: Dimens.dp120,
           color: imageColor??Colours.grayColor,
          ),
          Gaps.hGap5,
          Text(
             content==''?Ids.noData.tr:content!,
            style: TextStyle(
              fontSize: Dimens.sp13,
              color:textColor ?? Colours.grayColor,
            ),
          ),
        ],
      ),
    );
  }
}


