









import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/data/constants/wallet_type.dart';
import 'package:flutter_phpcoin/res/colors.dart';
import 'package:flutter_phpcoin/res/resource.dart';
import 'package:flutter_phpcoin/res/style.dart';
import 'package:flutter_phpcoin/utils/screen.dart';
import 'package:flutter_phpcoin/widget/custom/divider_line.dart';
import 'package:flutter_phpcoin/widget/custom/join_right.dart';

import '../../../db/entity/address_book_entity.dart';

class AddressBookItem extends StatefulWidget {
  final AddressBook item;
 final int position;
  const AddressBookItem(this.item,this.position,{Key? key}) : super(key: key);

  @override
  State<AddressBookItem> createState() => _AddressBookItemState();
}

class _AddressBookItemState extends State<AddressBookItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Color color;
    if(widget.item.walletType==WalletType.phpCoin){
      color=WalletTypeColor.phpCoin;
    }else{
      color=Colours.accentColor;
    }

    return Column(
     mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: Screen.width,
          padding: EdgeInsets.fromLTRB(Dimens.dp15, 9, Dimens.dp15, 9),
          height: Dimens.dp70,
          child: Row(
            children: [
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text.rich(TextSpan(
                    text: "${widget.item.name}",
                      style: TextStyles.normalText,
                    children:[
                      TextSpan(
                        text: widget.item.remarks!=null&&widget.item.remarks!=''?"（${widget.item.remarks}）":"",
                        style: TextStyles.normalLightText,
                      ),
                    ]
                  )),
                  Gaps.hGap6,
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(Dimens.dp10)
                        ),
                        child: Text("${widget.item.walletType}",style:
                          TextStyle(
                            color:color,
                            fontSize:Dimens.sp12,
                          ),),
                        padding: EdgeInsets.fromLTRB(Dimens.dp10, Dimens.dp2, Dimens.dp10, Dimens.dp2),
                      ),
                      Gaps.wGap5,
                      Expanded(child: Text.rich(TextSpan(
                          text: "",
                          style:TextStyle(
                            fontSize: Dimens.sp12,
                            color: Colours.grayColor,
                          ),
                          children:[
                            TextSpan(
                              text: "${widget.item.walletAddress}",
                              style:  TextStyle(
                                fontSize: Dimens.sp12,
                                color: Colours.grayColor,
                              ),
                            ),
                          ]
                      )),),
                    ],
                  ),


                ],
              )),
              JoinRight(size: Dimens.sp12,),
            ],
          ),
        ),
        const DividerLine(),
      ],
    );
  }
}