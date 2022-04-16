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
 final Color? color;
 const CustomButton(this.title,
      {Key? key, this.width, this.height,this.isClick,this.onPressed,this.radius,this.isBorderButton,
      this.color}) : super(key: key);


  @override
  Widget build(BuildContext context) {

      Color   customColor=color??Colours.accentColor;

    return SizedBox(
        width:width ?? Screen.width,
        height:height ?? Dimens.dp40,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:isBorderButton==true?MaterialStateProperty.all(
              Colors.white,
            ):MaterialStateProperty.all(
              isClick??true?customColor:customColor.withOpacity(0.5),
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius!=null?radius!:Dimens.sp4),
              side:isBorderButton==true?BorderSide(
                color: customColor,
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

