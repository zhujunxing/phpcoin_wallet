

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_create_import_data.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/ui/dialog/input_content_dialog.dart';
import 'package:flutter_phpcoin/ui/dialog/sure_is_dialog.dart';
import 'package:flutter_phpcoin/ui/page/wallet/wallet_select_page.dart';
import 'package:flutter_phpcoin/utils/toast_util.dart';
import 'package:flutter_phpcoin/widget/custom/join_right.dart';


import 'package:get/get.dart';


import '../../../controller/page/wallet/wallet_create_controller.dart';
import '../../../controller/page/wallet/wallet_create_import_controller.dart';
import '../../../controller/page/wallet/wallet_detail_controller.dart';
import '../../../controller/page/wallet/wallet_select_controller.dart';
import '../../../controller/page/wallet/wallet_token_detail_controller.dart';
import '../../../controller/page/wallet/wallet_watch_import_controller.dart';
import '../../../data/wallet/wallet_token_detail_data.dart';
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

///钱包token详情
// ignore: must_be_immutable
class WalletTokenDetailPage extends StatelessWidget {
  late WalletTokenDetailController controller;
  final WalletTokenDetailData data;
  WalletTokenDetailPage({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller=Get.put(WalletTokenDetailController(data));


    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const BaseAppBar(
          title:"Token详情",
        ),
        body:NestedScrollView(
          headerSliverBuilder: (context, b) {
            return [
               SliverToBoxAdapter(
                child:Container(
                  padding: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
                  height: Dimens.dp60,
                  child: Stack(
                    children: [

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: Dimens.dp40,height: Dimens.dp40,
                              child: Image.asset(ImageResource.phpCoin,width: Dimens.dp38,height: Dimens.dp38,),
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
                            Text(controller.tokenName.value,style: TextStyles.largeText,),
                          ],
                        ),
                      ),

                      Align(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("项目详情",style: TextStyle(
                                fontSize: Dimens.sp12,
                                color: Colours.grayColor,
                              ),),
                              Gaps.wGap2,
                              JoinRight(color: Colours.grayColor,size: Dimens.sp12,),
                            ],
                          ),
                          onTap: (){
                             Get.toNamed(Routes.web,arguments: "https://phpcoin.net/");
                          },
                        ),
                        alignment: Alignment.centerRight,
                      ),

                    ],
                  ),
                ),
              ),

               SliverToBoxAdapter(
                child: DividerLine(left: Dimens.dp15,right: Dimens.dp15,),
              ),
                Obx((){
                  return SliverToBoxAdapter(
                    child:Container(
                      padding: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
                      height: Dimens.dp60,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child:  Text("资产详情",style: TextStyles.largeText,),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child:Container(
                              alignment: Alignment.centerRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(controller.balance.value,style: TextStyle(
                                    fontSize: Dimens.sp18,
                                    color:Colours.defaultTextColor,
                                  ),),
                                  Gaps.hGap2,
                                  Text("≈ \$0",style: TextStyle(
                                    fontSize: Dimens.sp12,
                                    color:Colours.grayColor,
                                  ),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            ];
          },
          body: Container(),
        )
    );
  }

}

