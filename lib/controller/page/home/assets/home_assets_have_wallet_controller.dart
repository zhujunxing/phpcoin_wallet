

import 'package:dio/dio.dart';
import 'package:flutter_phpcoin/db/service/wallet_db_service.dart';
import 'package:flutter_phpcoin/res/resource.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../data/wallet/assets_b_data.dart';
import '../../../../db/entity/wallet_entity.dart';
import '../../../../service/node/node_service.dart';
import '../../../../service/resp/node/query_balance_resp.dart';
import '../../app/app_controller.dart';



class HomeAssetsHaveWalletController extends SuperController{


 RefreshController refreshController=RefreshController();

 RxList<String> titleAr=<String>[].obs;

 RxList<AssetsCoinData> dataAr=<AssetsCoinData>[].obs;
 Wallet? wallet;
 var walletName=''.obs;

 var isOpen=false.obs;
 CancelToken cancelToken=CancelToken();
  @override
  void onInit() {
    super.onInit();

    dataAr.value=[
     AssetsCoinData(ImageResource.phpCoin,"0","0","PHPCOIN",''),
    ];
    initWallet();
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

  void initWallet()async{

     wallet=await WalletDbService.getInstance()!.findSelect();
     if(wallet!=null){
      walletName.value=wallet!.walletName??"";
     }
     queryBalance();
  }

  void queryBalance()async{
    QueryBalanceResp? resp=await NodeService.getInstance()!.queryBalance(wallet!.walletAddress??"",wallet!.walletPublicKey??"",cancelToken: cancelToken);
      if(resp==null){
        refreshController.refreshCompleted();
        return;
      }
      refreshController.refreshCompleted();
      if(resp.status=='ok'){
        dataAr.value=[
          AssetsCoinData(ImageResource.phpCoin,resp.data??"0","0",resp.coin!.toUpperCase(),""),
        ];
      }
  }
}
