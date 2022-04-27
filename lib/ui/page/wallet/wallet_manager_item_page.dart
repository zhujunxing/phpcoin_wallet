

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_create_import_data.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/ui/dialog/input_content_dialog.dart';
import 'package:flutter_phpcoin/ui/dialog/sure_is_dialog.dart';
import 'package:flutter_phpcoin/ui/page/wallet/wallet_manager_right_page.dart';
import 'package:flutter_phpcoin/ui/page/wallet/wallet_select_page.dart';
import 'package:flutter_phpcoin/utils/toast_util.dart';


import 'package:get/get.dart';


import '../../../controller/page/wallet/wallet_create_controller.dart';
import '../../../controller/page/wallet/wallet_create_import_controller.dart';
import '../../../controller/page/wallet/wallet_detail_controller.dart';
import '../../../controller/page/wallet/wallet_manager_controller.dart';
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
import 'wallet_detail_page.dart';
import 'wallet_manager_left_item.dart';

class WalletManagerClickType{
   static const int detail=0;
  static const int switchWallet=1;
}


///钱包管理-子布局
// ignore: must_be_immutable
class WalletManagerItemPage extends StatelessWidget {
  late WalletManagerController controller;
    int? clickType;
  WalletManagerItemPage({Key? key,this.clickType=WalletManagerClickType.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller=Get.put(WalletManagerController());
    return Obx((){
      return Row(
        children: [
          Container(
              color: Colours.bgColor,
              width: Dimens.dp80,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(0),
                itemBuilder: (BuildContext context, int i) {
                  return WalletManagerLeftItem(controller.leftAr.toList().elementAt(i),i,leftSelect: controller.leftSelect,);
                },
                shrinkWrap: true,
                itemCount: controller.leftAr.length,
              )
          ),
          Expanded(child: controller.leftAr.isNotEmpty?
          WalletManagerRightPage(controller.leftAr.toList().elementAt(controller.leftSelect,),
          callback: (wallet){
             if(wallet!=null){
                if(clickType==WalletManagerClickType.detail){
                  Get.off(WalletDetailPage(wallet:wallet));
                }else{

          
                  controller.switchWallet(wallet);

                }

             }

          },)
              :
          const SizedBox(),),
        ],
      );
    });
  }

}

