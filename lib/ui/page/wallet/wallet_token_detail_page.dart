

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/data/transfer/transfer_token_data.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_create_import_data.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/ui/dialog/input_content_dialog.dart';
import 'package:flutter_phpcoin/ui/dialog/sure_is_dialog.dart';
import 'package:flutter_phpcoin/ui/page/wallet/wallet_select_page.dart';
import 'package:flutter_phpcoin/utils/toast_util.dart';
import 'package:flutter_phpcoin/widget/custom/join_right.dart';


import 'package:get/get.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';


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
import '../home/assets/home_assets_have_wallet.dart';

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
        appBar:  BaseAppBar(
          title:Ids.tokenDetail.tr,
        ),
        body:Column(
          children: [
            Expanded(child:  NestedScrollView(
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
                                  Text(Ids.projectDetail.tr,style: TextStyle(
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
                              child:  Text(Ids.assetsBalance.tr,style: TextStyles.largeText,),
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

                  SliverToBoxAdapter(
                    child: Container(
                      width: Screen.width,
                      height: Dimens.dp6,
                      color: Colours.bgColor,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      width: Screen.width,
                      height: Dimens.dp60,
                      padding: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(Ids.exchange.tr,style: TextStyle(
                              fontSize: Dimens.sp14,
                              color: Colours.defaultTextColor
                          ),),
                          Gaps.hGap4,
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(Ids.referencePrice.tr,style: TextStyle(
                                fontSize: Dimens.sp14,
                                color: Colours.grayColor,
                              ),),
                              Gaps.wGap10,
                              Text("\$ 0.00",style: TextStyle(
                                fontSize: Dimens.sp14,
                                color: Colours.redColor,
                              ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      width: Screen.width,
                      height: Dimens.dp6,
                      color: Colours.bgColor,
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: StickyTabBarDelegate(
                      child: DefaultTabController(
                        length:controller.titleAr.length,
                        child: Container(
                          color: Colors.white,
                          width: Screen.width,
                          height: Dimens.dp45,
                          padding: EdgeInsets.only(left:0,right: Dimens.dp15),
                          child: Row(
                            children: [
                              Expanded(child: controller.titleAr.isNotEmpty?TabBar(
                                indicatorSize: TabBarIndicatorSize.label,
                                unselectedLabelColor: Colours.grayColor,
                                isScrollable: true,
                                indicatorPadding: EdgeInsets.fromLTRB(0, 0, 0, Dimens.dp4),
                                labelStyle: TextStyle(
                                  fontSize: Dimens.sp16,
                                  color: Colours.defaultTextColor,
                                ),
                                unselectedLabelStyle: TextStyle(
                                  fontSize: Dimens.sp16,
                                  color: Colours.grayColor,
                                ),
                                indicator: MaterialIndicator(
                                  height: Dimens.dp3,
                                  topLeftRadius: Dimens.sp2,
                                  strokeWidth: Dimens.dp4,
                                  topRightRadius: Dimens.sp2,
                                  bottomLeftRadius: Dimens.sp2,
                                  bottomRightRadius:Dimens.sp2,
                                  horizontalPadding: Dimens.dp4,
                                  color: Colours.defaultTextColor,
                                ),
                                tabs:  controller.titleAr.toList().map((item) {
                                  return Tab(
                                    child: Text(
                                      item,
                                    ),
                                  );
                                }).toList(),
                              ):Container()),
                              GestureDetector(
                                child: Container(
                                  width: Dimens.dp90,
                                  height: Dimens.dp25,
                                  padding: EdgeInsets.only(left: Dimens.dp10),
                                  decoration: BoxDecoration(
                                    color: Colours.hintBgColor,
                                    borderRadius: BorderRadius.circular(Dimens.sp20),
                                  ),
                                  child: Row(
                                    children: [
                                      ImageIcon(AssetImage(ImageResource.search),size: Dimens.sp14,
                                        color: Colours.defaultTextColor,),
                                      Gaps.wGap4,
                                      Text(Ids.search.tr,style: TextStyle(
                                        fontSize: Dimens.sp12,
                                        color: Colours.hintTextColor,
                                      ),)
                                    ],
                                  ),
                                ),
                                onTap: (){

                                },
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: DividerLine(),
                  ),
                ];
              },
              body: Container(),
            ),),
            const DividerLine(),
            Container(
              color: Colors.white,
              height: Dimens.dp50,
              padding: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15,0),
              child: Row(
                children: [
                  Expanded(child: CustomButton(
                    Ids.transfer.tr,
                    color: Colours.color00d8a7,
                    onPressed: (){
                      Get.toNamed(Routes.transferToken,arguments: TransferTokenData(tokenAddress: controller.tokenAddress.value,tokenName: controller.tokenName.value,
                      transferAddress: ""));
                    },
                  )),
                  Gaps.wGap15,
                  Expanded(child: CustomButton(
                    Ids.collection.tr,
                    color: Colours.accentColor,
                    onPressed: (){

                      Get.toNamed(Routes.transferReceiveErWei,arguments: controller.wallet!.walletAddress??"");
                    },
                  )),
                ],
              ),
            ),
            Container(
              width: Screen.width,
              color: Colors.white,
              height: Screen.bottomBarHeight
            ),
          ],
        )
    );
  }

}

