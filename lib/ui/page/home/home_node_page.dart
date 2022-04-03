
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/res/resource.dart';
import 'package:flutter_phpcoin/res/style.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/utils/format_util.dart';
import 'package:flutter_phpcoin/utils/screen.dart';
import 'package:flutter_phpcoin/widget/custom/custom_smart_refresher.dart';
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
    controller.queryNodeInfo(context);

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
              child: Text(Ids.website.tr,style: TextStyle(
                fontSize: Dimens.sp14,
                color: Colours.blueColor,
              ),),
            ),
          ),
        ],
      ),
      body:CustomSmartRefresher(

          refreshController:controller.refreshController,

          onRefresh: (){
            controller.queryNodeInfo(context);
          },
          enablePullUp: false,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: Gaps.hGap10,),
              SliverToBoxAdapter(
                child:Obx((){
                  return Container(

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
                                  Text(Ids.blocks.tr,style:TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: Dimens.sp20,
                                    color: Colours.defaultTextColor.withOpacity(0.85),
                                  ),),
                                ],
                              ),
                              Gaps.hGap10,
                              Text("${controller.height.value}",style:TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Dimens.sp20,
                                color: Colours.defaultTextColor,
                              ),),
                              Gaps.hGap6,
                              Text.rich(TextSpan(
                                  text: "${Ids.lastBlockBefore.tr} ",
                                  style: TextStyle(
                                    fontSize: Dimens.sp12,
                                    color: Colours.grayColor,
                                  ),

                                  children: [
                                    TextSpan(text: "${controller.time.value} ",style:TextStyle(
                                      fontSize: Dimens.sp12,
                                      color: Colours.grayColor,
                                      fontWeight: FontWeight.w500,
                                    )),
                                    TextSpan(text: Ids.seconds.tr,style:TextStyle(
                                      fontSize: Dimens.sp12,
                                      color: Colours.grayColor,
                                    )),
                                  ]
                              ))
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
                  );
                }),
              ),
              SliverToBoxAdapter(child: Gaps.hGap10,),
              SliverToBoxAdapter(
                  child:Obx((){
                    return Container(

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
                                    ImageIcon(AssetImage(ImageResource.time),size: Dimens.sp20,
                                      color: Colours.defaultTextColor.withOpacity(0.85),
                                    ),
                                    Gaps.wGap5,
                                    Text(Ids.averageBlockTime.tr,style:TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: Dimens.sp20,
                                      color: Colours.defaultTextColor.withOpacity(0.85),
                                    ),),
                                  ],
                                ),

                                Gaps.hGap6,
                                SizedBox(
                                  width: Screen.width,
                                  child: Row(
                                    children: [
                                      Expanded(child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(FormatUtil.formatNum(controller.avgBlockTime10.value, 1),style:TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: Dimens.sp16,
                                              color: Colours.defaultTextColor,
                                            ),),
                                            Gaps.hGap5,
                                            Text("${Ids.last} 10 ${Ids.blocks1.tr}",style:TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: Dimens.sp12,
                                              color: Colours.defaultTextColor,
                                            ),),
                                          ],
                                        ),
                                        alignment: Alignment.centerLeft,
                                      )),
                                      Expanded(child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(FormatUtil.formatNum(controller.avgBlockTime100.value, 2),style:TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: Dimens.sp16,
                                              color: Colours.defaultTextColor,
                                            ),),
                                            Gaps.hGap5,
                                            Text("${Ids.last} 100 ${Ids.blocks1.tr}",style:TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: Dimens.sp12,
                                              color: Colours.defaultTextColor,
                                            ),),
                                          ],
                                        ),
                                        alignment: Alignment.centerLeft,
                                      )),
                                    ],
                                  ),
                                ),
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
                    );
                  })
              ),

              SliverToBoxAdapter(child: Gaps.hGap10,),
              SliverToBoxAdapter(
                  child:Obx((){
                    return Container(

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
                                    ImageIcon(AssetImage(ImageResource.coinSupply),size: Dimens.sp20,
                                      color: Colours.defaultTextColor.withOpacity(0.85),
                                    ),
                                    Gaps.wGap5,
                                    Text(Ids.currentSupply.tr,style:TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: Dimens.sp20,
                                      color: Colours.defaultTextColor.withOpacity(0.85),
                                    ),),
                                  ],
                                ),
                                Gaps.hGap6,
                                Text(FormatUtil.formatNum(controller.currentSupply.value, 8),style:TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dimens.sp16,
                                  color: Colours.defaultTextColor,
                                ),),
                                Gaps.hGap6,
                                Text("${Ids.totalSupply.tr} ${FormatUtil.formatNum(controller.totalSupply.value, 8)}",style:TextStyle(
                                  fontSize: Dimens.sp12,
                                  color: Colours.grayColor,
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
                    );
                  })
              ),
              SliverToBoxAdapter(child: Gaps.hGap10,),
              SliverToBoxAdapter(
                  child:Obx((){
                    return Container(
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
                                    Text(Ids.transactions.tr,style:TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: Dimens.sp20,
                                      color: Colours.defaultTextColor.withOpacity(0.85),
                                    ),),
                                  ],
                                ),
                                Gaps.hGap10,
                                Text("${controller.transactions.value}",style:TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dimens.sp16,
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
                    );
                  })
              ),
              SliverToBoxAdapter(child: Gaps.hGap10,),
              SliverToBoxAdapter(
                child:Obx((){
                  return Container(

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
                                  Text(Ids.accounts.tr,style:TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: Dimens.sp20,
                                    color: Colours.defaultTextColor.withOpacity(0.85),
                                  ),),
                                ],
                              ),
                              Gaps.hGap10,
                              Text("${controller.accounts.value}",style:TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Dimens.sp16,
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
                                  Text(Ids.peers.tr,style:TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: Dimens.sp20,
                                    color: Colours.defaultTextColor.withOpacity(0.85),
                                  ),),
                                ],
                              ),
                              Gaps.hGap10,
                              Text("${controller.peers.value}",style:TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Dimens.sp16,
                                color: Colours.defaultTextColor,
                              ),),

                            ],
                          ),
                        ),),


                      ],
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(child: Gaps.hGap10,),
              SliverToBoxAdapter(
                  child:Obx((){
                    return Container(
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
                                    Text(Ids.memPool.tr,style:TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: Dimens.sp20,
                                      color: Colours.accentColor,
                                    ),),
                                  ],
                                ),
                                Gaps.hGap10,
                                Text("${controller.mempool.value}",style:TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dimens.sp16,
                                  color: Colours.defaultTextColor,
                                ),),

                              ],
                            ),
                          ),),
                        ],
                      ),
                    );
                  })
              ),
              SliverToBoxAdapter(child: Gaps.hGap10,),
              SliverToBoxAdapter(
                  child:Obx((){
                    return Container(

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
                                    Text(Ids.masterNodes.tr,style:TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: Dimens.sp20,
                                      color: Colours.accentColor,
                                    ),),
                                  ],
                                ),
                                Gaps.hGap10,
                                Text("${controller.masternodes.value}",style:TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dimens.sp16,
                                  color: Colours.defaultTextColor,
                                ),),

                              ],
                            ),
                          ),),
                        ],
                      ),
                    );
                  })
              ),
              SliverToBoxAdapter(child: Gaps.hGap10,),

            ],
          )),
    );
  }
}




