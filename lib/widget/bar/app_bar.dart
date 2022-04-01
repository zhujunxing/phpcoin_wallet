import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../res/colors.dart';
import '../../res/style.dart';
import '../../utils/screen.dart';
import '../custom/back_button.dart';
import 'status_bar.dart';



class BaseAppBar extends StatelessWidget  implements PreferredSizeWidget{
 final Color? bgColor;
 final String? title;
 final Widget? leading;
 final List<Widget>? actions;

 final Alignment? titleAlignment;
 final double? elevation;
 final Color? backBtColor;
 final  SystemUiOverlayStyle? systemOverlayStyle;
 final Widget? centerWidget;
 final double? titleSize;

 const BaseAppBar({Key? key,this.title,this.leading,this.actions,this.bgColor,this.titleAlignment,this.elevation,
    this.backBtColor,this.systemOverlayStyle,this.centerWidget,this.titleSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            color:bgColor ?? Colors.white,
            child: Stack(
              children: [
                AppBar(
                  leading: Container(),
                  elevation: 0,
                  systemOverlayStyle:systemOverlayStyle??SystemUiOverlayStyle.dark,
                  backgroundColor: Colors.transparent,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    StatusBar(color:bgColor ?? Colors.white,),
                    SizedBox(
                      height: Screen.appBarHeight,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child:leading??BackBt(
                              color:backBtColor??Colours.defaultTextColor,
                              onPressed: (){
                                Get.back();
                              },
                            ),
                          ),
                          Align(
                            child: Container(
                              alignment:titleAlignment==null?Alignment.center:Alignment.centerLeft,
                              width: Dimens.dp250,
                              child: centerWidget??Text(title ?? "",style:TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colours.defaultTextColor,
                                fontSize: titleSize??Dimens.sp16,
                              ),maxLines: 1,overflow: TextOverflow.ellipsis,),
                            ),
                            alignment: Alignment.center,
                          ),
                          actions!=null?Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children:actions!,
                            ),
                          ):const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>  const Size.fromHeight(kToolbarHeight);
}


