

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_create_import_data.dart';


import 'package:get/get.dart';


import '../../../controller/page/wallet/wallet_create_controller.dart';

import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../widget/bar/app_bar.dart';
import '../../../widget/custom/custom_button.dart';
import '../../../widget/custom/divider_line.dart';


// ignore: must_be_immutable
class WalletCreatePage extends StatelessWidget {
  late WalletCreateController controller;
  WalletCreateImportData data;
  WalletCreatePage(this.data,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller=WalletCreateController(data);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: BaseAppBar(
          title:Ids.createWallet.tr,
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
                child: CustomButton(Ids.createWallet.tr,onPressed: (){
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

