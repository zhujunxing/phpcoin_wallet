

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';

import 'package:get/get.dart';

import '../../../controller/page/set/sytem_set_controller.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../widget/bar/app_bar.dart';
import '../../../widget/custom/divider_line.dart';


// ignore: must_be_immutable
class SystemSetPage extends StatefulWidget {

  SystemSetPage({Key? key}) : super(key: key);

  @override
  State<SystemSetPage> createState() => _SystemSetPageState();
}

class _SystemSetPageState extends State<SystemSetPage> {
  late SystemSetController controller;
  @override
  void initState() {
    super.initState();
    controller=Get.put(SystemSetController());
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colours.bgColor,
        appBar:BaseAppBar(
          bgColor: Colours.bgColor,
          title: Ids.systemSetting.tr,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _buildItem("",Ids.languageSwitch.tr,click: (){
                Get.toNamed(Routes.languageSwitch);
              },isVisible: false),
            ),
          ]),
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
                  icon!=''?Image.asset(icon,width: Dimens.dp20,):const SizedBox(),
                  Gaps.wGap15,
                  Expanded(child:Text(title,style: TextStyle(
                    fontSize: Dimens.sp16,
                    color: Colours.defaultTextColor,
                  ),),),
                  ImageIcon(AssetImage(ImageResource.right),size: Dimens.sp14,color: Colours.grayColor,),
                ],
              ),
            ),
            isVisible?SizedBox(
              width: Screen.width,
              child:  const DividerLine(),
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

