

import 'package:flutter_phpcoin/db/entity/wallet_entity.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../db/service/wallet_db_service.dart';



class AssetsMainController extends SuperController{

  RefreshController refreshController=RefreshController();

  var isEye=true.obs;
  RxList<Wallet> dataAr=<Wallet>[].obs;
  @override
  void onInit() {
    super.onInit();

    initWallet();
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
    dataAr.value=await WalletDbService.getInstance()!.findAll();

  }

}
