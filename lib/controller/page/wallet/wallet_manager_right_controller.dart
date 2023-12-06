

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/data/constants/wallet_type.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_export_private_key_data.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/service/resp/node/query_public_key_resp.dart';
import 'package:get/get.dart';

import '../../../data/wallet/wallet_create_import_data.dart';
import '../../../db/entity/wallet_entity.dart';
import '../../../db/service/wallet_db_service.dart';
import '../../../lang/string.dart';
import '../../../res/resource.dart';
import '../../../service/node/node_service.dart';
import '../../../ui/dialog/select_bottom_dialog.dart';
import '../../../ui/page/wallet/wallet_select_page.dart';
import '../../../utils/toast_util.dart';
import '../../../widget/loading/loading_dialog.dart';
import '../home/assets/home_assets_have_wallet_controller.dart';
import '../home/home_assets_controller.dart';
import 'wallet_manager_controller.dart';


class WalletManagerRightController extends SuperController{


  final WalletTypeBean data;
  RxList<Wallet> walletAr=<Wallet>[].obs;
  WalletManagerRightController(this.data);
  @override
  void onInit() {
    super.onInit();
      initWalletList();
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

  void initWalletList()async{
      walletAr.value =await WalletDbService.getInstance()!.findWalletByWalletType(data.walletType);
  }


  void addWallet(){

    List<String> dataAr=[Ids.createWallet.tr,Ids.importWallet.tr];
    Get.bottomSheet(SelectBottomDialog(dataAr,selectCallback: (select){
      if(select==0){
        Get.toNamed(Routes.walletCreateImport,
            arguments: WalletCreateImportData(walletSelectType:WalletSelectType.create,
                refresh: (){
                  Get.back();
                },
                walletType:data.walletType));
      }else if(select==1){
        Get.toNamed(Routes.walletCreateImport,
            arguments: WalletCreateImportData(walletSelectType:WalletSelectType.import,
                refresh: (){
                  Get.back();
                },
                walletType:data.walletType));
      }
    },));
  }
}

