

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebController extends SuperController{

  var title="".obs;
  var isLoading=false.obs;
  var progress = 0.obs;
  WebViewController? controller;

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

  void canBack(BuildContext context) async{
    if (controller == null) {
      return;
    }
    bool canGoBack = await controller!.canGoBack();

    if (canGoBack) {
      controller!.goBack();
    } else {
      Get.back();
    }
  }

  void setTitle(String title)  {
    this.title.value = title;
  }

  void setLoadingShow(bool isLoading)  {
    this.isLoading.value= isLoading;
  }

  void setProgress(int progress)  {
    this.progress.value= progress;
  }

}
