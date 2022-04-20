

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_create_import_data.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/ui/dialog/input_content_dialog.dart';
import 'package:flutter_phpcoin/ui/dialog/sure_is_dialog.dart';
import 'package:flutter_phpcoin/ui/page/wallet/wallet_select_page.dart';
import 'package:flutter_phpcoin/utils/toast_util.dart';


import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';


import '../../../controller/page/transfer/transfer_receive_erwei_controller.dart';
import '../../../controller/page/transfer/transfer_record_list_controller.dart';
import '../../../controller/page/transfer/transfer_token_controller.dart';
import '../../../controller/page/wallet/wallet_create_controller.dart';
import '../../../controller/page/wallet/wallet_create_import_controller.dart';
import '../../../controller/page/wallet/wallet_detail_controller.dart';
import '../../../controller/page/wallet/wallet_select_controller.dart';
import '../../../controller/page/wallet/wallet_watch_import_controller.dart';
import '../../../data/transfer/transfer_token_data.dart';
import '../../../db/entity/wallet_entity.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../widget/bar/app_bar.dart';
import '../../../widget/custom/back_button.dart';
import '../../../widget/custom/custom_button.dart';
import '../../../widget/custom/divider_line.dart';
import '../../dialog/wallet/wallet_pay_sure_dialog.dart';
import '../address/address_book_list_page.dart';

///转账交易-转账代币
// ignore: must_be_immutable
class TransferTokenPage extends StatelessWidget {
 late TransferTokenController controller;
 final TransferTokenData data;
 TransferTokenPage({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller=Get.put(TransferTokenController(data));
    return  Scaffold(
        backgroundColor: Colours.bgColor,
        appBar: BaseAppBar(
          title: Ids.transfer.tr,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Gaps.hGap10,
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(Ids.collectionAddress.tr,style: TextStyle(
                          fontSize: Dimens.sp14,
                          color: Colours.defaultTextColor,
                        ),),
                        Expanded(child: Container()),
                        GestureDetector(
                           behavior: HitTestBehavior.opaque,
                          onTap: ()async{
                         dynamic result=await Get.toNamed(Routes.addressBookList,arguments: AddressBookListType.select);
                              if(result!=null){
                                controller.editAddress.text=result.walletAddress??"";
                              }
                           },
                          child:Container(
                            padding: EdgeInsets.fromLTRB(Dimens.dp15, 0, 0, 0),
                            child: ImageIcon(AssetImage(ImageResource.address,),color: Colours.defaultTextColor,
                            size: Dimens.sp18,),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimens.dp45,
                      width: Screen.width,
                      child:TextField(
                        textInputAction:TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.editAddress,
                        style: TextStyle(
                            textBaseline:TextBaseline.alphabetic,
                            color: Colours.defaultTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: Dimens.sp16),
                        maxLines: 1,
                        focusNode: controller.editAddressNode,
                        decoration: InputDecoration(
                          hintText:Ids.inputCopyWalletAddress.tr,
                          hintStyle: TextStyle(
                            fontSize: Dimens.sp16,
                            color: Colours.hintTextColor,
                            fontWeight: FontWeight.normal,
                          ),
                          contentPadding: const EdgeInsets.all(0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

              ),
            ),
            SliverToBoxAdapter(
              child: Gaps.hGap10,
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(Ids.transferAmount.tr,style: TextStyle(
                          fontSize: Dimens.sp14,
                          color: Colours.defaultTextColor,
                        ),),
                        Expanded(child: Container()),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: (){

                          },
                          child:Container(
                            padding: EdgeInsets.fromLTRB(Dimens.dp15, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(controller.tokenName.value,style: TextStyle(
                                  fontSize: Dimens.sp14,
                                  color: Colours.defaultTextColor,
                                ),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimens.dp45,
                      width: Screen.width,
                      child:Row(
                        children: [
                          Expanded(child: TextField(
                            textInputAction:TextInputAction.done,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            controller: controller.editNum,
                            style: TextStyle(
                                textBaseline:TextBaseline.alphabetic,
                                color: Colours.defaultTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: Dimens.sp16),
                            maxLines: 1,
                            focusNode: controller.editNumNode,
                            decoration: InputDecoration(
                              hintText:Ids.pleaseInputNum.tr,
                              hintStyle: TextStyle(
                                fontSize: Dimens.sp16,
                                color: Colours.hintTextColor,
                                fontWeight: FontWeight.normal,
                              ),
                              contentPadding: const EdgeInsets.all(0),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none
                              ),
                            ),
                          )),
                          GestureDetector(
                            onTap: (){
                              controller.editNum.text=controller.balance.value;
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: Dimens.dp20,
                                  alignment: Alignment.center,
                                  child: Text(Ids.all1.tr,style: TextStyle(
                                    fontSize: Dimens.sp10,
                                    color: Colours.hintTextColor,
                                  ),),
                                  padding: EdgeInsets.fromLTRB(Dimens.dp8, 0, Dimens.dp8, 0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(Dimens.sp10),
                                      border: Border.all(
                                        color: Colours.hintTextColor,
                                        width: Dimens.dp1,
                                      )
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const DividerLine(),
                    SizedBox(
                      height: Dimens.dp40,
                      width: Screen.width,
                      child:Row(
                        children: [
                          Text(Ids.transferAmount.tr,style: TextStyle(
                            fontSize: Dimens.sp14,
                            color: Colours.defaultTextColor,
                          ),),
                          Expanded(child: Container()),
                          Obx((){
                            return  Text("${controller.balance.value} ${controller.tokenName.value}",style: TextStyle(
                              fontSize: Dimens.sp12,
                              color: Colours.defaultTextColor,
                            ),);
                          })
                        ],
                      ),
                    ),
                  ],
                ),

              ),
            ),
            SliverToBoxAdapter(
              child: Gaps.hGap15,
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                height: Dimens.dp40,
                padding: EdgeInsets.fromLTRB(Dimens.dp15,0, Dimens.dp15, 0),
                child: Row(
                  children: [
                    Text(Ids.minerFee.tr,style: TextStyle(
                      fontSize: Dimens.sp14,
                      color: Colours.defaultTextColor,
                    ),),
                    Expanded(child: Container()),
                  ],
                ),

              ),
            ),
            const SliverToBoxAdapter(
              child: DividerLine(),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(Dimens.dp15,Dimens.dp10, Dimens.dp15, Dimens.dp10),
                child: Wrap(
                  children: [
                     Container(
                        width: Dimens.dp80,

                       decoration: BoxDecoration(
                         color: Colours.accentColor.withOpacity(0.1),
                         borderRadius: BorderRadius.circular(Dimens.sp4),
                         border: Border.all(
                           color: Colours.accentColor,
                           width: Dimens.dp1,
                         )
                       ),
                       child: Stack(
                         children: [
                           Positioned(child: Container(
                             child: ImageIcon(AssetImage(ImageResource.selected),size: Dimens.sp10,color: Colors.white,),
                             padding: EdgeInsets.fromLTRB(Dimens.dp4, 0, Dimens.dp4, 0),
                             decoration: BoxDecoration(
                               color: Colours.accentColor,
                               borderRadius: BorderRadius.only(
                                 bottomLeft: Radius.circular(Dimens.sp4),
                                 topRight:Radius.circular(Dimens.sp4),
                               )
                             ),
                           ),right: 0,top: 0,),
                           Align(
                             alignment: Alignment.topCenter,
                             child: Container(
                               margin: EdgeInsets.fromLTRB(00, Dimens.dp12,0, 0),
                               child: Column(
                                 mainAxisSize: MainAxisSize.min,
                                 children: [
                                   Text(Ids.fast.tr,style: TextStyle(
                                     fontSize: Dimens.sp14,
                                     color: Colours.accentColor,
                                   ),),
                                   Gaps.hGap4,
                                   Container(
                                     padding: EdgeInsets.fromLTRB(Dimens.dp4, 0, Dimens.dp4, 0),
                                     alignment: Alignment.center,
                                     child: Text.rich(TextSpan(
                                       text: "0.00000000",style: TextStyle(
                                       fontSize: Dimens.sp10,
                                       color: Colours.accentColor,
                                     ),
                                       children: [
                                         TextSpan(
                                             text: " ${controller.tokenName.value}",style: TextStyle(
                                           fontSize: Dimens.sp8,
                                           color: Colours.accentColor,

                                         ),
                                         ),
                                       ],
                                     ),textAlign: TextAlign.center,),
                                   ),
                                   Gaps.hGap4,
                                   Container(

                                     padding: EdgeInsets.fromLTRB(Dimens.dp4, 0, Dimens.dp4, 0),
                                     alignment: Alignment.center,
                                     child: Text.rich(TextSpan(
                                       text: "≈ \$ 0",style: TextStyle(
                                       fontSize: Dimens.sp10,
                                       color: Colours.accentColor,
                                     ),
                                     ),textAlign: TextAlign.center,),
                                   ),
                                   Gaps.hGap6,
                                   Container(
                                     padding: EdgeInsets.fromLTRB(0, Dimens.dp4, 0, Dimens.dp4),
                                     alignment: Alignment.center,
                                     decoration: BoxDecoration(
                                       color: Colours.accentColor.withOpacity(0.2),
                                       borderRadius: BorderRadius.only(
                                         bottomLeft:
                                           Radius.circular(Dimens.sp4),
                                         bottomRight:
                                         Radius.circular(Dimens.sp4),
                                       )
                                     ),
                                     child: Text("≈ 1 ${Ids.minute.tr}",style: TextStyle(
                                       fontSize: Dimens.sp10,
                                       color: Colours.accentColor,
                                     ),),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Gaps.hGap40,
            ),

            SliverToBoxAdapter(
              child: Container(
                child: CustomButton(
                  Ids.sure.tr,
                  onPressed: (){

                       controller.surePay(context);
                  },
                ),
                margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
              ),
            ),
          ],
        )
    );
  }

}

