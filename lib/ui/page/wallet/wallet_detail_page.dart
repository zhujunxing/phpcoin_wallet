

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_create_import_data.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/ui/dialog/input_content_dialog.dart';
import 'package:flutter_phpcoin/ui/dialog/sure_is_dialog.dart';
import 'package:flutter_phpcoin/ui/page/wallet/wallet_select_page.dart';
import 'package:flutter_phpcoin/utils/toast_util.dart';


import 'package:get/get.dart';


import '../../../controller/page/wallet/wallet_create_controller.dart';
import '../../../controller/page/wallet/wallet_create_import_controller.dart';
import '../../../controller/page/wallet/wallet_detail_controller.dart';
import '../../../controller/page/wallet/wallet_select_controller.dart';
import '../../../controller/page/wallet/wallet_watch_import_controller.dart';
import '../../../db/entity/wallet_entity.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../widget/bar/app_bar.dart';
import '../../../widget/custom/back_button.dart';
import '../../../widget/custom/custom_button.dart';
import '../../../widget/custom/divider_line.dart';

///钱包详情
// ignore: must_be_immutable
class WalletDetailPage extends StatelessWidget {
  late WalletDetailController controller;
  final Wallet wallet;
  WalletDetailPage({Key? key,required this.wallet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller=Get.put(WalletDetailController(wallet));
    return Scaffold(
        backgroundColor: Colours.bgColor,
        appBar: BaseAppBar(
          title:"钱包详情",
        ),
        body: Obx((){
          return Column(
            children: [
              Expanded(child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Gaps.hGap10,
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
                      width: Screen.width,
                      color: Colors.white,
                      height: Dimens.dp80,
                      child: Row(

                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: Dimens.dp50,height: Dimens.dp50,
                            child: Image.asset(ImageResource.phpCoin,width: Dimens.dp48,height: Dimens.dp50,),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colours.lightGrayColor,
                                  width: Dimens.dp1,
                                )
                            ),
                          ),
                          Gaps.wGap10,
                          Expanded(child: Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(controller.walletName.value,style: TextStyle(
                                          fontSize: Dimens.sp16,
                                          color: Colours.grayColor,
                                        ),),
                                        Gaps.wGap2,
                                        ImageIcon(AssetImage(ImageResource.edit),color: Colours.grayColor,size: Dimens.sp14,),
                                      ],
                                    ),
                                    padding: EdgeInsets.only(bottom: Dimens.dp5),
                                  ),
                                  onTap: (){
                                    Get.dialog(InputContentDialog("更换钱包名", "请填写钱包名",content: "${controller.wallet!.walletName}"
                                      ,listener: (select,content){
                                        if(select){
                                          controller.modifyWalletName(context,content);
                                        }
                                      },));
                                  },
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(controller.walletAddress.value,style: TextStyle(
                                      fontSize: Dimens.sp12,
                                      color: Colours.defaultTextColor,
                                    ),),
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      child: Container(
                                        child: ImageIcon(AssetImage(ImageResource.copy),color: Colours.defaultTextColor,size: Dimens.sp14,),
                                        padding: EdgeInsets.only(left: Dimens.dp5,right: Dimens.dp10),
                                      ),
                                      onTap: (){
                                        Clipboard.setData(ClipboardData(text:'${controller.wallet!.walletAddress}'));
                                        ToastUtil.toast(context, "钱包地址已复制到粘贴板");
                                      },
                                    )
                                  ],
                                ),
                              ],
                            ),
                            height: Dimens.dp50,
                          )),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Gaps.hGap10,
                  ),
                  SliverToBoxAdapter(
                    child: _buildItem("导出私钥",click: (){
                      Get.dialog(InputContentDialog("输入密码", "",content: ""
                        ,listener: (select,pwd){
                          if(select){
                            controller.verifyPwd(Get.context!,pwd);
                          }
                        },isPwd: true,));
                    },isVisible: false),
                  ),
                  SliverToBoxAdapter(
                    child: Gaps.hGap10,
                  ),
                  SliverToBoxAdapter(
                    child: _buildItem("修改密码",click: (){
                      Get.toNamed(Routes.walletPwdModify,arguments: wallet.walletAddress);
                    }),
                  ),
                  SliverToBoxAdapter(
                    child: _buildItem("重置密码",click: (){
                      Get.toNamed(Routes.walletPwdPrivateKeyModify,arguments: wallet.walletAddress);
                    },isVisible: false),
                  ),
                ],
              )),
              GestureDetector(
                child: Container(
                  child: Text("删除钱包",style: TextStyle(
                    fontSize: Dimens.sp14,
                    color: Colours.redColor,
                  ),),
                  alignment: Alignment.center,
                  width: Screen.width,
                  height: Dimens.dp45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimens.sp4),
                  ),
                  margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, Screen.bottomBarHeight+Dimens.dp20),
                ),
                onTap: (){
                  Get.dialog(SureIsDialog("确认删除钱包",desc: "钱包删除后无法恢复",selectCallback: (select){
                       if(select){
                         controller.deleteWallet(context);
                       }
                  },));
                },
              )

            ],

          );
        })
    );
  }
  Widget _buildItem(String title,{Function? click,bool isVisible=true}){

    return Material(
      child: InkWell(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(

              padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, Dimens.dp15),
              child: Row(
                children: [
                  Expanded(child:Text(title,style: TextStyle(
                    fontSize: Dimens.sp16,
                    color: Colours.defaultTextColor,
                  ),),),
                  ImageIcon(AssetImage(ImageResource.right),size: Dimens.sp14,color: Colours.grayColor,),
                ],
              ),
            ),
            isVisible?Container(
              width: Screen.width,
              child:  const DividerLine(),
              margin: EdgeInsets.fromLTRB(Dimens.dp60, 0, Dimens.dp15, 0),
            ):const SizedBox()
          ],
        ),
        onTap: (){
          if(click!=null){
            click.call();
          }
        },
      ),
      color: Colors.white,
    );
  }
}

