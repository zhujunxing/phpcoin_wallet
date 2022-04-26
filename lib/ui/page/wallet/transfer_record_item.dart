import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/data/constants/wallet_type.dart';
import 'package:flutter_phpcoin/widget/custom/join_right.dart';
import 'package:get/get.dart';

import '../../../config/sp.dart';
import '../../../controller/page/wallet/wallet_manager_controller.dart';
import '../../../controller/page/wallet/wallet_manager_right_item_controller.dart';
import '../../../data/model/language/language_switch_model.dart';
import '../../../db/entity/wallet_entity.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/constant.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../service/resp/node/query_transfer_record_resp.dart';
import '../../../utils/date_util.dart';
import '../../../utils/screen.dart';
import '../../../utils/toast_util.dart';
import '../../../widget/custom/divider_line.dart';

class TransferRecordItem extends StatelessWidget {

  TransferRecordDataBean item;
  int position;
   TransferRecordItem(this.item,this.position,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     String start="";

     String address=item.dst!.substring(0,5)+"···"+item.dst!.substring(item.dst!.length-4,item.dst!.length);


    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: Screen.width,
          height: Dimens.dp60,
          padding: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
          child: Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: item.sign=='+'?Colours.color349AFF:Colours.color00d8a7,
                    shape: BoxShape.circle,
                  ),
                  width: Dimens.dp25,
                  height: Dimens.dp25,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      ImageIcon(AssetImage(item.sign=='+'?ImageResource.transferIn:ImageResource.transferOut),color: Colors.white,size: Dimens.sp14,),
                    ],
                  )
              ),
              Gaps.wGap15,
              Expanded(child:Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("$address",style: TextStyle(
                          fontSize: Dimens.sp12,
                          color: Colours.defaultTextColor,
                        ),),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            child: ImageIcon(AssetImage(ImageResource.copy),color: Colours.defaultTextColor,size: Dimens.sp14,),
                            padding: EdgeInsets.only(left: Dimens.dp5,right: Dimens.dp10),
                          ),
                          onTap: (){
                            Clipboard.setData(ClipboardData(text:'${item.dst}'));
                            ToastUtil.toast(context, Ids.walletAddressAlreadyCopy.tr);
                          },
                        )
                      ],
                    ),
                    Gaps.hGap4,
                    Text(formatDate(
                        DateTime.fromMillisecondsSinceEpoch(item.date??0*1000),[yyyy, "-", mm, "-", dd, " ", HH, ":", nn, ":", ss]),style: TextStyle(
                      fontSize: Dimens.sp12,
                      color: Colours.grayColor,
                    ),)
                  ],
                ),
                alignment: Alignment.centerLeft,
              )),
              Text("${item.sign}${double.parse(item.val??"0")} ${BType.phpCoin}",style: TextStyle(
                fontSize: Dimens.sp16,
                color: Colours.color349AFF,
                fontWeight: FontWeight.w500,
              ),),
            ],
          ),

        ),
        const DividerLine(),
      ],
    );
  }
}

