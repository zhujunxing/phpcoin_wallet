

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_export_private_key_data.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/service/resp/node/query_public_key_resp.dart';
import 'package:flutter_phpcoin/utils/file_util.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

import '../../../data/wallet/wallet_create_import_data.dart';
import '../../../db/entity/wallet_entity.dart';
import '../../../db/service/wallet_db_service.dart';
import '../../../lang/string.dart';
import '../../../service/node/node_service.dart';
import '../../../utils/screen.dart';
import '../../../utils/toast_util.dart';
import '../../../widget/loading/loading_dialog.dart';
import '../app/app_controller.dart';
import '../home/assets/home_assets_have_wallet_controller.dart';
import '../home/home_assets_controller.dart';


class TransferReceiveErWeiController extends SuperController{

   var address="".obs;
   GlobalKey rootWidgetKey=GlobalKey();
   TransferReceiveErWeiController(String address){
     this.address.value=address;
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

  void share(BuildContext context)async {

   dynamic result=await Screen.saveScreen(rootWidgetKey, context);

       if(result!=null&&result['isSuccess']){
         ToastUtil.toast(context, "已保存到图片相册里");
           File?  file=await FileUtil.convertUriToFile(result['filePath']);
           if(file!=null){
             Share.shareFiles([file.path],
               text: address.value,);
           }
       }else{
         ToastUtil.toast(context, "保存图片失败");
       }

  }


}
