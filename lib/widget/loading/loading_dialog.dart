
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'my_loading.dart';


class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyLoading();
  }
  static void show({bool? mateStyle,String? status}) {
    EasyLoading.show(status:status,dismissOnTap: false);
    // Get.dialog(const LoadingDialog(),barrierDismissible: false,
    // barrierColor: Colors.transparent);
  }
  static void hide(){
    EasyLoading.dismiss();
    // Get.back();
  }
}
