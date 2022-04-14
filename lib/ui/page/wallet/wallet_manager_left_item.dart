import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/sp.dart';
import '../../../controller/page/wallet/wallet_manager_controller.dart';
import '../../../data/model/language/language_switch_model.dart';
import '../../../res/colors.dart';
import '../../../res/constant.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../widget/custom/divider_line.dart';




class WalletManagerLeftItem extends StatelessWidget {
  final  WalletTypeBean item;
  final int leftSelect;
  final int position;
  const WalletManagerLeftItem(this.item,this.position,{Key? key,this.leftSelect=0}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool select=position==leftSelect;



    return Container(
      color: select?Colors.white:Colours.hintBgColor,
      height: Dimens.dp60,
      width: Screen.width,
      alignment: Alignment.center,
      child: Image.asset(select?item.selectImg:item.noSelectImg,width: Dimens.dp35,height: Dimens.dp35,),
    );
  }
}


