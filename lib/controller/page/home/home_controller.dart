

import 'package:flutter/foundation.dart';

import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get/get.dart';

import '../../../lang/string.dart';
import '../../../res/resource.dart';
import '../../../ui/page/home/home_page.dart';


class HomeController extends SuperController{

  List<TabData> tabData=[];
  bool canVibrate = false;

  var tabIndex = 0.obs;
  int currentTime=0;
  DateTime? lastPopTime;
  @override
  void onInit() {
    super.onInit();
       tabData=[

       ];
       initVibrate();

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

  void setTabIndex(int tabIndex) {
    this.tabIndex.value=tabIndex;
    if(canVibrate){
      Vibrate.feedback(FeedbackType.selection);
    }
  }

  void initVibrate() async {
    if(kIsWeb == true){
    }else{
      canVibrate = await Vibrate.canVibrate;
    }
  }

}
