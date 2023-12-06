
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/res/colors.dart';
import 'package:flutter_phpcoin/res/resource.dart';
import 'package:flutter_phpcoin/res/style.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/utils/screen.dart';
import 'package:get/get.dart';

import '../../../controller/page/home/assets/home_assets_have_wallet_controller.dart';
import '../../../lang/string.dart';
import '../../page/wallet/wallet_manager_item_page.dart';





class WalletSelectDialog extends StatelessWidget {



  HomeAssetsHaveWalletController homeAssetsHaveWalletController=Get.find();
   WalletSelectDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: GestureDetector(
            behavior:HitTestBehavior.opaque,
            child:Container(
            ),
            onTap: (){
              homeAssetsHaveWalletController.isOpen.value=false;
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
                   child: Row(
                     children: [
                       GestureDetector(
                         behavior: HitTestBehavior.opaque,
                         onTap: (){
                           homeAssetsHaveWalletController.isOpen.value=false;
                           Get.back();
                           Get.toNamed(Routes.walletManager);
                         },
                         child: Container(
                           padding: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
                           child: ImageIcon(AssetImage(ImageResource.wallet),size: Dimens.sp16,),
                         ),
                       ),
                       Expanded(child: Container(
                         alignment: Alignment.center,
                         child: Text(Ids.walletList.tr,style: TextStyle(
                           fontSize: Dimens.sp16,
                           color: Colours.defaultTextColor,
                           fontWeight: FontWeight.w500,
                         ),),
                       )),
                       GestureDetector(
                         behavior: HitTestBehavior.opaque,
                         onTap: (){
                           homeAssetsHaveWalletController.isOpen.value=false;
                           Get.back();
                         },
                         child: Container(
                           padding: EdgeInsets.all(Dimens.dp15),
                           child: ImageIcon(AssetImage(ImageResource.exit),size: Dimens.sp14,color: Colours.defaultTextColor,),
                         ),
                       ),
                     ],
                   ),
                 ),
                 Container(
                   color: Colors.white,
                   height: Dimens.dp400,
                   child: WalletManagerItemPage(clickType: WalletManagerClickType.switchWallet,),
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

