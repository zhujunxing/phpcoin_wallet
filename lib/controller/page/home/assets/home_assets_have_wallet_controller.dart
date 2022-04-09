

import 'package:flutter_phpcoin/db/service/wallet_db_service.dart';
import 'package:flutter_phpcoin/res/resource.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../data/wallet/assets_b_data.dart';
import '../../../../db/entity/wallet_entity.dart';
import '../../app/app_controller.dart';



class HomeAssetsHaveWalletController extends SuperController{


 RefreshController refreshController=RefreshController();

 RxList<String> titleAr=<String>[].obs;

 RxList<AssetsCoinData> dataAr=<AssetsCoinData>[].obs;
 Wallet? wallet;
 var walletName=''.obs;
  @override
  void onInit() {
    super.onInit();

    dataAr.value=[
     AssetsCoinData(ImageResource.phpCoin,"0","0","PHPCoin"),
    ];

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

  void initWallet()async{

     wallet=await WalletDbService.getInstance()!.findSelect();
     logger.i("sssss;${wallet}");
     print('aaaaaaa:${wallet}');

     if(wallet!=null){
      walletName.value=wallet!.walletName??"";
     }

  }

}
