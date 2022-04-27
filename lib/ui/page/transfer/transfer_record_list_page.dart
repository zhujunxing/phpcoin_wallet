

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_create_import_data.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/ui/dialog/input_content_dialog.dart';
import 'package:flutter_phpcoin/ui/dialog/sure_is_dialog.dart';
import 'package:flutter_phpcoin/ui/page/wallet/transfer_record_item.dart';
import 'package:flutter_phpcoin/ui/page/wallet/wallet_select_page.dart';
import 'package:flutter_phpcoin/utils/toast_util.dart';
import 'package:flutter_phpcoin/widget/custom/custom_smart_refresher.dart';


import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';


import '../../../controller/page/transfer/transfer_receive_erwei_controller.dart';
import '../../../controller/page/transfer/transfer_record_list_controller.dart';
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


// ignore: must_be_immutable
class TransferRecordListPage extends StatefulWidget {

  String? address;
  int index;
  TransferRecordListPage({Key? key,this.address,this.index=0}) : super(key: key);

  @override
  State<TransferRecordListPage> createState() => _TransferRecordListPageState();
}

class _TransferRecordListPageState extends State<TransferRecordListPage> {
  TransferRecordListController controller=TransferRecordListController();

  @override
  void initState() {
    super.initState();

    controller.initData(widget.address!,widget.index);
    Future.delayed(Duration.zero,(){
      controller.refreshController.requestRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  CustomSmartRefresher(
      refreshController: controller.refreshController,
      onRefresh: (){
        controller.refreshing(context);
      },
      onLoading: (){
        controller.loading(context);
      },
      child: CustomScrollView(
        slivers: [
          Obx((){
            return SliverList(
              delegate: SliverChildBuilderDelegate((content, index) {
                return  GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: TransferRecordItem(controller.dataAr.toList().elementAt(index),index),
                  onTap: (){
                    Get.toNamed(Routes.web,arguments: "https://node1.phpcoin.net/apps/explorer/tx.php?id=${controller.dataAr.toList().elementAt(index).id}");
                  },
                );
              }, childCount: controller.dataAr.length),
            );
          }),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, Dimens.dp20, 0, 0),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(Dimens.dp10, 0, Dimens.dp10, 0),
                      height: Dimens.dp30,
                      alignment: Alignment.center,
                      child: Text(Ids.viewMoreRecords.tr,style: TextStyle(
                        fontSize: Dimens.sp14,
                        color: Colours.grayColor,
                        height: 1,
                      ),),
                      decoration: BoxDecoration(
                        color: Colours.hintBgColor,
                        borderRadius: BorderRadius.circular(Dimens.sp4),
                      ),

                    ),
                    onTap: (){
                      Get.toNamed(Routes.web,arguments: "https://node1.phpcoin.net/apps/explorer/address.php?address=${controller.address}");
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}

