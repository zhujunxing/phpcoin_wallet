
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../controller/page/home/home_assets_controller.dart';
import '../../../controller/page/home/home_myself_controller.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../widget/bar/app_bar.dart';
import '../../../widget/custom/divider_line.dart';


//资产
// ignore: must_be_immutable
class HomeMyselfPage extends StatelessWidget {
  late HomeMyselfController controller;
  HomeMyselfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    controller=Get.put(HomeMyselfController());

    return Scaffold(
        backgroundColor: Colours.bgColor,
        appBar:BaseAppBar(
          leading:Container(),
          title:Ids.myself.tr,
          bgColor: Colors.white,
        ),
        body:CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Gaps.hGap10,
            ),
            SliverToBoxAdapter(
              child: _buildItem(ImageResource.assets,"资产总览",click: (){

              }),
            ),
            SliverToBoxAdapter(
              child: _buildItem(ImageResource.wallet,"钱包管理",click: (){
              },isVisible: false),
            ),
            SliverToBoxAdapter(
              child: Gaps.hGap10,
            ),
            SliverToBoxAdapter(
              child: _buildItem(ImageResource.address,"地址薄",click: (){

              },isVisible: false),
            ),
            SliverToBoxAdapter(
              child: Gaps.hGap10,
            ),
            SliverToBoxAdapter(
              child: _buildItem(ImageResource.about,"关于我们",click: (){

              }),
            ),
            SliverToBoxAdapter(
              child: _buildItem(ImageResource.setting,"系统设置",click: (){

              }),
            ),
          ],
        )

    );
  }

  Widget _buildItem(String icon,String title,{Function? click,bool isVisible=true}){

    return GestureDetector(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, Dimens.dp15),
            child: Row(
              children: [
                Image.asset(icon,width: Dimens.dp20,),
                Gaps.wGap15,
                Expanded(child:Text(title,style: TextStyle(
                  fontSize: Dimens.sp16,
                  color: Colours.defaultTextColor,
                ),),),
                ImageIcon(AssetImage(ImageResource.right),size: Dimens.sp14,color: Colours.grayColor,),
              ],
            ),
          ),
          isVisible?Container(
            width: Screen.width,
            child:  const DividerLine(),
            margin: EdgeInsets.fromLTRB(Dimens.dp60, 0, Dimens.dp15, 0),
          ):const SizedBox()
        ],
      ),
      onTap: (){
        if(click!=null){
          click.call();
        }
      },
    );
  }
}




