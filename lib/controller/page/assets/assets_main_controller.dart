

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';



class AssetsMainController extends SuperController{

  RefreshController refreshController=RefreshController();

  var isEye=true.obs;
  RxList<String> dataAr=<String>[].obs;
  @override
  void onInit() {
    super.onInit();
    dataAr.add("");
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
