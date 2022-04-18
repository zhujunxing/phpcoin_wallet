import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/res/style.dart';
import 'package:flutter_phpcoin/widget/custom/custom_button.dart';
import 'package:flutter_phpcoin/widget/custom/divider_line.dart';

import 'package:get/get.dart';

import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../utils/screen.dart';



///钱包支付-确认弹窗
class WalletPaySureDialog extends StatelessWidget {
 final Function? selectCallback;
  String title;
 final String balance;
 final String payAddress;
 final String payWalletName;
 final String receiveAddress;
 final String feeBalance;
 final String feeAmount;
 final String tokenName;
  WalletPaySureDialog({Key? key, this.title="",this.balance='0',this.selectCallback,
 this.payAddress='',this.payWalletName='',this.receiveAddress='',
 this.feeBalance='',this.feeAmount='',this.tokenName=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:Column(

        children: [
          Expanded(child: GestureDetector(
            behavior:HitTestBehavior.opaque,
            child:Container(
            ),
            onTap: (){
              Get.back();
            },
          )),
          Container(
            color: Colors.white,
            child: Column(
             mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    width: Screen.width,
                    height: Dimens.dp50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimens.sp8),
                          topLeft: Radius.circular(Dimens.sp8),
                        )
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(title,style: TextStyle(
                            fontSize: Dimens.sp16,
                            color: Colours.defaultTextColor,
                            fontWeight: FontWeight.w500,
                          ),),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: (){
                              Get.back();
                            },
                            child: Container(
                              padding: EdgeInsets.all(Dimens.dp15),
                              child: ImageIcon(AssetImage(ImageResource.exit),size: Dimens.sp14,color: Colours.defaultTextColor,),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                const DividerLine(),
                Container(
                  width: Screen.width,
                  height: Dimens.dp60,
                  child: Text(balance,style: TextStyle(
                    fontSize: Dimens.sp24,
                    color: Colours.defaultTextColor,
                    fontWeight: FontWeight.w500,
                  ),),
                  alignment: Alignment.center,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, Dimens.dp15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Dimens.dp100,
                        child: Text(Ids.payAddress.tr,style: TextStyle(
                          fontSize: Dimens.sp16,
                          color: Colours.grayColor,
                        ),),
                        padding: EdgeInsets.fromLTRB(Dimens.dp15, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                      ),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(payAddress,style: TextStyle(
                          fontSize: Dimens.sp16,
                          color: Colours.defaultTextColor,
                        ),),
                        Gaps.hGap4,
                        Text(payWalletName,style: TextStyle(
                          fontSize: Dimens.sp14,
                          color: Colours.grayColor,
                        ),),
                      ],

                      ))
                    ],
                  ),
                ),
                const DividerLine(),
                Container(
                  padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, Dimens.dp15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Dimens.dp100,
                        child: Text(Ids.collectionAddress.tr,style: TextStyle(
                          fontSize: Dimens.sp16,
                          color: Colours.grayColor,
                        ),),
                        padding: EdgeInsets.fromLTRB(Dimens.dp15, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                      ),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(receiveAddress,style: TextStyle(
                            fontSize: Dimens.sp16,
                            color: Colours.defaultTextColor,
                          ),),
                        ],

                      ))
                    ],
                  ),
                ),
                const DividerLine(),
                Container(
                  padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, Dimens.dp15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Dimens.dp100,
                        child: Text(Ids.minerFee.tr,style: TextStyle(
                          fontSize: Dimens.sp16,
                          color: Colours.grayColor,
                        ),),
                        padding: EdgeInsets.fromLTRB(Dimens.dp15, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                      ),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("$feeBalance $tokenName",style: TextStyle(
                            fontSize: Dimens.sp16,
                            color: Colours.defaultTextColor,
                          ),),
                          Gaps.hGap4,
                          Text('≈ $feeAmount \$',style: TextStyle(
                            fontSize: Dimens.sp14,
                            color: Colours.grayColor,
                          ),),
                        ],

                      ))
                    ],
                  ),
                ),
                const DividerLine(),
                Gaps.hGap30,
                Container(
                  margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
                  child: CustomButton(Ids.confirmPay.tr,
                    onPressed: (){
                      Get.back();
                      if(selectCallback!=null){
                        selectCallback!.call(true);
                      }
                  },
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: Screen.width,
                  height: Screen.bottomBarHeight,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}



