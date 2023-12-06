

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_export_private_key_data.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/service/resp/node/query_public_key_resp.dart';
import 'package:flutter_phpcoin/service/resp/node/query_transfer_record_resp.dart';
import 'package:flutter_phpcoin/utils/file_util.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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


class TransferRecordListController extends SuperController{

  RefreshController refreshController=RefreshController(initialRefresh: false);

  RxList<TransferRecordDataBean> dataAr=<TransferRecordDataBean>[].obs;
   String address="";
  int pageNow = 1;
  int pageSize=10;
  var isMore=false.obs;
  var  isNoData=false.obs;
  int index=0;
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

  void initData(String address,int index) {
     this.address=address;
     this.index=index;

  }
  void refreshing(BuildContext context) {
    isMore.value=false;
    pageNow=1;
    queryTransactions(context, pageNow, pageSize);
  }

  void loading(BuildContext context) {

    pageNow++;
    isMore.value=true;
    queryTransactions(context, pageNow, pageSize);
  }

  void queryTransactions(BuildContext context,int pageNow,int pageSize) async{

    String transferType='';
    if(index==0){
      transferType="";
    }else if(index==1){
      transferType="receive";
    }else if(index==2){
      transferType="send";
    }
    QueryTransferRecordResp? resp=await NodeService.getInstance()!.queryTransactions(address: address,offset: (pageNow-1)*pageSize,limit: pageSize,
    transferType: transferType);

    if(resp!=null&&resp.status=='ok'){
      if(pageNow==1){
        if(resp.data!=null&&resp.data!=null&&resp.data!.isNotEmpty){
          isNoData.value=false;
          dataAr.value=resp.data!;
        }else{
          dataAr.value=[];
          isNoData.value=true;

        }

        refreshController.refreshCompleted(resetFooterState: true);
      }else{
        if(resp.data!=null&&resp.data!=null&&resp.data!.isNotEmpty){
          dataAr.addAll(resp.data!);
          refreshController.loadComplete();
        }else{
          pageNow--;
          refreshController.loadNoData();
        }
      }
    }else{
      if(pageNow==1){
        refreshController.refreshCompleted(resetFooterState: true);
      }else{
        pageNow--;
        refreshController.loadComplete();
      }
    }


  }




}
