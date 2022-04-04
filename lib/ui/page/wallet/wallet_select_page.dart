

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/data/constants/wallet_type.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_create_import_data.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';


import 'package:get/get.dart';


import '../../../controller/page/wallet/wallet_select_controller.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../widget/bar/app_bar.dart';
import '../../../widget/custom/back_button.dart';
import '../../../widget/custom/divider_line.dart';

class WalletSelectType{
 static const int create=0;
 static const int import=1;
}


// ignore: must_be_immutable
class WalletSelectPage extends StatelessWidget {
  late WalletSelectController controller;
  int selectType;
  WalletSelectPage({Key? key,this.selectType=WalletSelectType.create}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller=Get.put(WalletSelectController(selectType));
    return Scaffold(
        backgroundColor: Colours.bgColor,
        appBar:BaseAppBar(
          title:Ids.selectNetwork.tr,
          leading: BackBt(
            color: Colours.defaultTextColor,
            isClose: true,
            onPressed: (){
              Get.back();
            },
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding:EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
                child: Text(Ids.singleWebWallet.tr,style: TextStyle(
                  fontSize: Dimens.sp14,
                  color: Colours.grayColor,
                ),),
                alignment: Alignment.centerLeft,
                height: Dimens.dp40,
              ),
            ),
            SliverToBoxAdapter(
              child: _buildItem(ImageResource.phpCoin,WalletType.phpCoin,click: (){
                Get.toNamed(Routes.walletCreateImport,
                    arguments: WalletCreateImportData(walletSelectType:controller.selectType,
                    refresh: (){
                      Get.back();
                    },
                    walletType:"PHPCoin"));
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
              padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp10, Dimens.dp15, Dimens.dp10),
              child: Row(
                children: [
                  Image.asset(icon,width: Dimens.dp24,height:Dimens.dp24,),
                  Gaps.wGap15,
                  Expanded(child:Text(title,style: TextStyle(
                    fontSize: Dimens.sp14,
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

