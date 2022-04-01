
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/res/resource.dart';
import 'package:flutter_phpcoin/res/style.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/utils/screen.dart';
import 'package:get/get.dart';

import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../controller/page/home/home_assets_controller.dart';
import '../../../controller/page/home/home_node_controller.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../widget/bar/app_bar.dart';


//节点
// ignore: must_be_immutable
class HomeNodePage extends StatelessWidget {
  late HomeNodeController controller;
  HomeNodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    controller=Get.put(HomeNodeController());

    return Scaffold(
      backgroundColor: Colours.bgColor,
      appBar:BaseAppBar(
        leading:Container(),
        title: Ids.node.tr,
        bgColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: (){
              Get.toNamed(Routes.web,arguments: "https://explorer.phpcoin.net/");
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(Dimens.dp15,0, Dimens.dp15, 0),
              child: Text("官网",style: TextStyle(
                fontSize: Dimens.sp14,
                color: Colours.blueColor,
              ),),
            ),
          ),
        ],
      ),
      body:CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Gaps.hGap10,),
          SliverToBoxAdapter(
            child:Container(
              height: Dimens.dp100,
              margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
              child: Row(
                children: [
                  Expanded(child: Container(
                    padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15,Dimens.dp15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ImageIcon(AssetImage(ImageResource.blocks),size: Dimens.sp20,
                              color: Colours.defaultTextColor.withOpacity(0.85),
                            ),
                            Gaps.wGap5,
                            Text("Blocks",style:TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Dimens.sp20,
                              color: Colours.defaultTextColor.withOpacity(0.85),
                            ),),
                          ],
                        ),
                        Gaps.hGap10,
                        Text("178039",style:TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Dimens.sp24,
                          color: Colours.defaultTextColor,
                        ),),

                      ],
                    ),
                  ),),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimens.sp8),
                  boxShadow: [
                    BoxShadow(
                        offset:Offset(0,Dimens.dp1),
                        blurRadius: Dimens.dp4,
                        spreadRadius:Dimens.dp1,
                        color: Colors.grey.withOpacity(0.1)),
                  ]
              ),
            ),
          ),
          SliverToBoxAdapter(child: Gaps.hGap10,),
          SliverToBoxAdapter(
            child:Container(
              height: Dimens.dp100,
              margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
              child: Row(
                children: [
                  Expanded(child: Container(
                    padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15,Dimens.dp15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ImageIcon(AssetImage(ImageResource.transfer),size: Dimens.sp20,
                              color: Colours.defaultTextColor.withOpacity(0.85),
                            ),
                            Gaps.wGap5,
                            Text("Transactions",style:TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Dimens.sp20,
                              color: Colours.defaultTextColor.withOpacity(0.85),
                            ),),
                          ],
                        ),
                        Gaps.hGap10,
                        Text("382517",style:TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Dimens.sp24,
                          color: Colours.defaultTextColor,
                        ),),

                      ],
                    ),
                  ),),

                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimens.sp8),
                  boxShadow: [
                    BoxShadow(
                        offset:Offset(0,Dimens.dp1),
                        blurRadius: Dimens.dp4,
                        spreadRadius:Dimens.dp1,
                        color: Colors.grey.withOpacity(0.1)),
                  ]
              ),
            ),
          ),
          SliverToBoxAdapter(child: Gaps.hGap10,),
          SliverToBoxAdapter(
            child:Container(
              height: Dimens.dp100,
              margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
              child: Row(
                children: [
                  Expanded(child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimens.sp8),
                        boxShadow: [
                          BoxShadow(
                              offset:Offset(0,Dimens.dp1),
                              blurRadius: Dimens.dp4,
                              spreadRadius:Dimens.dp1,
                              color: Colors.grey.withOpacity(0.1)),
                        ]
                    ),
                    padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15,Dimens.dp15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ImageIcon(AssetImage(ImageResource.accounts),size: Dimens.sp20,
                              color: Colours.defaultTextColor.withOpacity(0.85),
                            ),
                            Gaps.wGap5,
                            Text("Accounts",style:TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Dimens.sp20,
                              color: Colours.defaultTextColor.withOpacity(0.85),
                            ),),
                          ],
                        ),
                        Gaps.hGap10,
                        Text("5533",style:TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Dimens.sp24,
                          color: Colours.defaultTextColor,
                        ),),

                      ],
                    ),
                  ),),
                  Gaps.wGap10,
                  Expanded(child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimens.sp8),
                        boxShadow: [
                          BoxShadow(
                              offset:Offset(0,Dimens.dp1),
                              blurRadius: Dimens.dp4,
                              spreadRadius:Dimens.dp1,
                              color: Colors.grey.withOpacity(0.1)),
                        ]
                    ),
                    padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15,Dimens.dp15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ImageIcon(AssetImage(ImageResource.peers),size: Dimens.sp20,
                              color: Colours.defaultTextColor.withOpacity(0.85),
                            ),
                            Gaps.wGap5,
                            Text("Peers",style:TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Dimens.sp20,
                              color: Colours.defaultTextColor.withOpacity(0.85),
                            ),),
                          ],
                        ),
                        Gaps.hGap10,
                        Text("0",style:TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Dimens.sp24,
                          color: Colours.defaultTextColor,
                        ),),

                      ],
                    ),
                  ),),


                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: Gaps.hGap10,),
          SliverToBoxAdapter(
            child:Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimens.sp8),
                  boxShadow: [
                    BoxShadow(
                        offset:Offset(0,Dimens.dp1),
                        blurRadius: Dimens.dp4,
                        spreadRadius:Dimens.dp1,
                        color: Colors.grey.withOpacity(0.1)),
                  ]
              ),
              height: Dimens.dp100,
              margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
              child: Row(
                children: [
                  Expanded(child: Container(
                    padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15,Dimens.dp15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ImageIcon(AssetImage(ImageResource.countDown),size: Dimens.sp20,
                              color: Colours.defaultTextColor.withOpacity(0.85),
                            ),
                            Gaps.wGap5,
                            Text("Mempool",style:TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Dimens.sp20,
                              color: Colours.accentColor,
                            ),),
                          ],
                        ),
                        Gaps.hGap10,
                        Text("0",style:TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Dimens.sp24,
                          color: Colours.defaultTextColor,
                        ),),

                      ],
                    ),
                  ),),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: Gaps.hGap10,),
          SliverToBoxAdapter(
            child:Container(
              height: Dimens.dp100,
              margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
              child: Row(
                children: [
                  Expanded(child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimens.sp8),
                        boxShadow: [
                          BoxShadow(
                              offset:Offset(0,Dimens.dp1),
                              blurRadius: Dimens.dp4,
                              spreadRadius:Dimens.dp1,
                              color: Colors.grey.withOpacity(0.1)),
                        ]
                    ),
                    padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15,Dimens.dp15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ImageIcon(AssetImage(ImageResource.masterNodes),size: Dimens.sp20,
                              color: Colours.defaultTextColor.withOpacity(0.85),
                            ),
                            Gaps.wGap5,
                            Text("Masternodes",style:TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Dimens.sp20,
                              color: Colours.accentColor,
                            ),),
                          ],
                        ),
                        Gaps.hGap10,
                        Text("0",style:TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Dimens.sp24,
                          color: Colours.defaultTextColor,
                        ),),

                      ],
                    ),
                  ),),
                ],
              ),
            ),
          ),
        ],
      )

    );
  }
}




