









import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/res/colors.dart';
import 'package:flutter_phpcoin/res/resource.dart';
import 'package:flutter_phpcoin/res/style.dart';
import 'package:get/get.dart';

import '../../../controller/page/assets/assets_b_item_controller.dart';
import '../../../db/entity/wallet_entity.dart';


class AssetsBItem extends StatefulWidget {
  final Wallet item;
  final int position;

  AssetsBItem(this.item,this.position,{Key? key}) : super(key: key);

  @override
  State<AssetsBItem> createState() => _AssetsBItemState();
}

class _AssetsBItemState extends State<AssetsBItem> {
  late AssetsBItemController controller;
  @override
  void initState() {
    super.initState();
    controller=AssetsBItemController(widget.item);
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimens.sp6),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15,0),
            child: Text("${controller.wallet.walletName}",style: TextStyles.largeText,),
            alignment: Alignment.centerLeft,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
              height: Dimens.dp60,
              child: Stack(
                children: [

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: Dimens.dp30,height: Dimens.dp30,
                          child: Image.asset(ImageResource.phpCoin,width: Dimens.dp30,height: Dimens.dp30,),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colours.lightGrayColor,
                                width: Dimens.dp1,
                              )
                          ),
                        ),
                        Gaps.wGap15,
                        Text("${controller.wallet.tokenName}",style: TextStyles.largeText,),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child:Obx((){
                      return Container(
                        alignment: Alignment.centerRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(controller.balance.value,style: TextStyle(
                              fontSize: Dimens.sp18,
                              color:Colours.defaultTextColor,
                            ),),
                            Gaps.hGap2,
                            Text("≈ \$0",style: TextStyle(
                              fontSize: Dimens.sp12,
                              color:Colours.grayColor,
                            ),),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}

