

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
import 'wallet_manager_left_item.dart';

///钱包管理
// ignore: must_be_immutable
class WalletManagerPage extends StatelessWidget {
  late WalletManagerController controller;

  WalletManagerPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller=Get.put(WalletManagerController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const BaseAppBar(
          title:"钱包管理",
        ),
        body: Obx((){
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
               WalletManagerRightPage(controller.leftAr.toList().elementAt(controller.leftSelect))
                   :
               const SizedBox(),),
            ],
          );
        })
    );
  }

}

