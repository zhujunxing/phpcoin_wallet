
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/res/colors.dart';
import 'package:flutter_phpcoin/res/resource.dart';
import 'package:flutter_phpcoin/res/style.dart';
import 'package:flutter_phpcoin/utils/screen.dart';

import 'package:flutter_phpcoin/widget/bar/app_bar.dart';
import 'package:flutter_phpcoin/widget/custom/divider_line.dart';




//
// ignore: must_be_immutable
class HomeAssetsNoWallet extends StatelessWidget {

  const HomeAssetsNoWallet({Key? key}) : super(key: key);

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
                        Text("Pure PHP blockchain built for Web",style: TextStyle(
                          fontSize: Dimens.sp20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),),
                        Gaps.hGap4,
                        Text("Mine.Develop.Trade",style: TextStyle(
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
                  Text("数字资产钱包",style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colours.defaultTextColor,
                    fontSize: Dimens.sp18,
                  ),),
                  Gaps.hGap4,
                  Text("目前支持PHPCOIN公链",style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colours.grayColor,
                    fontSize: Dimens.sp12,
                  ),),
                ],
              ),
            ),
          ),


          SliverToBoxAdapter(
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
                      Text("我有钱包",style: TextStyle(
                        fontSize: Dimens.sp16,
                        color: Colours.defaultTextColor,
                      ),),
                      Gaps.hGap4,
                      Text("导入钱包",style: TextStyle(
                        fontSize: Dimens.sp12,
                        color: Colours.grayColor,
                      ),),
                    ],
                  )),
                  ImageIcon(AssetImage(ImageResource.right),size: Dimens.sp14,color: Colours.grayColor,),
                ],
              ),
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
                      Text("我没有钱包",style: TextStyle(
                        fontSize: Dimens.sp16,
                        color: Colours.defaultTextColor,
                      ),),
                      Gaps.hGap4,
                      Text("创建钱包",style: TextStyle(
                        fontSize: Dimens.sp12,
                        color: Colours.grayColor,
                      ),),
                    ],
                  )),
                  ImageIcon(AssetImage(ImageResource.right),size: Dimens.sp14,color: Colours.grayColor,),
                ],
              ),
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




