
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
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
              child: _buildItem(ImageResource.assets,Ids.assetOverview.tr,click: (){

                Get.toNamed(Routes.assetsMain);
              }),
            ),
            SliverToBoxAdapter(
              child: _buildItem(ImageResource.wallet,Ids.walletManager.tr,click: (){
              },isVisible: false),
            ),
            SliverToBoxAdapter(
              child: Gaps.hGap10,
            ),
            SliverToBoxAdapter(
              child: _buildItem(ImageResource.address,Ids.addressBook.tr,click: (){
                Get.toNamed(Routes.addressBookList);
              },isVisible: false),
            ),
            SliverToBoxAdapter(
              child: Gaps.hGap10,
            ),
            SliverToBoxAdapter(
              child: _buildItem(ImageResource.about,Ids.aboutMyself.tr,click: (){
                Get.toNamed(Routes.aboutApp);
              }),
            ),
            SliverToBoxAdapter(
              child: _buildItem(ImageResource.setting,Ids.systemSetting.tr,click: (){
                Get.toNamed(Routes.systemSet);
              }),
            ),
          ],
        )

    );
  }

  Widget _buildItem(String icon,String title,{Function? click,bool isVisible=true}){

    return Material(
      child: InkWell(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(

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
      ),
      color: Colors.white,
    );
  }
}




