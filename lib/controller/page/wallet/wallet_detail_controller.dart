

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_export_private_key_data.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/service/resp/node/query_public_key_resp.dart';
import 'package:get/get.dart';

import '../../../data/wallet/wallet_create_import_data.dart';
import '../../../db/entity/wallet_entity.dart';
import '../../../db/service/wallet_db_service.dart';
import '../../../lang/string.dart';
import '../../../service/node/node_service.dart';
import '../../../utils/toast_util.dart';
import '../../../widget/loading/loading_dialog.dart';
import '../home/assets/home_assets_have_wallet_controller.dart';
import '../home/home_assets_controller.dart';


class WalletDetailController extends SuperController{

  Wallet? wallet;
  var walletAddress="".obs;
  var walletName="".obs;
  HomeAssetsHaveWalletController  homeAssetsHaveWalletController=Get.find();
  HomeAssetsController  homeAssetsController=Get.find();
  WalletDetailController(this.wallet){

      if(wallet!=null){
        walletName.value=wallet!.walletName??"";
              String address=wallet!.walletAddress??"";
            if(address.isNotEmpty){
              walletAddress.value=address.substring(0,9)+"···"+address.substring(address.length-7,address.length);
            }
      }

  }

  @override
  void onInit() {
    super.onInit();

  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

  }


  @override
  void onDetached() {

  }

  @override
  void onInactive() {
  }

  @override
  void onPaused() {

  }

  @override
  void onResumed() {

  }

  void modifyWalletName(BuildContext context,String name)async {
    if(wallet==null){
      return;
    }
       if(name.isEmpty){
         ToastUtil.toast(context, "钱包不能为空");
         return;
       }
      List<Wallet> walletList=await WalletDbService.getInstance()!.findWalletByWalletName(name);
      if(walletList.isNotEmpty){
        ToastUtil.toast(context, Ids.walletNameExist.tr);
        return;
      }
      wallet!.walletName=name;
    await WalletDbService.getInstance()!.update(wallet!);
    walletName.value=name;
    homeAssetsHaveWalletController.initWallet();

  }

  void verifyPwd(BuildContext content,pwd)async {

    if(pwd.isEmpty){
      ToastUtil.toast(content, "密码不能为空");
      return;
    }
    
   Wallet? queryWallet=await WalletDbService.getInstance()!.findWalletByPwdAddress(pwd,wallet!.walletAddress!);
     if(queryWallet==null){
       ToastUtil.toast(content, "密码错误");
       return;
     }
     Get.toNamed(Routes.walletExportPrivateKey,
         arguments: WalletExportPrivateKeyData(queryWallet.walletPublicKey, queryWallet.walletPrivateKey));
  }

  void deleteWallet(BuildContext context) async{
    if(wallet==null){
      return;
    }
   await WalletDbService.getInstance()!.deleteById(wallet!.id??0);

    Future.delayed(Duration.zero,(){
      homeAssetsController.initWallet();
      Get.back();
    });
  }



}
