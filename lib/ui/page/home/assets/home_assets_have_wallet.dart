
import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_token_detail_data.dart';
import 'package:flutter_phpcoin/res/colors.dart';
import 'package:flutter_phpcoin/res/resource.dart';
import 'package:flutter_phpcoin/res/style.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/ui/dialog/select_bottom_dialog.dart';
import 'package:flutter_phpcoin/ui/page/wallet/wallet_token_detail_page.dart';
import 'package:flutter_phpcoin/widget/custom/custom_smart_refresher.dart';
import 'package:flutter_phpcoin/widget/custom/join_right.dart';
import 'package:get/get.dart';

import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../controller/page/home/assets/home_assets_have_wallet_controller.dart';
import '../../../../data/transfer/transfer_token_data.dart';
import '../../../../data/wallet/assets_b_data.dart';
import '../../../../lang/string.dart';
import '../../../../utils/screen.dart';
import '../../../../utils/toast_util.dart';
import '../../../../widget/bar/app_bar.dart';
import '../../../../widget/bar/status_bar.dart';
import '../../../dialog/wallet/wallet_select_dialog.dart';
import '../../assets/assets_b_item.dart';
import '../../assets/assets_coin_item.dart';
import '../../wallet/wallet_select_page.dart';



//
// ignore: must_be_immutable
class HomeAssetsHaveWallet extends StatelessWidget {

  late HomeAssetsHaveWalletController controller;
   HomeAssetsHaveWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    controller=Get.put(HomeAssetsHaveWalletController());
     controller.titleAr.value=[(Ids.assets.tr)];


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
                                      GestureDetector(
                                        onTap: (){
                                          controller.isOpen.value=true;
                                          Get.bottomSheet(WalletSelectDialog(),isScrollControlled: true);
                                        },
                                        child: Container(

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
                                                        child: ImageIcon(AssetImage(controller.isOpen.value?ImageResource.down:ImageResource.right),color: Colours.accentColor,size: Dimens.sp14,),
                                                      ),
                                                    ],
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children:[
                                      GestureDetector(
                                        onTap: (){
                                          List<String> data=[Ids.createWallet.tr,Ids.importWallet.tr];
                                          Get.bottomSheet(SelectBottomDialog(data,selectCallback: (select){
                                              if(select==0){
                                                Get.toNamed(Routes.walletSelect,arguments: WalletSelectType.create);
                                              }else if(select==1){
                                                Get.toNamed(Routes.walletSelect,arguments: WalletSelectType.import);
                                              }
                                          },));

                                        },
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
                                        onTap: ()async{

                                       var result=await Get.toNamed(Routes.scan);
                                       if(result!=null){
                                         Get.toNamed(Routes.transferToken,arguments: TransferTokenData(tokenAddress:"",tokenName: "PHPCOIN",
                                             transferAddress: result));
                                       }

                                        },
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
                onRefresh: (){
                  controller.queryBalance();
                },
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
                            Expanded(child: GestureDetector(
                              child: Stack(
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
                                            Text("${Ids.myAssets.tr}(\$)",style: TextStyle(
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
                                            loop: false,
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
                                        Text(Ids.detail.tr,style: TextStyle(
                                          fontSize: Dimens.sp12,
                                          color: Colors.white.withOpacity(0.5),
                                        ),),
                                        JoinRight(color: Colors.white.withOpacity(0.5),size: Dimens.sp12,),
                                      ],
                                    ),
                                    padding: EdgeInsets.fromLTRB(Dimens.dp10, Dimens.dp10, Dimens.dp10, Dimens.dp10),
                                  ),top: 0,right: 0,),
                                ],
                              ),
                              onTap: (){
                                   if(controller.wallet==null){
                                     return;
                                   }
                                 Get.toNamed(Routes.walletDetail,arguments: controller.wallet);
                              },
                              behavior: HitTestBehavior.opaque,
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
                                  Expanded(child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Row(
                                        children: [
                                          ImageIcon(AssetImage(ImageResource.transfer),size: Dimens.sp14,color:Colors.white,),
                                          Gaps.wGap8,
                                          Text(Ids.transfer.tr,style: TextStyle(
                                            fontSize:Dimens.sp14,
                                            color: Colors.white,
                                          ),),
                                        ],
                                        mainAxisSize: MainAxisSize.min,
                                      ),
                                    ),
                                    onTap: (){
                                      Get.toNamed(Routes.transferToken,arguments: TransferTokenData(tokenAddress:"",tokenName: "PHPCOIN",
                                          transferAddress: ""));
                                    },
                                  )),
                                  Container(
                                    height: Dimens.dp15,
                                    width: Dimens.dp1,
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  Expanded(child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: (){
                                      if(controller.wallet==null){
                                        return;
                                      }
                                      Get.toNamed(Routes.transferReceiveErWei,arguments: controller.wallet!.walletAddress);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Row(
                                        children: [
                                          ImageIcon(AssetImage(ImageResource.receive),size: Dimens.sp14,color:Colors.white,),
                                          Gaps.wGap8,
                                          Text(Ids.collection.tr,style: TextStyle(
                                            fontSize:Dimens.sp14,
                                            color: Colors.white,
                                          ),),
                                        ],
                                        mainAxisSize: MainAxisSize.min,
                                      ),
                                    ),
                                  )),
                                  Container(
                                    height: Dimens.dp15,
                                    width: Dimens.dp1,
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  Expanded(child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Row(
                                        children: [
                                          ImageIcon(AssetImage(ImageResource.exchange),size: Dimens.sp14,color:Colors.white,),
                                          Gaps.wGap8,
                                          Text(Ids.exchange1.tr,style: TextStyle(
                                            fontSize:Dimens.sp14,
                                            color: Colors.white,
                                          ),),
                                        ],
                                        mainAxisSize: MainAxisSize.min,
                                      ),
                                    ),
                                    onTap: (){
                                       ToastUtil.toast(context, Ids.waitingOpen.tr);
                                    },
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
                                    ToastUtil.toast(context, Ids.waitingOpen.tr);
                                  },
                                ),
                                Gaps.wGap5,
                                GestureDetector(
                                  child: Container(
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
                                  onTap: (){
                                    ToastUtil.toast(context, Ids.waitingOpen.tr);
                                  },
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
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: AssetsCoinItem(item,index),
                          onTap: (){
                            WalletTokenDetailData data=WalletTokenDetailData(wallet: controller.wallet,tokenName: item.tokenName, tokenAddress:item.tokenAddress);
                            Get.toNamed(Routes.walletTokenDetail,arguments: data);
                          },
                        );
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



