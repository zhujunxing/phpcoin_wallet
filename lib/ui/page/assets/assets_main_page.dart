
import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/ui/page/assets/assets_b_item.dart';
import 'package:flutter_phpcoin/widget/custom/back_button.dart';
import 'package:get/get.dart';

import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../controller/page/assets/assets_main_controller.dart';
import '../../../controller/page/home/home_assets_controller.dart';
import '../../../controller/page/home/home_myself_controller.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../widget/bar/app_bar.dart';
import '../../../widget/custom/custom_smart_refresher.dart';
import '../../../widget/custom/divider_line.dart';


//总资产
// ignore: must_be_immutable
class AssetsMainPage extends StatelessWidget {
  late AssetsMainController controller;
  AssetsMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    controller=Get.put(AssetsMainController());

    return Scaffold(
        backgroundColor: Colours.bgColor,
        appBar:BaseAppBar(
          leading: BackBt(onPressed: (){
            Get.back();
          },),
          title:Ids.totalAssets.tr,
          bgColor: Colors.white,
        ),
      body:CustomSmartRefresher(
          refreshController:controller.refreshController,
          isCustomHeader: true,
          onRefresh: (){
            controller.refreshController.refreshCompleted();
          },
          enablePullUp: false,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Gaps.hGap10,
              ),
              SliverToBoxAdapter(
                child: Obx((){
                  return Container(
                    margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
                    width: Screen.width,
                    height: Dimens.dp120,
                    decoration: BoxDecoration(
                      color: Colours.accentColor,
                      borderRadius: BorderRadius.circular(Dimens.sp6),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("${Ids.myAssets.tr}(\$)",style: TextStyle(
                              fontSize: Dimens.sp12,
                              color: Colors.white.withOpacity(0.5),
                            ),),
                            GestureDetector(
                              onTap: (){
                                controller.isEye.value=!controller.isEye.value;
                              },
                              child: Container(
                                padding: EdgeInsets.fromLTRB(Dimens.dp6,0, Dimens.dp6, 0),
                                child: ImageIcon(AssetImage(controller.isEye.value?ImageResource.eysOpen:ImageResource.eysClose,),size: Dimens.sp12,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gaps.hGap10,

                        controller.isEye.value?AnimatedDigitWidget(
                          value: 0.00,
                          fractionDigits: 2, // number of decimal places reserved, not rounded
                          textStyle: TextStyle(
                            fontSize: Dimens.sp28,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ):Text("***",style: TextStyle(
                          fontSize: Dimens.sp28,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),),
                      ],
                    ),
                  );
                })
              ),
              SliverToBoxAdapter(
                child: Gaps.hGap10,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((content, index) {
                  dynamic  item=controller.dataAr.toList().elementAt(index);
                  return Container(
                    margin: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp10, Dimens.dp15, 0),
                    child: AssetsBItem(controller.dataAr.toList().elementAt(index),index),
                  );
                }, childCount: controller.dataAr.length),
              )



            ],
          )
      ),

    );
  }


}




