import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/ui/page/wallet/wallet_detail_page.dart';
import 'package:get/get.dart';

import '../../../config/sp.dart';
import '../../../controller/dialog/select_bottom_dialog.dart';
import '../../../controller/page/wallet/wallet_manager_controller.dart';
import '../../../controller/page/wallet/wallet_manager_right_controller.dart';
import '../../../data/model/language/language_switch_model.dart';
import '../../../data/wallet/wallet_create_import_data.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/constant.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/screen.dart';
import '../../../widget/custom/divider_line.dart';
import 'wallet_manager_right_item.dart';
import 'wallet_select_page.dart';




class WalletManagerRightPage extends StatelessWidget {
  final WalletTypeBean data;
  late WalletManagerRightController controller;
  Function? callback;
   WalletManagerRightPage(this.data,{Key? key,this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    controller=Get.put(WalletManagerRightController(data));

    return Obx((){
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(Dimens.dp15, 0,Dimens.dp15, 0),
              height: Dimens.dp60,
              child: Row(
                children: [
                  Text(data.walletType,style: TextStyle(
                    fontSize: Dimens.sp16,
                    color: Colours.defaultTextColor,
                    fontWeight: FontWeight.w500,
                  ),),
                  Expanded(child: Container()),
                  if (controller.walletAr.isNotEmpty) GestureDetector(
                    child: Container(
                      width:Dimens.dp20,
                      height: Dimens.dp20,
                      decoration:  BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color:Colours.defaultTextColor,
                            width: Dimens.dp1,
                          )
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: ImageIcon(AssetImage(ImageResource.addBorder),size: Dimens.sp14,
                              color: Colours.defaultTextColor,),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){

                      controller.addWallet();


                    },
                  ) else const SizedBox(),

                ],
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((content, index) {
              return Container(
                child: GestureDetector(
                  child: WalletManagerRightItem(controller.walletAr.toList().elementAt(index),index),
                  onTap: (){
                    if(callback!=null){
                      callback!.call(controller.walletAr.toList().elementAt(index));
                    }
                  },
                ),
                margin: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp10, Dimens.dp15, 0),
              );
            }, childCount: controller.walletAr.length),
          ),
          SliverToBoxAdapter(
            child: controller.walletAr.isEmpty?GestureDetector(
              child: Container(
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(Dimens.sp4),
                  color: Colours.grayColor.withOpacity(0.2),
                  child: Container(
                    height: Dimens.dp50,
                    child: Text(Ids.addWallet.tr,style: TextStyle(
                      fontSize: Dimens.sp14,
                      color: Colours.hintTextColor,
                    ),),
                    alignment: Alignment.center,
                  ),
                ),
                margin: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp10, Dimens.dp15, 0),
              ),
              onTap: (){
                controller.addWallet();
              },
            ):const SizedBox(),


            // Container(
            //   margin: EdgeInsets.fromLTRB(Dimens.dp15, 0,Dimens.dp15, 0),
            //   height: Dimens.dp60,
            // ),
          ),
        ],
      );
    });
  }
}


