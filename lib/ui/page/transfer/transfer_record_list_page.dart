

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
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';


import '../../../controller/page/transfer/transfer_receive_erwei_controller.dart';
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

///转账交易-交易列表
// ignore: must_be_immutable
class TransferReceiveErWeiPage extends StatelessWidget {
  late TransferReceiveErWeiController controller;
   String address;

  TransferReceiveErWeiPage({Key? key,required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller=Get.put(TransferReceiveErWeiController(address));
    return RepaintBoundary(
      key: controller.rootWidgetKey,
      child: Scaffold(
        backgroundColor: Colours.accentColor,
        appBar:const BaseAppBar(
          title:"收款",
          backBtColor:Colors.white,
          bgColor: Colors.transparent,
          textColor: Colors.white,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Gaps.hGap20,
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimens.sp10),
                ),
                margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Gaps.hGap20,
                          Container(
                            decoration: BoxDecoration(
                              color: Colours.orangeColor.withOpacity(0.1),
                              borderRadius:
                              BorderRadius.circular(Dimens.sp4),
                            ),
                            margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15,0),
                            padding: EdgeInsets.all(Dimens.dp10),
                            child: Row(
                              children: [
                                Gaps.wGap20,
                                ImageIcon(AssetImage(ImageResource.warn),size: Dimens.sp16,
                                  color: Colours.orangeColor,),
                                Gaps.wGap10,
                                Expanded(child: Text("仅向该地址转入PHPCOIN相关资产",style: TextStyle(
                                  fontSize: Dimens.sp12,
                                  color: Colours.orangeColor,
                                  fontWeight: FontWeight.w500,
                                ),))
                              ],
                            ),
                          ),
                          Gaps.hGap20,
                          Container(
                            alignment: Alignment.center,
                            child: SizedBox(
                              child: QrImage(
                                data: controller.address.value,
                                version: QrVersions.auto,
                                size: Dimens.dp200,
                              ),
                              width: Dimens.dp200,
                              height: Dimens.dp200,
                            ),
                          ),
                          Gaps.hGap30,
                        ],
                        mainAxisSize: MainAxisSize.min,
                      ),
                      decoration:BoxDecoration(
                          color: Colours.bgColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimens.sp10),
                            topRight: Radius.circular(Dimens.sp10),
                          )
                      ),
                    ),
                    Gaps.hGap20,
                    Container(
                      margin: EdgeInsets.fromLTRB(Dimens.dp15,0, Dimens.dp15, 0),
                      padding: EdgeInsets.only(top:  Dimens.dp10,bottom: Dimens.dp10),
                      child: Column(
                        children: [
                          Text("收款地址",style: TextStyle(
                            fontSize: Dimens.sp16,
                            color: Colours.grayColor,
                          ),),
                          Gaps.hGap10,
                          Container(
                            child: Text(address,style: TextStyle(
                              fontSize: Dimens.sp14,
                              color: Colours.defaultTextColor,
                            ),textAlign: TextAlign.center,),
                            margin: EdgeInsets.only(left: Dimens.sp20,right: Dimens.sp20),
                          ),
                        ],
                        mainAxisSize: MainAxisSize.min,
                      ),
                      decoration:BoxDecoration(
                        color: Colours.bgColor,
                        borderRadius: BorderRadius.circular(Dimens.sp10),
                      ),
                    ),
                    SizedBox(
                      height: Dimens.dp60,
                      child: Row(
                        children: [
                          Expanded(child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ImageIcon(AssetImage(ImageResource.share),size: Dimens.sp16,),
                                  Gaps.wGap5,
                                  Text(Ids.share.tr,style: TextStyle(
                                    fontSize: Dimens.sp16,
                                    color: Colours.defaultTextColor,
                                  ),),
                                ],
                              ),
                              alignment: Alignment.center,
                            ),
                            onTap: (){

                              controller.share(context);



                            },
                          )),
                          Expanded(child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ImageIcon(AssetImage(ImageResource.copy),size: Dimens.sp16,),
                                  Gaps.wGap5,
                                  Text("复制",style: TextStyle(
                                    fontSize: Dimens.sp16,
                                    color: Colours.defaultTextColor,
                                  ),),
                                ],
                              ),
                              alignment: Alignment.center,
                            ),
                            onTap: (){
                              Clipboard.setData(ClipboardData(text:controller.address.value));
                              ToastUtil.toast(context, "${controller.address.value}已复制到粘贴板");
                            },
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Gaps.hGap20,
            ),

          ],
        ),
      ),
    );
  }

}

