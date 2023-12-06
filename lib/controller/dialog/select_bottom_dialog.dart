import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../lang/string.dart';
import '../../res/colors.dart';
import '../../res/style.dart';
import '../../utils/screen.dart';
import '../../widget/custom/divider_line.dart';




///底部选择弹窗
class SelectBottomDialog extends StatelessWidget {
 final List<String> content;
 final Function? selectCallback;
  const SelectBottomDialog(this.content,{Key? key,this.selectCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, Dimens.dp10, 0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child:Column(
              mainAxisSize: MainAxisSize.min,
              children:content.asMap().keys.map((i){
                return Material(
                  child: InkWell(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        i!=0?const DividerLine():const SizedBox(),
                        Container(
                          height: Dimens.dp50,
                          width: Screen.width,
                          alignment: Alignment.center,
                          child: Text(content[i],style: TextStyle(
                            fontSize: Dimens.sp16,
                            color: Colours.defaultTextColor,
                          ),),
                        ),
                      ],
                    ),
                    onTap:(){
                      Get.back();
                      if(selectCallback!=null){
                        selectCallback!.call(i);
                      }
                    },
                  ),
                  color: Colors.white,
                );
              }).toList(),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimens.dp10),
                  topRight:  Radius.circular(Dimens.dp10),
                )
            ),
          ),
          Material(
            color: Colors.white,
            child: InkWell(
              child: Container(
                height: Dimens.dp50,
                width: Screen.width,
                alignment: Alignment.center,
                child: Text(Ids.cancel.tr,style: TextStyle(
                  fontSize: Dimens.sp16,
                  color:Colours.grayColor,
                ),),
              ),
              onTap: (){
                Get.back();
              },
            ),
          ),
          Container(
            color: Colors.white,
            height: Screen.bottomBarHeight,
          ),

        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.sp10),
          topRight: Radius.circular(Dimens.sp10),
        )
      ),
    );
  }
}

