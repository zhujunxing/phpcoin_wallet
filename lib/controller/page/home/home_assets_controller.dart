

import 'package:get/get.dart';

import '../../../db/entity/wallet_entity.dart';
import '../../../db/service/wallet_db_service.dart';



class HomeAssetsController extends SuperController{

 var isHaveWallet=false.obs;
  @override
  void onInit() {
    super.onInit();
     initWallet();
  }
  void initWallet()async{
   List<Wallet> allAr=await WalletDbService.getInstance()!.findAll();
   if(allAr.isNotEmpty){
    isHaveWallet.value=true;
   }else{
    isHaveWallet.value=false;
   }
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

}
