

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
import '../../../utils/toast_util.dart';
import '../../../widget/loading/loading_dialog.dart';
import '../home/assets/home_assets_have_wallet_controller.dart';
import '../home/home_assets_controller.dart';


class WalletManagerController extends SuperController{


  RxList<WalletTypeBean> leftAr=<WalletTypeBean>[].obs;

  int leftSelect=0;

  var walletType=WalletType.phpCoin.obs;


  @override
  void onInit() {
    super.onInit();

    leftAr.value=[
      WalletTypeBean(ImageResource.phpCoin,ImageResource.phpCoin,WalletType.phpCoin)
    ];
    leftSelect=0;
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

  void switchWallet(Wallet selected)async {

    await WalletDbService.getInstance()!.updateAllSelect(0);
     selected.walletSelect=1;
    await WalletDbService.getInstance()!.update(selected);

    HomeAssetsHaveWalletController homeAssetsHaveWalletController=Get.find();
    homeAssetsHaveWalletController.refreshController.requestRefresh();


    Get.back();
  }
}



class WalletTypeBean{
  String selectImg="";
  String noSelectImg="";
  String walletType="";
  WalletTypeBean(this.selectImg,this.noSelectImg,this.walletType,);
}