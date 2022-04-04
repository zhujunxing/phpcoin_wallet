

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/service/resp/node/query_public_key_resp.dart';
import 'package:get/get.dart';

import '../../../data/wallet/wallet_create_import_data.dart';
import '../../../db/entity/wallet_entity.dart';
import '../../../db/service/wallet_db_service.dart';
import '../../../lang/string.dart';
import '../../../service/node/node_service.dart';
import '../../../utils/toast_util.dart';
import '../../../widget/loading/loading_dialog.dart';


class WalletWatchImportController extends SuperController{
  WalletCreateImportData data;
  late TextEditingController editAddress;
  CancelToken cancelToken=CancelToken();
  WalletWatchImportController(this.data){
    editAddress=TextEditingController.fromValue(
        TextEditingValue(
          // 设置内容
            text: "",
            // 保持光标在最后
            selection: TextSelection
                .fromPosition( const TextPosition(
                affinity: TextAffinity.downstream,
                offset:"".length))));
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

  void submit(BuildContext context)async {

    if(editAddress.text.trim().isEmpty){
      ToastUtil.toast(context, Ids.enterOrPasteWalletAddress.tr);
      return;
    }

    List<Wallet> walletList=await WalletDbService.getInstance()!.findWalletByWalletName(editAddress.text.trim());
    if(walletList.isNotEmpty){
      ToastUtil.toast(context,Ids.walletNameExist.tr);
      return;
    }
    List<Wallet> walletAddressList=await WalletDbService.getInstance()!.findWalletByWalletAddress(editAddress.text.trim());
    if(walletAddressList.isNotEmpty){
      ToastUtil.toast(context,Ids.walletAddressExist.tr);
      return;
    }
    LoadingDialog.show();
    QueryPublicKeyResp? resp=await NodeService.getInstance()!.queryPublicKey(editAddress.text.trim(),cancelToken: cancelToken);
    LoadingDialog.hide();
    if(!cancelToken.isCancelled){
      if(resp!=null){

        if(resp.status=='ok'){

          List<Wallet> allAr=await WalletDbService.getInstance()!.findAll();
          Wallet wallet=Wallet(null,
              editAddress.text.trim(),
              data.walletType,
              editAddress.text.trim(),
              resp.data,
               "",
               "",
               "",
              DateTime.now().millisecondsSinceEpoch,
              "",
              null,0,allAr.isNotEmpty?0:1);
          await WalletDbService.getInstance()!.add(wallet);
          ToastUtil.toast(context,Ids.importWalletSuccess.tr);
          if(data.refresh!=null){
            data.refresh!.call();
          }
          Get.back();
        }else{
          ToastUtil.toast(context,Ids.pleaseCheckTrueAddress.tr);
        }
       }


    }
  }



}
