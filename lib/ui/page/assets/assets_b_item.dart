









import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/res/colors.dart';
import 'package:flutter_phpcoin/res/resource.dart';
import 'package:flutter_phpcoin/res/style.dart';

class AssetsBItem extends StatelessWidget {
  final dynamic item;
 final int position;
  const AssetsBItem(this.item,this.position,{Key? key}) : super(key: key);

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
            child: Text("ETH-2",style: TextStyles.largeText,),
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
                        child: Image.asset(ImageResource.ethereum,width: Dimens.dp20,height: Dimens.dp20,),
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
                      Text("ETH",style: TextStyles.largeText,),
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
                        Text("0",style: TextStyle(
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
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}