

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_create_import_data.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/ui/page/wallet/wallet_select_page.dart';


import 'package:get/get.dart';


import '../../../controller/page/wallet/wallet_create_import_controller.dart';
import '../../../controller/page/wallet/wallet_select_controller.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../widget/bar/app_bar.dart';
import '../../../widget/custom/back_button.dart';
import '../../../widget/custom/divider_line.dart';


// ignore: must_be_immutable
class WalletCreateImportPage extends StatelessWidget {
  late WalletCreateImportController controller;
  WalletCreateImportData data;
  WalletCreateImportPage(this.data,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller=Get.put(WalletCreateImportController(data));
    return Scaffold(
        backgroundColor: Colours.bgColor,
        appBar:BaseAppBar(
          title:data.walletSelectType==WalletSelectType.create?"创建钱包":"导入钱包",
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Gaps.hGap10,
            ),
            controller.data.walletSelectType==WalletSelectType.create?SliverToBoxAdapter(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, Dimens.dp15),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colours.blueColor,
                            shape: BoxShape.circle
                        ),
                        padding: EdgeInsets.all(Dimens.dp8),
                        child: ImageIcon(AssetImage(ImageResource.walletIcon),size: Dimens.dp18,
                          color: Colors.white,
                        ),
                      ),
                      Gaps.wGap15,
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("创建钱包",style: TextStyle(
                            fontSize: Dimens.sp16,
                            color: Colours.defaultTextColor,
                          ),),
                          Gaps.hGap4,
                          Text("创建钱包",style: TextStyle(
                            fontSize: Dimens.sp12,
                            color: Colours.grayColor,
                          ),),
                        ],
                      )),
                      ImageIcon(AssetImage(ImageResource.right),size: Dimens.sp14,color: Colours.grayColor,),
                    ],
                  ),
                ),
                onTap: (){
                  WalletCreateImportData data=WalletCreateImportData(walletType: controller.data.walletType,walletSelectType: controller.data.walletSelectType,refresh: (){
                    if(controller.data.refresh!=null){
                      controller.data.refresh!.call();
                    }
                    Get.back();
                  });
                  Get.toNamed(Routes.walletCreate,arguments:data);
                },
              ),
            ):
            SliverToBoxAdapter(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, Dimens.dp15),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colours.blueColor,
                            shape: BoxShape.circle
                        ),
                        padding: EdgeInsets.all(Dimens.dp8),
                        child: ImageIcon(AssetImage(ImageResource.keyIcon),size: Dimens.dp18,
                          color: Colors.white,
                        ),
                      ),


                      Gaps.wGap15,
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("私钥导入",style: TextStyle(
                            fontSize: Dimens.sp16,
                            color: Colours.defaultTextColor,
                          ),),
                          Gaps.hGap4,
                          Text("通过输入明文公钥跟私钥或扫描私钥二维码进行导入",style: TextStyle(
                            fontSize: Dimens.sp12,
                            color: Colours.grayColor,
                          ),),
                        ],
                      )),
                      ImageIcon(AssetImage(ImageResource.right),size: Dimens.sp14,color: Colours.grayColor,),
                    ],
                  ),
                ),
                onTap: (){
                  WalletCreateImportData data=WalletCreateImportData(walletType: controller.data.walletType,walletSelectType: controller.data.walletSelectType,refresh: (){
                    if(controller.data.refresh!=null){
                      controller.data.refresh!.call();
                    }
                    Get.back();
                  });
                  Get.toNamed(Routes.walletPrivateImport,arguments:data);

                },
              ),
            ),
            SliverToBoxAdapter(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, Dimens.dp15),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colours.color73c9a6,
                            shape: BoxShape.circle
                        ),
                        padding: EdgeInsets.all(Dimens.dp8),
                        child: ImageIcon(AssetImage(ImageResource.seeIcon),size: Dimens.dp18,
                          color: Colors.white,
                        ),
                      ),
                      Gaps.wGap15,
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("观察钱包",style: TextStyle(
                            fontSize: Dimens.sp16,
                            color: Colours.defaultTextColor,
                          ),),
                          Gaps.hGap4,
                          Text("无需导入私钥，输入对应公钥即可导入",style: TextStyle(
                            fontSize: Dimens.sp12,
                            color: Colours.grayColor,
                          ),),
                        ],
                      )),
                      ImageIcon(AssetImage(ImageResource.right),size: Dimens.sp14,color: Colours.grayColor,),
                    ],
                  ),
                ),
                onTap: (){

                  WalletCreateImportData data=WalletCreateImportData(walletType: controller.data.walletType,walletSelectType: controller.data.walletSelectType,refresh: (){
                    if(controller.data.refresh!=null){
                      controller.data.refresh!.call();
                    }
                    Get.back();
                  });
                  Get.toNamed(Routes.walletWatchImport,arguments:data);

                },
              ),
            ),
          ]),
    );
  }

}

