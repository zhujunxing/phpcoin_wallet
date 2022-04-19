

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_export_private_key_data.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/service/resp/node/query_public_key_resp.dart';
import 'package:flutter_phpcoin/service/resp/node/send_balance_resp.dart';
import 'package:flutter_phpcoin/utils/file_util.dart';
import 'package:flutter_phpcoin/utils/phpcoin.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

import '../../../data/transfer/transfer_token_data.dart';
import '../../../data/wallet/wallet_create_import_data.dart';
import '../../../db/entity/wallet_entity.dart';
import '../../../db/service/wallet_db_service.dart';
import '../../../lang/string.dart';
import '../../../service/node/node_service.dart';
import '../../../service/resp/node/query_balance_resp.dart';
import '../../../ui/dialog/input_content_dialog.dart';
import '../../../ui/dialog/wallet/wallet_pay_sure_dialog.dart';
import '../../../ui/page/address/address_book_list_page.dart';
import '../../../utils/screen.dart';
import '../../../utils/toast_util.dart';
import '../../../widget/loading/loading_dialog.dart';
import '../app/app_controller.dart';
import '../home/assets/home_assets_have_wallet_controller.dart';
import '../home/home_assets_controller.dart';


class TransferTokenController extends SuperController{

  TransferTokenData data;
  late TextEditingController editAddress,editNum;
  String transferAddress="";
  var   tokenName="".obs;
  var   tokenAddress="".obs;

  var balance="0".obs;
  CancelToken cancelToken=CancelToken();
  FocusNode editAddressNode=FocusNode();
  FocusNode editNumNode=FocusNode();
  TransferTokenController(this.data){

    if(data.transferAddress!=null&&data.transferAddress!.isNotEmpty){
      transferAddress=data.transferAddress??"";
      }


    if(data.tokenName!=null&&data.tokenName!.isNotEmpty){
      tokenName.value=data.tokenName??"";
    }

    if(data.tokenAddress!=null&&data.tokenAddress!.isNotEmpty){
      tokenAddress.value=data.tokenAddress??"";
    }
  }


  @override
  void onInit() {
    super.onInit();
    editAddress=TextEditingController.fromValue(
        TextEditingValue(
          // 设置内容
            text: transferAddress,
            // 保持光标在最后
            selection: TextSelection
                .fromPosition( TextPosition(
                affinity: TextAffinity.downstream,
                offset:transferAddress.length))));
    editNum=TextEditingController.fromValue(
        TextEditingValue(
          // 设置内容
            text: "",
            // 保持光标在最后
            selection: TextSelection
                .fromPosition( const TextPosition(
                affinity: TextAffinity.downstream,
                offset:"".length))));
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
  Wallet?  wallet=await WalletDbService.getInstance()!.findSelect();
    if(wallet==null){
       return;
    }
    QueryBalanceResp? resp=await NodeService.getInstance()!.queryBalance(wallet.walletAddress??"",wallet.walletPublicKey??"",cancelToken: cancelToken);
    if(resp==null){
      return;
    }
    if(resp.status=='ok'){
      balance.value=resp.data??"0";
    }
  }

  void surePay(BuildContext context)async {
    editAddressNode.unfocus();
    editNumNode.unfocus();
    if(editAddress.text.trim().isEmpty){
      ToastUtil.toast(context, Ids.inputCopyWalletAddress.tr);
      return;
    }
    if(editNum.text.trim().isEmpty){
        ToastUtil.toast(context, Ids.pleaseInputNum.tr);
        return;
      }


    Wallet?  wallet=await WalletDbService.getInstance()!.findSelect();
    if(wallet==null){
      return;
    }
    Get.bottomSheet(WalletPaySureDialog(
      title: Ids.tradeDetail.tr,
        balance:editNum.text.trim(),
        payAddress: wallet.walletAddress??"",
        receiveAddress: editAddress.text.trim(),
        feeAmount: "0",
        feeBalance: "0",
        tokenName: tokenName.value,
        payWalletName: "${wallet.walletName}",
        selectCallback: (flag){
          if(flag){
            surePayPWd(wallet);
          }
    },),isScrollControlled: true);
  }
  void surePayPWd(Wallet wallet)async {
    Get.dialog(InputContentDialog(Ids.inputPwd.tr, "",content: ""
      ,listener: (select,pwd){
        if(select){
          verifyPwd(Get.context!,pwd,wallet);
        }
      },isPwd: true,));
  }
  void verifyPwd(BuildContext content,pwd,Wallet wallet)async {

    if(pwd.isEmpty){
      ToastUtil.toast(content, Ids.pwdIsNotEmpty.tr);
      return;
    }

    String num="0.00000000";

    try{
      double n=double.parse(editNum.text.trim());
      if(n<=0){
        ToastUtil.toast(content,  Ids.numMust0.tr);
      }
      num=n.toStringAsFixed(8);
    }catch(e){
      ToastUtil.toast(content, Ids.numMust0.tr);
    }


    Wallet? queryWallet=await WalletDbService.getInstance()!.findWalletByPwdAddress(pwd,wallet.walletAddress!);
    if(queryWallet==null){
      ToastUtil.toast(content, Ids.pwdError.tr);
      return;
    }
    String date="${DateTime.now().millisecondsSinceEpoch~/1000}";
    String message="Wallet Transfer";




    String fee = "0.00000000";
    String  walletPublicKey = wallet.walletPublicKey!;
    String type = "1";
    String tx= num + "-" + fee + "-" + editAddress.text.trim() + "-" + message + "-" + type + "-" + walletPublicKey + "-" + date;

    String signature=sign(wallet.walletPrivateKey!, tx);

    LoadingDialog.show();
    SendBalanceResp? resp=await NodeService.getInstance()!.sendBalance(cancelToken: cancelToken,
      val:num,
     dst: editAddress.text.trim(),
     publicKey: wallet.walletPublicKey,
     signature: signature,
      date: date,
      message: message,
      type: type,
       fee:fee,
    );
    LoadingDialog.hide();
    if(!cancelToken.isCancelled){
      if(resp!=null){
        if(resp.status=='ok'){
          String? data = resp.data;
          ToastUtil.toast(Get.context!,Ids.transferSendSuccess.tr);
           Get.back();
        }else{
          ToastUtil.toast(Get.context!,Ids.transferSendError.tr);
        }
      }


    }

  }
}
