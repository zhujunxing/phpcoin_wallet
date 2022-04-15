import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/widget/custom/join_right.dart';
import 'package:get/get.dart';

import '../../../config/sp.dart';
import '../../../controller/page/wallet/wallet_manager_controller.dart';
import '../../../controller/page/wallet/wallet_manager_right_item_controller.dart';
import '../../../data/model/language/language_switch_model.dart';
import '../../../db/entity/wallet_entity.dart';
import '../../../res/colors.dart';
import '../../../res/constant.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../utils/toast_util.dart';
import '../../../widget/custom/divider_line.dart';



class WalletManagerRightItem extends StatefulWidget {
  final  Wallet wallet;

  final int position;

  WalletManagerRightItem(this.wallet,this.position,{Key? key}) : super(key: key);

  @override
  State<WalletManagerRightItem> createState() => _WalletManagerRightItemState();
}

class _WalletManagerRightItemState extends State<WalletManagerRightItem> {

  late WalletManagerRightItemController controller;

   @override
  void initState() {
    super.initState();
    controller=WalletManagerRightItemController(widget.wallet);
    controller.queryBalance();
  }
@override
  void dispose() {
    super.dispose();
     controller.cancelToken.cancel();
   }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Screen.width,
      padding: EdgeInsets.all(Dimens.dp15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.sp4),
        color: Colours.accentColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(child: Row(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: Dimens.dp120,
                      minWidth: 0,
                    ),
                    child: Text(controller.walletName.value,style: TextStyle(
                      fontSize: Dimens.sp14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  ),
                  Gaps.wGap10,
                  controller.wallet.walletSelect==1?Container(
                    margin: EdgeInsets.fromLTRB(0, 0, Dimens.dp10, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimens.sp4),
                    ),
                    alignment: Alignment.center,
                    child: Text("当前",style: TextStyle(
                      fontSize: Dimens.sp10,
                      color: Colours.defaultTextColor,
                    ),),
                    padding: EdgeInsets.fromLTRB(Dimens.dp4, Dimens.dp1, Dimens.dp4, Dimens.dp1),
                  ):const SizedBox(),
                ],
              )),
              JoinRight(color: Colors.white.withOpacity(0.3),size: Dimens.sp12,),
            ],
          ),
          Gaps.hGap6,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(controller.walletAddress.value,style: TextStyle(
                fontSize: Dimens.sp10,
                color: Colors.white.withOpacity(0.5),

              ),maxLines: 1,),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Container(
                  child: ImageIcon(AssetImage(ImageResource.copy),color: Colors.white.withOpacity(0.5),size: Dimens.sp12,),
                  padding: EdgeInsets.only(left: Dimens.dp5,right: Dimens.dp10),
                ),
                onTap: (){
                  Clipboard.setData(ClipboardData(text:controller.walletAddress.value));
                  ToastUtil.toast(context, "钱包地址已复制到粘贴板");
                },
              ),
            ],
          ),
          Gaps.hGap6,
          Container(
            child: Obx((){
              return Text("${controller.balance.value} ${controller.wallet.tokenName}",style: TextStyle(
                fontSize: Dimens.sp14,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),maxLines: 1,overflow: TextOverflow.ellipsis,);
            }),
            alignment: Alignment.centerRight,
          ),
        ],
      ),

    );
  }
}




