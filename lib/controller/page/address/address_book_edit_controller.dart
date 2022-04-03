

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/db/service/address_book_db_service.dart';
import 'package:flutter_phpcoin/ui/page/address/address_book_edit_page.dart';
import 'package:flutter_phpcoin/utils/toast_util.dart';
import 'package:get/get.dart';

import '../../../data/address/address_book_data.dart';
import '../../../db/entity/address_book_entity.dart';
import '../../../lang/string.dart';
import '../../../widget/loading/loading_dialog.dart';



class AddressBookEditController extends SuperController{

 late TextEditingController editName,editRemarks,editAddress;

 var walletType="".obs;


 int? type;
 AddressBook? addressBook;
 String name="";
 String remarks="";
 String address="";

  Function? refreshCallBack;
 AddressBookEditController({AddressBookData? data}){

   if(data!=null){
     refreshCallBack=data.refresh!;
     type=data.type??AddressBookType.add;
     addressBook=data.data;
     if(addressBook!=null){
       name=addressBook!.name!;
       remarks=addressBook!.remarks!;
       address=addressBook!.walletAddress!;
       walletType.value=addressBook!.walletType!;
     }


   }else{
     type=AddressBookType.add;
   }
   initEdit();
 }

  @override
  void onInit() {
    super.onInit();

  }
  void initEdit(){
    editName=TextEditingController.fromValue(
        TextEditingValue(
          // 设置内容
            text: name,
            // 保持光标在最后
            selection: TextSelection
                .fromPosition( TextPosition(
                affinity: TextAffinity.downstream,
                offset:name.length))));
    editRemarks=TextEditingController.fromValue(
        TextEditingValue(
          // 设置内容
            text: remarks,
            // 保持光标在最后
            selection: TextSelection
                .fromPosition( TextPosition(
                affinity: TextAffinity.downstream,
                offset:remarks.length))));
    editAddress=TextEditingController.fromValue(
        TextEditingValue(
          // 设置内容
            text: address,
            // 保持光标在最后
            selection: TextSelection
                .fromPosition( TextPosition(
                affinity: TextAffinity.downstream,
                offset:address.length))));
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

  void submit(BuildContext context)async{
     if(editName.text.isEmpty){
      ToastUtil.toast(context, Ids.pleaseInputName.tr);
       return;
     }

     if(walletType.value.isEmpty){
       ToastUtil.toast(context,Ids.selectWalletNetwork.tr);
       return;
     }
     if(editAddress.text.isEmpty){
       ToastUtil.toast(context, Ids.scanOrCopyWalletAddress.tr);
       return;
     }
     LoadingDialog.show();

     if(type==AddressBookType.add){
       await AddressBookDbService.getInstance()!.add(AddressBook(
         null,
         editName.text.trim(),
         editRemarks.text.trim(),
         walletType.value,
         editAddress.text.trim(),
         0,
         DateTime.now().millisecondsSinceEpoch,
       ));
     }else{
         addressBook!.name=editName.text.trim();
         addressBook!.remarks=editRemarks.text.trim();
         addressBook!.walletType=walletType.value;
         addressBook!.walletAddress=editAddress.text.trim();
         await AddressBookDbService.getInstance()!.update(addressBook!);
     }

     LoadingDialog.hide();
     if(refreshCallBack!=null){
       refreshCallBack!.call();
     }
     Get.back();
  }

  void delete(BuildContext context) async{
    await AddressBookDbService.getInstance()!.deleteById(addressBook!.id!);
    if(refreshCallBack!=null){
      refreshCallBack!.call();
    }
    Get.back();
  }

}
