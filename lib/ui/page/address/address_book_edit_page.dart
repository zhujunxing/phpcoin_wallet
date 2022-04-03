
import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/db/entity/address_book_entity.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/ui/dialog/select_bottom_dialog.dart';
import 'package:flutter_phpcoin/ui/page/address/address_book_item.dart';
import 'package:flutter_phpcoin/ui/page/assets/assets_b_item.dart';
import 'package:flutter_phpcoin/widget/custom/back_button.dart';
import 'package:flutter_phpcoin/widget/custom/join_right.dart';
import 'package:get/get.dart';

import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../controller/page/address/address_book_edit_controller.dart';
import '../../../controller/page/address/address_book_list_controller.dart';
import '../../../controller/page/assets/assets_main_controller.dart';
import '../../../controller/page/home/home_assets_controller.dart';
import '../../../controller/page/home/home_myself_controller.dart';
import '../../../data/address/address_book_data.dart';
import '../../../data/constants/wallet_type.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../widget/bar/app_bar.dart';
import '../../../widget/custom/custom_smart_refresher.dart';
import '../../../widget/custom/divider_line.dart';

class AddressBookType{
  static const int add=0;
  static const int modify=1;
}
//新建联系人
// ignore: must_be_immutable
class AddressBookEditPage extends StatelessWidget {
  late AddressBookEditController controller;
  AddressBookData? data;
  AddressBookEditPage({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    controller=AddressBookEditController(data:data);

    return Scaffold(
      backgroundColor:  Colors.white,
        resizeToAvoidBottomInset: false,
        appBar:BaseAppBar(
          leading: BackBt(onPressed: (){
            Get.back();
          },),
          title: controller.type==AddressBookType.add?Ids.createContact.tr:Ids.editContact.tr,
          bgColor: Colors.white,
          actions: [
            controller.type==AddressBookType.add?const SizedBox():GestureDetector(
              child:GestureDetector(
                child:  Container(
                  padding: EdgeInsets.all(Dimens.dp15),
                  child: Text(Ids.delete.tr,style: TextStyles.normalText,),
                ),
                onTap: (){
                  controller.delete(context);
                },
              ),
            ),
          ],
        ),
       body: Stack(
         children: [
           Align(
             alignment: Alignment.topCenter,
             child:CustomScrollView(
               slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(Ids.name.tr,style: TextStyle(
                            fontSize: Dimens.sp18,
                            color: Colours.defaultTextColor.withOpacity(0.65),
                          ),),
                          SizedBox(
                            height: Dimens.dp45,
                            width: Screen.width,

                            child:TextField(
                              textInputAction:TextInputAction.done,
                              keyboardType: TextInputType.text,
                              controller: controller.editName,
                              style: TextStyle(
                                  textBaseline:TextBaseline.alphabetic,
                                  color: Colours.defaultTextColor,
                                  fontSize: Dimens.sp16),
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText:Ids.pleaseInputName.tr,
                                hintStyle: TextStyle(
                                    fontSize: Dimens.sp16,
                                    color: Colours.hintTextColor,
                                ),
                                contentPadding: const EdgeInsets.all(0),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none
                                ),
                              ),
                            ),
                          ),
                          const DividerLine(),
                        ],
                      ),
                    ),
                  ),
                 SliverToBoxAdapter(
                   child: Container(
                     margin: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, 0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Text(Ids.remarks1.tr,style: TextStyle(
                           fontSize: Dimens.sp18,
                           color: Colours.defaultTextColor.withOpacity(0.65),
                         ),),
                         SizedBox(
                           height: Dimens.dp45,
                           width: Screen.width,
                           child:TextField(
                             textInputAction:TextInputAction.done,
                             keyboardType: TextInputType.text,
                             controller: controller.editRemarks,
                             style: TextStyle(
                                 textBaseline:TextBaseline.alphabetic,
                                 color: Colours.defaultTextColor,
                                 fontSize: Dimens.sp16),
                             maxLines: 1,
                             decoration: InputDecoration(
                               hintText:Ids.pleaseInputRemarks.tr,
                               hintStyle: TextStyle(
                                 fontSize: Dimens.sp16,
                                 color: Colours.hintTextColor,
                               ),
                               contentPadding: const EdgeInsets.all(0),
                               border: const OutlineInputBorder(
                                   borderSide: BorderSide.none
                               ),
                             ),
                           ),
                         ),
                         const DividerLine(),
                       ],
                     ),
                   ),
                 ),
                 SliverToBoxAdapter(
                   child: Obx((){
                     return Container(
                       margin: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, 0),
                       child: GestureDetector(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             Text(Ids.walletWeb.tr,style: TextStyle(
                               fontSize: Dimens.sp18,
                               color: Colours.defaultTextColor.withOpacity(0.65),
                             ),),
                             Container(
                               alignment: Alignment.centerLeft,
                               height: Dimens.dp45,
                               width: Screen.width,
                               child:Row(
                                 children: [
                                   Expanded(child: Text(controller.walletType.value.isNotEmpty?controller.walletType.value:Ids.selectWalletNetwork.tr,style: TextStyle(
                                     fontSize: Dimens.sp14,
                                     color:controller.walletType.value.isNotEmpty?Colours.defaultTextColor:Colours.hintTextColor,
                                   ),)),
                                   JoinRight(size: Dimens.sp12,),
                                 ],
                               ),
                             ),
                             const DividerLine(),
                           ],
                         ),
                         onTap:(){
                           List<String> data=[WalletType.phpCoin];
                           Get.bottomSheet(SelectBottomDialog(data,selectCallback: (select){
                             controller.walletType.value=data.elementAt(select);
                           },),);
                         },
                       ),
                     );
                   })
                 ),
                 SliverToBoxAdapter(
                   child: Container(
                     margin: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp15, Dimens.dp15, 0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Text(Ids.walletAddress.tr,style: TextStyle(
                           fontSize: Dimens.sp18,
                           color: Colours.defaultTextColor.withOpacity(0.65),
                         ),),
                         SizedBox(
                           height: Dimens.dp45,
                           width: Screen.width,
                           child:Row(
                             children: [
                               Expanded(child: TextField(
                                 textInputAction:TextInputAction.done,
                                 keyboardType: TextInputType.text,
                                 controller: controller.editAddress,
                                 style: TextStyle(
                                     textBaseline:TextBaseline.alphabetic,
                                     color: Colours.defaultTextColor,
                                     fontSize: Dimens.sp16),
                                 maxLines: 1,
                                 decoration: InputDecoration(
                                   hintText:Ids.scanOrCopyWalletAddress.tr,
                                   hintStyle: TextStyle(
                                     fontSize: Dimens.sp16,
                                     color: Colours.hintTextColor,
                                   ),
                                   contentPadding: const EdgeInsets.all(0),
                                   border: const OutlineInputBorder(
                                       borderSide: BorderSide.none
                                   ),
                                 ),
                               ),),
                               GestureDetector(
                                 child: GestureDetector(
                                   child: Container(
                                     padding: EdgeInsets.fromLTRB(Dimens.dp10, 0, 0, 0),
                                     child: ImageIcon(AssetImage(ImageResource.scan),size: Dimens.sp20,),
                                   ),
                                   onTap: ()async{
                                    dynamic result=await Get.toNamed(Routes.scan);
                                    if(result!=null&&result.isNotEmpty){
                                      controller.editAddress.text=result;
                                    }

                                   },
                                 ),
                               ),
                             ],
                           )
                         ),
                         const DividerLine(),
                       ],
                     ),
                   ),
                 ),
               ],
             ),
           ),

           Align(
             alignment: Alignment.bottomCenter,
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 GestureDetector(
                   child:Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Container(
                         padding: EdgeInsets.fromLTRB(Dimens.dp20, 0, Dimens.dp20, 0),
                         height: Dimens.dp40,
                         child: Text(Ids.save.tr,style: TextStyle(
                           fontSize: Dimens.sp14,
                           color: Colors.white,
                         ),),
                         decoration: BoxDecoration(
                           color: Colours.accentColor,
                           borderRadius: BorderRadius.circular(Dimens.sp20),
                         ),
                         alignment: Alignment.center,
                       ),
                     ],
                   ),
                   onTap: (){
                     controller.submit(context);
                   },
                 ),
                 Container(
                   height: Screen.bottomBarHeight+Dimens.dp20,
                 ),
               ],
             ),
           ),
         ],
       ),

    );
  }


}




