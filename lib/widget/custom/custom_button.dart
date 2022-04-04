import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../../res/style.dart';
import '../../utils/screen.dart';



///自定义按钮
class CustomButton extends StatelessWidget {
 final String? title;
 final double? height;
 final double? width;

 final bool? isClick;
 final VoidCallback? onPressed;
 final double? radius;
 final bool? isBorderButton;
 const CustomButton(this.title,
      {Key? key, this.width, this.height,this.isClick,this.onPressed,this.radius,this.isBorderButton}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width:width ?? Screen.width,
        height:height ?? Dimens.dp45,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:isBorderButton==true?MaterialStateProperty.all(
              Colors.white,
            ):MaterialStateProperty.all(
              isClick??true?Colours.accentColor:Colours.accentColor.withOpacity(0.5),
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius!=null?radius!:Dimens.sp4),
              side:isBorderButton==true?BorderSide(
                color: Colours.accentColor,
                width: Dimens.dp1,
              ): BorderSide.none,
            )
            ),//圆角弧度
          ),
          onPressed: () {
            if(onPressed!=null){
               onPressed!.call();
            }
          },
          child:Text("$title",style:isBorderButton==true?TextStyles.normalAccentText:TextStyles.normalWhiteText,),
        )
    );
  }
}

