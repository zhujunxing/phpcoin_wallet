

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_create_import_data.dart';
import 'package:flutter_phpcoin/ui/page/wallet/wallet_select_page.dart';


import 'package:get/get.dart';


import '../../../controller/page/wallet/wallet_create_controller.dart';
import '../../../controller/page/wallet/wallet_create_import_controller.dart';
import '../../../controller/page/wallet/wallet_select_controller.dart';
import '../../../controller/page/wallet/wallet_watch_import_controller.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../widget/bar/app_bar.dart';
import '../../../widget/custom/back_button.dart';
import '../../../widget/custom/custom_button.dart';
import '../../../widget/custom/divider_line.dart';


// ignore: must_be_immutable
class WalletWatchImportPage extends StatelessWidget {
  late WalletWatchImportController controller;
  WalletCreateImportData data;
  WalletWatchImportPage(this.data,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller=Get.put(WalletWatchImportController(data));
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: BaseAppBar(
          title:Ids.watchWallet.tr,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Gaps.hGap10,
            ),
            SliverToBoxAdapter(
              child:Container(
                height: Dimens.dp80,
                margin: EdgeInsets.fromLTRB(Dimens.dp15,0, Dimens.dp15,0),
                padding: EdgeInsets.fromLTRB(Dimens.dp10, Dimens.dp10, Dimens.dp10, Dimens.dp10),
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
                    isCollapsed: true,
                    hintText:Ids.enterOrPasteWalletAddress.tr,
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
                margin: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp10, Dimens.dp15, 0),
                child: Text(Ids.watchWalletImportTip.tr,style: TextStyle(
                  fontSize: Dimens.sp12,
                  color: Colours.defaultTextColor,
                ),),
              ),
            ),
            SliverToBoxAdapter(
              child: Gaps.hGap20,
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Row(
                  children: [
                    Text(Ids.walletSystem.tr,style: TextStyle(
                      fontSize: Dimens.sp12,
                      color: Colours.defaultTextColor,
                    ),),
                    Gaps.wGap20,
                    Text(controller.data.walletType,style: TextStyle(
                      fontSize: Dimens.sp12,
                      color: Colours.grayColor,
                    ),),
                  ],
                ),
                margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
              ),
            ),

            SliverToBoxAdapter(
              child: Gaps.hGap40,
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

