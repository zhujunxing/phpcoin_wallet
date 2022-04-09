
import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/res/colors.dart';
import 'package:flutter_phpcoin/res/resource.dart';
import 'package:flutter_phpcoin/res/style.dart';
import 'package:flutter_phpcoin/widget/custom/custom_smart_refresher.dart';
import 'package:flutter_phpcoin/widget/custom/join_right.dart';
import 'package:get/get.dart';

import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../controller/page/home/assets/home_assets_have_wallet_controller.dart';
import '../../../../data/wallet/assets_b_data.dart';
import '../../../../utils/screen.dart';
import '../../../../widget/bar/app_bar.dart';
import '../../../../widget/bar/status_bar.dart';
import '../../assets/assets_b_item.dart';
import '../../assets/assets_coin_item.dart';



//
// ignore: must_be_immutable
class HomeAssetsHaveWallet extends StatelessWidget {

  late HomeAssetsHaveWalletController controller;
   HomeAssetsHaveWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    controller=Get.put(HomeAssetsHaveWalletController());
     controller.titleAr.value=["资产"];
     controller.initWallet();

    return Scaffold(
      backgroundColor: Colors.white,

        body:Obx((){
          return Column(
            children: [
              Container(
                  color:Colors.white,
                  child: Stack(
                    children: [
                      AppBar(
                        leading: Container(),
                        elevation: 0,
                        systemOverlayStyle:SystemUiOverlayStyle.dark,
                        backgroundColor: Colors.transparent,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const StatusBar(color:Colors.white,),
                          Container(
                            padding: EdgeInsets.fromLTRB(Dimens.dp15, 0,0, 0),
                            height: Screen.appBarHeight,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child:Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(

                                        decoration: BoxDecoration(
                                          color: Colours.accentColor,
                                          borderRadius: BorderRadius.circular(Dimens.dp20),
                                        ),
                                        height: Dimens.dp30,
                                        padding: EdgeInsets.fromLTRB(Dimens.dp10, 0, Dimens.dp4, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              constraints: BoxConstraints(
                                                maxWidth: Dimens.dp100,
                                              ),
                                              child: Text(controller.walletName.value,style: TextStyles.normalWhiteText,maxLines: 1,
                                                overflow: TextOverflow.ellipsis,),
                                            ),
                                            Gaps.wGap5,
                                            Container(
                                                width: Dimens.dp24,
                                                height: Dimens.dp24,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:Alignment.center,
                                                      child: ImageIcon(AssetImage(ImageResource.right),color: Colours.accentColor,size: Dimens.sp14,),
                                                    ),
                                                  ],
                                                )
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children:[
                                      GestureDetector(
                                        child: Container(
                                          height: Dimens.dp30,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.fromLTRB(Dimens.dp15, 0,Dimens.dp7, 0),
                                          child: ImageIcon(AssetImage(ImageResource.createWallet),size: Dimens.sp24,
                                            color: Colours.defaultTextColor,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          height: Dimens.dp30,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.fromLTRB(Dimens.dp7, 0, Dimens.dp15, 0),
                                          child: ImageIcon(AssetImage(ImageResource.scan),size: Dimens.sp24,
                                            color: Colours.defaultTextColor,
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
              ),
              Expanded(child: CustomSmartRefresher(
                refreshController: controller.refreshController,
                enablePullUp: false,
                child: CustomScrollView(
                  slivers: [

                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(left: Dimens.dp15,right: Dimens.dp15),
                        height: Dimens.dp140,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(Dimens.sp8),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors:[
                                Colours.accentColor,
                                Colours.accentColor.withOpacity(0.9),
                              ]
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colours.accentColor.withOpacity(0.4),
                                offset: Offset(0, Dimens.dp10), //阴影xy轴偏移量
                                blurRadius: Dimens.dp10, //阴影模糊程度
                                spreadRadius: 0 //阴影扩散程度
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Expanded(child: Stack(
                              children: [

                                Positioned(child: Container(
                                  padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp8, Dimens.dp10, Dimens.dp10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("我的资产(\$)",style: TextStyle(
                                            fontSize: Dimens.sp12,
                                            color: Colors.white,
                                          ),),
                                          GestureDetector(
                                            onTap: (){

                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(left: Dimens.dp6,right: Dimens.dp6),
                                              child: ImageIcon(AssetImage(ImageResource.eysOpen),size: Dimens.sp12,color: Colors.white.withOpacity(0.5),),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Gaps.hGap10,
                                      AnimatedDigitWidget(
                                          value: 0.00,
                                          fractionDigits: 2, // number of decimal places reserved, not rounded
                                          textStyle: TextStyle(
                                            fontSize: Dimens.sp28,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                    ],
                                  ),
                                ),left: 0,top:Dimens.dp10,),

                                Positioned(child: Container(
                                  child: Row(
                                    children: [
                                      Text("详情",style: TextStyle(
                                        fontSize: Dimens.sp12,
                                        color: Colors.white.withOpacity(0.5),
                                      ),),
                                      JoinRight(color: Colors.white.withOpacity(0.5),size: Dimens.sp12,),
                                    ],
                                  ),
                                  padding: EdgeInsets.fromLTRB(Dimens.dp10, Dimens.dp10, Dimens.dp10, Dimens.dp10),
                                ),top: 0,right: 0,),
                              ],
                            )),
                            Container(
                              width: Screen.width,
                              height: Dimens.dp45,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(Dimens.sp8),
                                    bottomLeft:Radius.circular(Dimens.sp8),
                                  )
                              ),
                              child: Row(
                                children: [
                                  Expanded(child: Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        ImageIcon(AssetImage(ImageResource.transfer),size: Dimens.sp14,color:Colors.white,),
                                        Gaps.wGap8,
                                        Text("转账",style: TextStyle(
                                          fontSize:Dimens.sp14,
                                          color: Colors.white,
                                        ),),
                                      ],
                                      mainAxisSize: MainAxisSize.min,
                                    ),
                                  )),
                                  Container(
                                    height: Dimens.dp15,
                                    width: Dimens.dp1,
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  Expanded(child: Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        ImageIcon(AssetImage(ImageResource.receive),size: Dimens.sp14,color:Colors.white,),
                                        Gaps.wGap8,
                                        Text("收款",style: TextStyle(
                                          fontSize:Dimens.sp14,
                                          color: Colors.white,
                                        ),),
                                      ],
                                      mainAxisSize: MainAxisSize.min,
                                    ),
                                  )),
                                  Container(
                                    height: Dimens.dp15,
                                    width: Dimens.dp1,
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  Expanded(child: Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        ImageIcon(AssetImage(ImageResource.exchange),size: Dimens.sp14,color:Colors.white,),
                                        Gaps.wGap8,
                                        Text("闪兑",style: TextStyle(
                                          fontSize:Dimens.sp14,
                                          color: Colors.white,
                                        ),),
                                      ],
                                      mainAxisSize: MainAxisSize.min,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ],

                        ),
                      ),
                    ),
                    SliverToBoxAdapter(child: Gaps.hGap10,),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: StickyTabBarDelegate(
                        child: DefaultTabController(
                          length:1,
                          child: Container(
                            color: Colors.white,
                            width: Screen.width,
                            height: Dimens.dp45,
                            padding: EdgeInsets.only(left:0,right: Dimens.dp15),
                            child: Row(
                              children: [
                                Expanded(child: TabBar(
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
                                )),
                                Container(
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
                                      Text("搜索",style: TextStyle(
                                        fontSize: Dimens.sp12,
                                        color: Colours.hintTextColor,
                                      ),)
                                    ],
                                  ),
                                ),
                                Gaps.wGap5,
                                Container(
                                  width:Dimens.dp25,
                                  height: Dimens.dp25,
                                  decoration: BoxDecoration(
                                    color: Colours.hintBgColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: ImageIcon(AssetImage(ImageResource.addBorder),size: Dimens.sp14,
                                          color: Colours.defaultTextColor,),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((content, index) {
                        AssetsCoinData  item=controller.dataAr.toList().elementAt(index);
                        return AssetsCoinItem(item,index);
                      }, childCount: controller.dataAr.length),
                    )
                  ],
                ),

              )),
            ],
          );
        })

    );
  }



}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => Dimens.dp45;

  @override
  double get minExtent => Dimens.dp45;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}



