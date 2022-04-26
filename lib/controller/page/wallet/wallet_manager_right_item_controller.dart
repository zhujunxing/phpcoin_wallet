

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
import '../../../service/resp/node/query_balance_resp.dart';
import '../../../utils/toast_util.dart';
import '../../../widget/loading/loading_dialog.dart';
import '../home/assets/home_assets_have_wallet_controller.dart';
import '../home/home_assets_controller.dart';
import 'wallet_manager_controller.dart';


class WalletManagerRightItemController extends SuperController{


  late Wallet wallet;
  var walletName="".obs;
  var  address="".obs;
  var walletAddress="".obs;
  var balance="0".obs;
  CancelToken cancelToken=CancelToken();
  WalletManagerRightItemController(this.wallet){

    walletName.value=wallet.walletName??"";
    address.value=wallet.walletAddress??"";
    if(address.isNotEmpty){
      walletAddress.value=address.substring(0,5)+"···"+address.substring(address.value.length-4,address.value.length);
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
  void queryBalance()async{
    QueryBalanceResp? resp=await NodeService.getInstance()!.queryBalance(wallet.walletAddress??"",wallet.walletPublicKey??"",cancelToken: cancelToken);
    if(resp==null){
      return;
    }
    if(resp.status=='ok'){
      balance.value="${double.parse(resp.data??"0")}";
    }
  }
}

