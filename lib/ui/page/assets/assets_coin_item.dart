









import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/res/colors.dart';
import 'package:flutter_phpcoin/res/resource.dart';
import 'package:flutter_phpcoin/res/style.dart';
import 'package:flutter_phpcoin/widget/custom/divider_line.dart';

import '../../../data/wallet/assets_b_data.dart';

class AssetsCoinItem extends StatelessWidget {
  final AssetsCoinData item;
 final int position;
  const AssetsCoinItem(this.item,this.position,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
                        width: Dimens.dp40,height: Dimens.dp40,
                        child: Image.asset(item.icon,width: Dimens.dp38,height: Dimens.dp38,),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colours.lightGrayColor,
                              width: Dimens.dp1,
                            )
                        ),
                      ),
                      Gaps.wGap10,
                      Text(item.tokenName,style: TextStyles.largeText,),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child:Container(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(item.balance,style: TextStyle(
                          fontSize: Dimens.sp18,
                          color:Colours.defaultTextColor,
                        ),),
                        Gaps.hGap2,
                        Text("≈ \$${item.money}",style: TextStyle(
                          fontSize: Dimens.sp12,
                          color:Colours.grayColor,
                        ),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ),
        const DividerLine(),
      ],
    );
  }
}