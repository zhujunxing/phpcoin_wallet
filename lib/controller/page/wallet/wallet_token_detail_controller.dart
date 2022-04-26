

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_export_private_key_data.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/service/resp/node/query_public_key_resp.dart';
import 'package:get/get.dart';

import '../../../data/wallet/wallet_create_import_data.dart';
import '../../../data/wallet/wallet_token_detail_data.dart';
import '../../../db/entity/wallet_entity.dart';
import '../../../db/service/wallet_db_service.dart';
import '../../../lang/string.dart';
import '../../../service/node/node_service.dart';
import '../../../service/resp/node/query_balance_resp.dart';
import '../../../utils/toast_util.dart';
import '../../../widget/loading/loading_dialog.dart';
import '../home/assets/home_assets_have_wallet_controller.dart';
import '../home/home_assets_controller.dart';


class WalletTokenDetailController extends SuperController{

  WalletTokenDetailData? data;

  Wallet? wallet;
  var tokenName="".obs;
  var tokenAddress="".obs;
  var balance="0".obs;
  CancelToken cancelToken=CancelToken();

  RxList<String> titleAr=<String>[].obs;
  PageController pageController=PageController();
  WalletTokenDetailController(this.data){

    if(data!=null){
      wallet=data!.wallet;
      tokenName.value=data!.tokenName??"";
      tokenAddress.value=data!.tokenAddress??"";
    }

  }

  @override
  void onInit() {
    super.onInit();
    titleAr.value=[(Ids.all1.tr)];
    queryBalance();
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    cancelToken.cancel();
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
    QueryBalanceResp? resp=await NodeService.getInstance()!.queryBalance(wallet!.walletAddress??"",wallet!.walletPublicKey??"",cancelToken: cancelToken);
    if(resp==null){

      return;
    }

    if(resp.status=='ok'){
       balance.value="${double.parse(resp.data??"0")}";
    }
  }



}
