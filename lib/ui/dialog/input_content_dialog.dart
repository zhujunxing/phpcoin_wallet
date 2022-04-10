
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/res/style.dart';
import 'package:flutter_phpcoin/utils/screen.dart';
import 'package:flutter_phpcoin/widget/custom/divider_line.dart';
import 'package:get/get.dart';

import '../../lang/string.dart';
import '../../res/colors.dart';
import '../../res/resource.dart';




class InputContentDialogController extends GetxController{
  var showClear=false.obs;
}


class InputContentDialog extends StatelessWidget {
  Function? listener;
  String title = "";

  String inputTip="";
  String content="";
  late TextEditingController edit;
  late InputContentDialogController controller;
  FocusNode focusNode=FocusNode();
   bool isPwd=false;
  InputContentDialog(this.title,this.inputTip,{Key? key, this.content='',this.listener,this.isPwd=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller=InputContentDialogController();
    edit = TextEditingController.fromValue(TextEditingValue(
      // 设置内容
        text: content,
        // 保持光标在最后
        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream, offset: content.length))));
    if(edit.text.isNotEmpty){
      controller.showClear.value=true;
    }else{
      controller.showClear.value=false;
    }
    focusNode.requestFocus();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                width: Dimens.dp250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimens.dp4),
                ),
                child: Column(
                  children: <Widget>[
                    Gaps.hGap20,
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: Dimens.sp16,
                          fontWeight: FontWeight.w500,
                          color: Colours.defaultTextColor,
                        ),
                      ),
                    ),
                    Gaps.hGap20,
                    Container(
                      margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
                      width: Screen.width,
                      height: Dimens.dp40,
                      decoration: BoxDecoration(
                        color: Colours.hintBgColor,
                      ),
                      padding: EdgeInsets.fromLTRB(Dimens.dp10, 0,Dimens.dp10, 0),
                      child:Row(
                        children: [
                          Expanded(child: TextField(
                            textInputAction:TextInputAction.done,
                            keyboardType: isPwd?TextInputType.visiblePassword:TextInputType.text,
                            controller:edit,
                            focusNode: focusNode,
                            obscureText: isPwd?true:false,
                            onChanged: (val){
                              if(val.isEmpty){
                                controller.showClear.value=false;
                              }else{
                                controller.showClear.value=true;
                              }
                            },
                            style: TextStyle(
                                textBaseline:TextBaseline.alphabetic,
                                color: Colours.defaultTextColor,
                                fontSize: Dimens.sp14),
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText:inputTip,
                              hintStyle: TextStyle(
                                fontSize: Dimens.sp14,
                                color: Colours.hintTextColor,
                              ),
                              contentPadding: const EdgeInsets.all(0),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none
                              ),
                            ),
                          ),),
                          Obx((){
                            return controller.showClear.value?GestureDetector(
                              onTap: () {
                                edit.text='';
                                controller.showClear.value=false;
                              },
                              child:Container(
                                color: Colors.transparent,
                                padding: EdgeInsets.fromLTRB(
                                    Dimens.dp15, 0, 0, 0),
                                child: ImageIcon(
                                  AssetImage(ImageResource.clearCircle),
                                  size: Dimens.dp18,
                                  color: Colours.grayColor,
                                ),
                              ),
                            ):const SizedBox();
                          })
                        ],
                      ),
                    ),
                    Gaps.hGap20,
                    const DividerLine(),
                    SizedBox(
                      width: Screen.width,
                      height: Dimens.dp45,
                      child: Row(
                        children: [
                          Expanded(child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(Ids.cancel.tr,style: TextStyle(
                                fontSize: Dimens.sp16,
                                color: Colours.blueColor,
                              ),),
                            ),
                            onTap: (){
                              Get.back();
                              if(listener!=null){
                                listener!.call(false,edit.text.trim());
                              }
                            },
                          )),
                          Container(
                            color: Colours.lineTextColor,
                            width: Dimens.dp1,
                            height: Screen.height,
                          ),
                          Expanded(child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(Ids.sure.tr,style: TextStyle(
                                fontSize: Dimens.sp16,
                                color: Colours.redColor,
                              ),),
                            ),
                            onTap: (){
                              Get.back();
                              if(listener!=null){

                                listener!.call(true,edit.text.trim());
                              }
                            },
                          )),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}

