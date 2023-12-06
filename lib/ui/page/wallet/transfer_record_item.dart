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

class TransferRecordItem extends StatefulWidget {

  TransferRecordDataBean item;
  int position;
   TransferRecordItem(this.item,this.position,{Key? key}) : super(key: key);

  @override
  State<TransferRecordItem> createState() => _TransferRecordItemState();
}

class _TransferRecordItemState extends State<TransferRecordItem> {
  @override
  Widget build(BuildContext context) {

     String start="";

     String address=widget.item.dst!.substring(0,5)+"···"+widget.item.dst!.substring(widget.item.dst!.length-4,widget.item.dst!.length);


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
                    color: widget.item.sign=='+'?Colours.color349AFF:Colours.color00d8a7,
                    shape: BoxShape.circle,
                  ),
                  width: Dimens.dp25,
                  height: Dimens.dp25,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      ImageIcon(AssetImage(widget.item.sign=='+'?ImageResource.transferIn:ImageResource.transferOut),color: Colors.white,size: Dimens.sp14,),
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
                        Text(address,style: TextStyle(
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
                            Clipboard.setData(ClipboardData(text:'${widget.item.dst}'));
                            ToastUtil.toast(context, Ids.walletAddressAlreadyCopy.tr);
                          },
                        )
                      ],
                    ),
                    Gaps.hGap4,
                    Text(formatDate(
                        DateTime.fromMillisecondsSinceEpoch((widget.item.date??0)*1000),[yyyy, "-", mm, "-", dd, " ", HH, ":", nn, ":", ss]),style: TextStyle(
                      fontSize: Dimens.sp12,
                      color: Colours.grayColor,
                    ),)
                  ],
                ),
                alignment: Alignment.centerLeft,
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${widget.item.sign}${double.parse(widget.item.val??"0")} ${BType.phpCoin}",style: TextStyle(
                    fontSize: widget.item.confirmations!<0?Dimens.sp14:Dimens.sp16,
                    color: widget.item.sign=='+'?Colours.color349AFF:Colours.color00d8a7,
                    fontWeight: FontWeight.w500,
                  ),),
                  widget.item.confirmations!<0?Container(
                    margin: EdgeInsets.fromLTRB(0, Dimens.dp4, 0, 0),
                    child: Text(Ids.submitBlockConfirm.tr,style: TextStyle(
                      fontSize: Dimens.sp12,
                      color: Colours.grayColor,
                    ),),
                  ):const SizedBox(),
                ],
              ),
            ],
          ),

        ),
        const DividerLine(),
      ],
    );
  }
}

