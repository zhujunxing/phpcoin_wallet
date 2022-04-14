

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
import 'wallet_manager_right_controller.dart';


class WalletCreateController extends SuperController{
  WalletCreateImportData data;

  late TextEditingController editName,editPwd,editPwdConfirm,editPwdTip;
  var walletName="".obs;

  var showClear=true.obs;
  CancelToken cancelToken=CancelToken();
   HomeAssetsController? homeAssetsController;

   WalletManagerRightController? walletManagerRightController;



  WalletCreateController(this.data){
    try{
      homeAssetsController=Get.find();
    }catch(e){
    }
    try{
      walletManagerRightController=Get.find();
    }catch(e){
    }

    initEdit();
    walletName.value=data.walletType;
    initData();
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


  void initEdit(){

    editName=TextEditingController.fromValue(
        TextEditingValue(
          // 设置内容
            text: "",
            // 保持光标在最后
            selection: TextSelection
                .fromPosition( const TextPosition(
                affinity: TextAffinity.downstream,
                offset:"".length))));
    editPwd=TextEditingController.fromValue(
        TextEditingValue(
          // 设置内容
            text: "",
            // 保持光标在最后
            selection: TextSelection
                .fromPosition( const TextPosition(
                affinity: TextAffinity.downstream,
                offset:"".length))));
    editPwdConfirm=TextEditingController.fromValue(
        TextEditingValue(
          // 设置内容
            text: "",
            // 保持光标在最后
            selection: TextSelection
                .fromPosition( const TextPosition(
                affinity: TextAffinity.downstream,
                offset:"".length))));
    editPwdTip=TextEditingController.fromValue(
        TextEditingValue(
          // 设置内容
            text: "",
            // 保持光标在最后
            selection: TextSelection
                .fromPosition( const TextPosition(
                affinity: TextAffinity.downstream,
                offset:"".length))));
  }
  void initData()async{
    List<Wallet> walletList=await WalletDbService.getInstance()!.findWalletByWalletType(walletName.value);
    String name="";
    if(walletList.isNotEmpty){
      name="${data.walletType}-${walletList.length+1}";
    }else{
      name=walletName.value;
    }
    editName.text=name;
  }

  void submit(BuildContext context)async {

    if(editName.text.trim().isEmpty){
      ToastUtil.toast(context, Ids.pleaseEnterName.tr);
      return;
    }

    if(editPwd.text.trim().isEmpty){
      ToastUtil.toast(context,Ids.mustPwd6Digits.tr);
      return;
    }
    if(editPwd.text.trim().length<6){
      ToastUtil.toast(context,Ids.mustPwd6Digits.tr);
      return;
    }
    if(editPwdConfirm.text.trim().isEmpty){
      ToastUtil.toast(context,Ids.pleaseEnterPwd.tr);
      return;
    }
    if(editPwd.text.trim()!=editPwdConfirm.text.trim()){
      ToastUtil.toast(context,Ids.pwdConfirmPwdNoEquals.tr);
      return;
    }
     List<Wallet> walletList=await WalletDbService.getInstance()!.findWalletByWalletName(editName.text.trim());
    if(walletList.isNotEmpty){
      ToastUtil.toast(context,Ids.walletNameExist.tr);
      return;
    }
    LoadingDialog.show();
    CreateWalletResp? resp=await NodeService.getInstance()!.createWallet(cancelToken: cancelToken);
    LoadingDialog.hide();
    if(!cancelToken.isCancelled){
      if(resp!=null){

        if(resp.status=='ok'){
          CreateWalletDataBean? data = resp.data;
          if(data!=null){
             String address=data.address!;
             String publicKey=data.publicKey!;
             String privateKey=data.privateKey!;

             List<Wallet> allAr=await WalletDbService.getInstance()!.findAll();
             Wallet wallet=Wallet(null,
                 editName.text.trim(),
                 this.data.walletType,
                 address,
                 publicKey,
                 privateKey,
                 editPwd.text.trim(),
                 editPwdTip.text.trim(),
                 DateTime.now().millisecondsSinceEpoch,
                 "",
                 null,0,allAr.isNotEmpty?0:1);
            await WalletDbService.getInstance()!.add(wallet);

             if(homeAssetsController!=null){
               homeAssetsController!.initWallet();
             }
             if(walletManagerRightController!=null){
               walletManagerRightController!.initWalletList();
             }

             ToastUtil.toast(context,Ids.createWalletSuccess.tr);
             if(this.data.refresh!=null){
               this.data.refresh!.call();
             }
             Get.back();


          }
        }



      }


    }
  }
}