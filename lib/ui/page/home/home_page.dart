import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../controller/page/home/home_controller.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/toast_util.dart';
import 'home_assets_page.dart';
import 'home_myself_page.dart';
import 'home_node_page.dart';
// ignore: must_be_immutable
class HomePage extends StatelessWidget {
   late HomeController controller;
   HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller=Get.put(HomeController());

    controller.tabData=[
      TabData(Ids.assets.tr,ImageResource.homeAssets,ImageResource.homeAssets, HomeAssetsPage(),0),
      TabData(Ids.node.tr,ImageResource.homeNode,ImageResource.homeNode,  HomeNodePage(),0),
      TabData(Ids.myself.tr,ImageResource.homeMyself,ImageResource.homeMyself, HomeMyselfPage(),0),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body:WillPopScope(
          child:Obx((){

            return IndexedStack(
              children:controller.tabData.asMap().keys.map((e){
                return controller.tabData[e].widget;
              }).toList(),
              index: controller.tabIndex.value,
            );
          }
          ),
        onWillPop: ()async{
          if (controller.lastPopTime == null ||
              DateTime.now().difference(controller.lastPopTime!) > const Duration(seconds: 3)) {
            controller.lastPopTime = DateTime.now();
            //实现toast
            ToastUtil.toast(context,Ids.exitAppTip.tr,gravity: ToastGravity.BOTTOM);

          } else {
            controller.lastPopTime = DateTime.now();
            // 退出app
            await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          }
          return false;
        },
      ),
      bottomNavigationBar:Obx((){
        return AnimatedBottomNavigationBar.builder(itemCount:controller.tabData.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ?Colours.accentColor:Colours.grayColor;
            TabData  tabData=controller.tabData[index];
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(AssetImage(tabData.noSelect),size: Dimens.sp20,
                  color: color,
                ),
                Gaps.hGap5,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    tabData.title,
                    maxLines: 1,
                    style: TextStyle(color: color,
                      fontSize: Dimens.sp11,
                      fontWeight: isActive?FontWeight.w500:FontWeight.normal
                    ),
                  ),
                )
              ],
            );
          },
          activeIndex: controller.tabIndex.value,
          gapWidth: 0,
          splashRadius: 0,
          backgroundColor: Colors.white,
          splashSpeedInMilliseconds: 0,
          onTap: (index){
            controller.setTabIndex(index);
          },height: Dimens.dp60,);
      }),
    );
  }
}
class TabData{
  String title;
  String noSelect;
  String select;
  Widget widget;
  int noReadCount=0;
  TabData(this.title,this.noSelect,this.select,this.widget,this.noReadCount);
}
