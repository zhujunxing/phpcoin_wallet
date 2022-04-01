import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../lang/string.dart';
import '../../res/colors.dart';
import '../../res/style.dart';


class FocusButton extends StatelessWidget {
  final bool isFocus;
  final String? noText;
  final String? text;
  final Color? noTextColor;
  final Function? selectCallback;
  const FocusButton(this.isFocus,{Key? key,this.noText,this.text,this.noTextColor,this.selectCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(Dimens.dp10, Dimens.dp4, Dimens.dp10, Dimens.dp4),
        decoration: BoxDecoration(
            color: isFocus?Colours.hintBgColor:noTextColor??Colours.accentColor,
            borderRadius: BorderRadius.circular(Dimens.sp4)
        ),
        child: Text(isFocus?text??Ids.subscribed.tr:noText??"+${Ids.subscribe.tr}",style: TextStyle(
          fontSize: Dimens.sp12,
          color: isFocus?Colours.grayColor:Colors.white,
        ),),
      ),
      onTap: (){
          if(selectCallback!=null){
            selectCallback!.call(!isFocus);
          }
      },
    );
  }
}
