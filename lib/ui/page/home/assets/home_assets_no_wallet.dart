
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/res/colors.dart';
import 'package:flutter_phpcoin/res/resource.dart';
import 'package:flutter_phpcoin/res/style.dart';
import 'package:flutter_phpcoin/ui/page/wallet/wallet_select_page.dart';
import 'package:flutter_phpcoin/utils/screen.dart';

import 'package:flutter_phpcoin/widget/bar/app_bar.dart';
import 'package:flutter_phpcoin/widget/custom/divider_line.dart';
import 'package:get/get.dart';

import '../../../../lang/string.dart';
import '../../../../routes/app_pages.dart';




//
// ignore: must_be_immutable
class HomeAssetsNoWallet extends StatefulWidget {

  const HomeAssetsNoWallet({Key? key}) : super(key: key);

  @override
  State<HomeAssetsNoWallet> createState() => _HomeAssetsNoWalletState();
}

class _HomeAssetsNoWalletState extends State<HomeAssetsNoWallet> {
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      body:CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child:Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colours.color46B1FF,
                  Colours.colorA554e2,

                ]),
              ),
              width: Screen.width,
              height: Dimens.dp250,
              alignment: Alignment.center,
              child:Stack(

                children: [

                  Align(
                    alignment: Alignment.topCenter,
                    child: Opacity(opacity: 0.5,child: Image.asset(ImageResource.slide,fit: BoxFit.fill,height: Dimens.dp250,),),
                  ),
                  Align(
                    child:  Column(
                      children: [
                         BaseAppBar(
                          leading:Container(),
                          title: "",
                          bgColor: Colors.transparent,
                           systemOverlayStyle: SystemUiOverlayStyle.light,
                        ),
                        Gaps.hGap10,
                        Text(Ids.phpWebBuild.tr,style: TextStyle(
                          fontSize: Dimens.sp20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),),
                        Gaps.hGap4,
                        Text(Ids.phpWebBuildDesc.tr,style: TextStyle(
                          fontSize: Dimens.sp16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),),
                      ],
                    ),
                    alignment: Alignment.topCenter,
                  ),
                ],
              )
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
              height: Dimens.dp80,
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(Ids.digitalAssetWallet.tr,style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colours.defaultTextColor,
                    fontSize: Dimens.sp18,
                  ),),
                  Gaps.hGap4,
                  Text("${Ids.currentlySupported.tr} PHPCOIN ${Ids.maleChain.tr}",style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colours.grayColor,
                    fontSize: Dimens.sp12,
                  ),),
                ],
              ),
            ),
          ),


          SliverToBoxAdapter(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, Dimens.dp15),
                child: Row(
                  children: [
                    Image.asset(ImageResource.importWallet,width: Dimens.dp30,),
                    Gaps.wGap15,
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(Ids.haveWallet.tr,style: TextStyle(
                          fontSize: Dimens.sp16,
                          color: Colours.defaultTextColor,
                        ),),
                        Gaps.hGap4,
                        Text(Ids.importWallet.tr,style: TextStyle(
                          fontSize: Dimens.sp12,
                          color: Colours.grayColor,
                        ),),
                      ],
                    )),
                    ImageIcon(AssetImage(ImageResource.right),size: Dimens.sp14,color: Colours.grayColor,),
                  ],
                ),
              ),
              onTap: (){
                Get.toNamed(Routes.walletSelect,arguments: WalletSelectType.import);

              },
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: Screen.width,
              child: const DividerLine(),
              margin: EdgeInsets.fromLTRB(Dimens.dp60, 0, Dimens.dp15, 0),
            ),
          ),
          SliverToBoxAdapter(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, Dimens.dp15),
                child: Row(
                  children: [
                    Image.asset(ImageResource.createWallet,width: Dimens.dp30,),
                    Gaps.wGap15,
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(Ids.noHaveWallet.tr,style: TextStyle(
                          fontSize: Dimens.sp16,
                          color: Colours.defaultTextColor,
                        ),),
                        Gaps.hGap4,
                        Text(Ids.createWallet.tr,style: TextStyle(
                          fontSize: Dimens.sp12,
                          color: Colours.grayColor,
                        ),),
                      ],
                    )),
                    ImageIcon(AssetImage(ImageResource.right),size: Dimens.sp14,color: Colours.grayColor,),
                  ],
                ),
              ),
              onTap: (){
                Get.toNamed(Routes.walletSelect,arguments: WalletSelectType.create);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: Screen.width,
              child: const DividerLine(),
              margin: EdgeInsets.fromLTRB(Dimens.dp60, 0, Dimens.dp15, 0),
            ),
          ),
        ],
      ),

    );
  }
}




