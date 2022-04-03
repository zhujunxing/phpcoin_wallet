

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/service/node/node_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../service/resp/node/query_node_info_resp.dart';



class HomeNodeController extends SuperController{

  CancelToken cancelToken=CancelToken();




  var accounts=0.obs;
  var transactions=0.obs;
  var mempool=0.obs;
  var masternodes=0.obs;
  var peers=0.obs;
  var height=0.obs;
  int lastBlockTime=0;
  var totalSupply=0.00000000.obs;
  var avgBlockTime10=0.0.obs;
  var avgBlockTime100=0.0.obs;
  var hashRate10=0.0.obs;
  var hashRate100=0.0.obs;
  var currentSupply=0.00000000.obs;

  Timer? timer;
  var time=0.obs;
  RefreshController refreshController=RefreshController();

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
    if(timer!=null){
      timer!.cancel();
      timer=null;
    }
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
    queryNodeInfo(Get.context);
  }
  void queryNodeInfo(BuildContext? context)async {
    refreshController.refreshCompleted();
    QueryNodeInfoResp? resp=await NodeService.getInstance()!.queryNodeInfo(cancelToken: cancelToken);

    if(!cancelToken.isCancelled){
      if(resp!=null){

        if(resp.status=='ok'){
          NodeInfoDataBean? data = resp.data;
          if(data!=null){
            accounts.value=data.accounts??0;
            transactions.value=data.transactions??0;
            masternodes.value=data.masternodes??0;
            peers.value=data.peers??0;
            height.value=data.height??0;
            lastBlockTime=data.lastBlockTime??0;
            totalSupply.value=data.totalSupply??0.00000000;
            avgBlockTime10.value=data.avgBlockTime10??0.0;
            avgBlockTime100.value=data.avgBlockTime100??0.0;
            hashRate10.value=data.hashRate10??0.0;
            hashRate100.value=data.hashRate100??0.0;
            currentSupply.value=data.totalSupply??0.00000000;
            int current=DateTime.now().millisecondsSinceEpoch~/1000;
            time.value=current-lastBlockTime;

          }
        }



      }


    }

  }

  void  startTime(){

    if(time.value>0){
      if(timer!=null){
        timer!.cancel();
        timer=null;
      }
      timer=Timer.periodic(const Duration(seconds: 1), (timer) {
        time.value=time.value-1;
        if(time.value<=0){
          timer.cancel();
          return;
        }
      });
    }else{
      if(timer!=null){
        timer!.cancel();
        timer=null;
      }
    }
  }
}
