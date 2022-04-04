

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_create_import_data.dart';
import 'package:flutter_phpcoin/ui/page/wallet/wallet_select_page.dart';


import 'package:get/get.dart';


import '../../../controller/page/wallet/wallet_private_import_controller.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../widget/bar/app_bar.dart';
import '../../../widget/custom/custom_button.dart';
import '../../../widget/custom/divider_line.dart';


// ignore: must_be_immutable
class WalletPrivateImportPage extends StatelessWidget {
  late WalletPrivateImportController controller;
  WalletCreateImportData data;
  WalletPrivateImportPage(this.data,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller=Get.put(WalletPrivateImportController(data));
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: BaseAppBar(
          title:Ids.privateImport.tr,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(Ids.walletPublicKey.tr,style: TextStyle(
                      fontSize: Dimens.sp16,
                      color: Colours.defaultTextColor,
                    ),),
                    SizedBox(
                        height: Dimens.dp45,
                        width: Screen.width,

                        child:Row(
                          children: [
                            Expanded(child: TextField(
                              textInputAction:TextInputAction.done,
                              keyboardType: TextInputType.text,
                              controller: controller.editPublic,
                              style: TextStyle(
                                  textBaseline:TextBaseline.alphabetic,
                                  color: Colours.defaultTextColor,
                                  fontSize: Dimens.sp14),
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText:Ids.pleaseEnterWalletPublicKey.tr,
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
                          ],
                        )
                    ),
                    const DividerLine(),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Gaps.hGap10,
            ),
            SliverToBoxAdapter(
              child:Container(
                height: Dimens.dp80,
                margin: EdgeInsets.fromLTRB(Dimens.dp15,0, Dimens.dp15,0),
                padding: EdgeInsets.fromLTRB(Dimens.dp10, 0, Dimens.dp10, 0),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  controller:controller.editAddress,
                  style: TextStyle(
                      fontSize: Dimens.sp13,
                      textBaseline: TextBaseline.alphabetic,
                      color: Colours.defaultTextColor),
                  maxLines: 15,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText:Ids.pleaseEnterWalletPrivateKey.tr,
                    hintStyle: TextStyle(
                      fontSize: Dimens.sp13,
                      textBaseline: TextBaseline.alphabetic,
                      color: Colours.hintTextColor,
                    ),
                    contentPadding: const EdgeInsets.all(0),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      gapPadding: 0,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colours.lineTextColor,
                      width: Dimens.dp05,
                    )
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${Ids.setWalletName.tr}（${controller.walletName.value}）",style: TextStyle(
                      fontSize: Dimens.sp16,
                      color: Colours.defaultTextColor,
                    ),),
                    SizedBox(
                      height: Dimens.dp45,
                      width: Screen.width,

                      child:Row(
                        children: [
                          Expanded(child: TextField(
                            textInputAction:TextInputAction.done,
                            keyboardType: TextInputType.text,
                            controller: controller.editName,
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
                              hintText:Ids.pleaseEnterName.tr,
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
                                controller.editName.text='';
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
                      )
                    ),
                    const DividerLine(),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(Ids.setPassword.tr,style: TextStyle(
                      fontSize: Dimens.sp16,
                      color: Colours.defaultTextColor,
                    ),),
                    SizedBox(
                      height: Dimens.dp45,
                      width: Screen.width,

                      child:TextField(
                        textInputAction:TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        controller: controller.editPwd,
                        style: TextStyle(
                            textBaseline:TextBaseline.alphabetic,
                            color: Colours.defaultTextColor,
                            fontSize: Dimens.sp14),
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText:Ids.mustPwd6Digits.tr,
                          hintStyle: TextStyle(
                            fontSize: Dimens.sp14,
                            color: Colours.hintTextColor,
                          ),
                          contentPadding: const EdgeInsets.all(0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                        ),
                      ),
                    ),
                    const DividerLine(),
                    SizedBox(
                      height: Dimens.dp45,
                      width: Screen.width,
                      child:TextField(
                        textInputAction:TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        controller: controller.editPwdConfirm,
                        style: TextStyle(
                            textBaseline:TextBaseline.alphabetic,
                            color: Colours.defaultTextColor,
                            fontSize: Dimens.sp14),
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText:Ids.pleaseEnterPwd.tr,
                          hintStyle: TextStyle(
                            fontSize: Dimens.sp14,
                            color: Colours.hintTextColor,
                          ),
                          contentPadding: const EdgeInsets.all(0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                        ),
                      ),
                    ),
                    const DividerLine(),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(Ids.pwdTip.tr,style: TextStyle(
                      fontSize: Dimens.sp16,
                      color: Colours.defaultTextColor,
                    ),),
                    SizedBox(
                      height: Dimens.dp45,
                      width: Screen.width,

                      child:TextField(
                        textInputAction:TextInputAction.done,
                        keyboardType: TextInputType.text,
                        controller: controller.editPwdTip,
                        style: TextStyle(
                            textBaseline:TextBaseline.alphabetic,
                            color: Colours.defaultTextColor,
                            fontSize: Dimens.sp14),
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText:Ids.optional.tr,
                          hintStyle: TextStyle(
                            fontSize: Dimens.sp14,
                            color: Colours.hintTextColor,
                          ),
                          contentPadding: const EdgeInsets.all(0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                        ),
                      ),
                    ),
                    const DividerLine(),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Gaps.hGap20,
            ),
            SliverToBoxAdapter(
              child: Container(
                child: CustomButton(Ids.startImport.tr,onPressed: (){
                    controller.submit(context);
                },),
                margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15,0),
              ),
            ),
          ],
        ),
    );
  }

}

