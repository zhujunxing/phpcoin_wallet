

import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/db/entity/wallet_entity.dart';
import 'package:flutter_phpcoin/db/service/wallet_db_service.dart';
import 'package:flutter_phpcoin/service/resp/node/create_wallet_resp.dart';
import 'package:flutter_phpcoin/widget/loading/loading_dialog.dart';
import 'package:get/get.dart';

import '../../../data/wallet/wallet_create_import_data.dart';
import '../../../lang/string.dart';
import '../../../service/node/node_service.dart';
import '../../../utils/toast_util.dart';
import '../home/home_assets_controller.dart';


class WalletPwdPrivateKeyModifyController extends SuperController{


  String address;
  late TextEditingController editPwd,editNew,editNewConfirm;
  WalletPwdPrivateKeyModifyController(this.address);
  @override
  void onInit() {
    super.onInit();
    initEdit();
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
  void initEdit(){

    editPwd=TextEditingController.fromValue(
        TextEditingValue(
          // 设置内容
            text: "",
            // 保持光标在最后
            selection: TextSelection
                .fromPosition( const TextPosition(
                affinity: TextAffinity.downstream,
                offset:"".length))));
    editNew=TextEditingController.fromValue(
        TextEditingValue(
          // 设置内容
            text: "",
            // 保持光标在最后
            selection: TextSelection
                .fromPosition( const TextPosition(
                affinity: TextAffinity.downstream,
                offset:"".length))));
    editNewConfirm=TextEditingController.fromValue(
        TextEditingValue(
          // 设置内容
            text: "",
            // 保持光标在最后
            selection: TextSelection
                .fromPosition( const TextPosition(
                affinity: TextAffinity.downstream,
                offset:"".length))));

  }

  void modifyPwd(BuildContext context)async {


    if(editPwd.text.trim().isEmpty){
      ToastUtil.toast(context, Ids.privateKeyIsError.tr);
      return;
    }

    if(editNew.text.trim().isEmpty){
      ToastUtil.toast(context, Ids.setPwdIsNotEmpty.tr);
      return;
    }
    if(editNew.text.trim().length<6){
      ToastUtil.toast(context, Ids.setPwdLengthValidate.tr);
      return;
    }
    if(editNewConfirm.text.trim().isEmpty){
      ToastUtil.toast(context, Ids.repeatPwdIsNotEmpty.tr);
      return;
    }
    if(editNew.text.trim()!=editNewConfirm.text.trim()){
      ToastUtil.toast(context, Ids.repeatPwdIsNotEqual.tr);
      return;
    }

    Wallet? queryWallet=await WalletDbService.getInstance()!.findWalletByPrivateKeyAddress(editPwd.text.trim(),address);
    if(queryWallet==null){
      ToastUtil.toast(context,Ids.privateKeyIsError.tr);
      return;
    }
    queryWallet.pwd=editNewConfirm.text.trim();
    await WalletDbService.getInstance()!.update(queryWallet);
    ToastUtil.toast(context, Ids.pwdModifySuccess.tr);
    Get.back();
  }

}
