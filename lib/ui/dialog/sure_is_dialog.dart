import 'package:animator/animator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/res/style.dart';

import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../lang/string.dart';
import '../../res/colors.dart';



class SureIsDialog extends StatelessWidget {
 final Function? selectCallback;
 final String title;
 final String? desc;
 const SureIsDialog(this.title,{Key? key, this.desc,this.selectCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        //保证控件居中效果
          child: Animator<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 200),
            cycles: 1,
            builder: (_, animationState, __) => Transform.scale(
              scale: animationState.value,
              child:Container(
                  margin: EdgeInsets.fromLTRB(Dimens.dp30, 0, Dimens.dp30, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimens.sp4),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, Dimens.dp15, 0, Dimens.dp5),
                        alignment: Alignment.center,
                        child: Text(title, style: TextStyles.largeBoldText,),
                      ),
                      desc!=null&&desc!=""?Container(
                        alignment: Alignment.center,
                        child: Text("$desc", style: TextStyles.normalLightText,),
                      ):const SizedBox(),
                      SizedBox(
                          height: Dimens.dp60,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child:Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          child: Container(
                                            height: Dimens.dp30,
                                            width: Dimens.dp100,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.circular(Dimens.sp20),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              Ids.cancel.tr,
                                              style: TextStyles.normalText,
                                            ),
                                          ),
                                          onTap: (){
                                            Get.back();
                                            if(selectCallback!=null){
                                              selectCallback!.call(false);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  child:Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          child: Container(
                                            height: Dimens.dp30,
                                            width: Dimens.dp100,
                                            decoration: BoxDecoration(
                                              color: Colours.accentColor,
                                              borderRadius: BorderRadius.circular(Dimens.sp20),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              Ids.sure.tr,
                                              style: TextStyles.normalWhiteText,
                                            ),
                                          ),
                                          onTap: (){
                                            Get.back();
                                            if(selectCallback!=null){
                                              selectCallback!.call(true);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          )),
                    ],
                  )),
            ),
          )

      ),
    );
  }
}



