

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_create_import_data.dart';


import 'package:get/get.dart';


import '../../../controller/page/wallet/wallet_create_controller.dart';

import '../../../controller/page/wallet/wallet_pwd_modify_controller.dart';
import '../../../controller/page/wallet/wallet_pwd_private_key_modify_controller.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../widget/bar/app_bar.dart';
import '../../../widget/custom/custom_button.dart';
import '../../../widget/custom/divider_line.dart';

///钱包密码-私钥修改
// ignore: must_be_immutable
class WalletPwdPrivateKeyModifyPage extends StatelessWidget {
  late WalletPwdPrivateKeyModifyController controller;

  String address;
  WalletPwdPrivateKeyModifyPage(this.address,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller=Get.put(WalletPwdPrivateKeyModifyController(address));
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: BaseAppBar(
          title:Ids.resetPwd.tr,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child:Container(
                height: Dimens.dp80,
                margin: EdgeInsets.fromLTRB(Dimens.dp15,0, Dimens.dp15,0),
                padding: EdgeInsets.fromLTRB(Dimens.dp10, Dimens.dp10, Dimens.dp10, Dimens.dp10),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  controller:controller.editPwd,
                  style: TextStyle(
                      fontSize: Dimens.sp13,
                      textBaseline: TextBaseline.alphabetic,
                      color: Colours.defaultTextColor),
                  maxLines: 15,
                  minLines: 1,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    hintText:Ids.plaintextPrivateKey.tr,
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
              child: Gaps.hGap20,
            ),
            SliverToBoxAdapter(
              child: Container(
                  margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
                  width:Screen.width,
                  child:Column(
                    children: [
                      SizedBox(
                        height: Dimens.dp50,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Dimens.dp90,
                              child: Text(Ids.setPassword.tr,style: TextStyle(
                                fontSize: Dimens.sp16,
                                color: Colours.defaultTextColor,
                              ),),
                            ),
                            Expanded(child: TextField(
                              textInputAction:TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              controller: controller.editNew,
                              style: TextStyle(
                                  textBaseline:TextBaseline.alphabetic,
                                  color: Colours.defaultTextColor,
                                  fontSize: Dimens.sp16),
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText:Ids.setPassword.tr,
                                hintStyle: TextStyle(
                                  fontSize: Dimens.sp16,
                                  color: Colours.hintTextColor,
                                ),
                                contentPadding: const EdgeInsets.all(0),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none
                                ),
                              ),
                            ),),

                          ],
                        ),
                      ),
                      const DividerLine(),
                    ],
                  )
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                  margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
                  width:Screen.width,
                  child:Column(
                    children: [
                      SizedBox(
                        height: Dimens.dp50,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Dimens.dp90,
                              child: Text(Ids.resetPwd.tr,style: TextStyle(
                                fontSize: Dimens.sp16,
                                color: Colours.defaultTextColor,
                              ),),
                            ),
                            Expanded(child: TextField(
                              textInputAction:TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              controller: controller.editNewConfirm,
                              style: TextStyle(
                                  textBaseline:TextBaseline.alphabetic,
                                  color: Colours.defaultTextColor,
                                  fontSize: Dimens.sp16),
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText:Ids.resetPwd.tr,
                                hintStyle: TextStyle(
                                  fontSize: Dimens.sp16,
                                  color: Colours.hintTextColor,
                                ),
                                contentPadding: const EdgeInsets.all(0),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none
                                ),
                              ),
                            ),),

                          ],
                        ),
                      ),
                      const DividerLine(),
                    ],
                  )
              ),
            ),
            SliverToBoxAdapter(
              child: Gaps.hGap40,
            ),
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
                child: CustomButton(Ids.sure.tr,
                  onPressed: (){
                  controller.modifyPwd(context);
                  },
                ),
              ),
            ),
          ],
        ),
    );
  }

}

