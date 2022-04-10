

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_create_import_data.dart';


import 'package:get/get.dart';


import '../../../controller/page/wallet/wallet_create_controller.dart';

import '../../../controller/page/wallet/wallet_pwd_modify_controller.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../widget/bar/app_bar.dart';
import '../../../widget/custom/custom_button.dart';
import '../../../widget/custom/divider_line.dart';

///钱包密码修改
// ignore: must_be_immutable
class WalletPwdModifyPage extends StatelessWidget {
  late WalletPwdModifyController controller;

  String address;
  WalletPwdModifyPage(this.address,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller=Get.put(WalletPwdModifyController(address));
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: BaseAppBar(
          title:"修改密码",
        ),
        body: CustomScrollView(
          slivers: [
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
                            child: Text("当前密码",style: TextStyle(
                              fontSize: Dimens.sp16,
                              color: Colours.defaultTextColor,
                            ),),
                          ),
                          Expanded(child: TextField(
                            textInputAction:TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            controller: controller.editPwd,
                            style: TextStyle(
                                textBaseline:TextBaseline.alphabetic,
                                color: Colours.defaultTextColor,
                                fontSize: Dimens.sp16),
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText:"当前密码",
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
                              child: Text("新密码",style: TextStyle(
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
                                hintText:"新密码",
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
                              child: Text("确认密码",style: TextStyle(
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
                                hintText:"确认密码",
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

