
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';


class AboutAppController extends SuperController{


  var operation="".obs;

  var version="".obs;

  var build="".obs;





  @override
  void onInit() {
    super.onInit();
     _initPackageInfo();
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
  Future<void> _initPackageInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (kIsWeb == true) {
      operation.value = "Web";
    } else if (Platform.isIOS) {
      operation.value = "iPhone";
    } else if (Platform.isAndroid) {
      operation.value = "Android";
    }

    version.value = packageInfo.version;
    build.value = packageInfo.buildNumber;
  }


}
