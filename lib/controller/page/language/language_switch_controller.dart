
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../config/sp.dart';
import '../../../data/model/language/language_switch_model.dart';
import '../../../res/constant.dart';
import '../home/home_myself_controller.dart';


class LanguageSwitchController extends SuperController{

  RxList<LanguageSwitchModel> languageAr=<LanguageSwitchModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    LanguageSwitchModel znCn = LanguageSwitchModel();
    znCn.title = "简体中文";
    znCn.languageCode = "zh";
    znCn.countryCode = "CN";

    LanguageSwitchModel znHk = LanguageSwitchModel();
    znHk.title = "繁體中文";
    znHk.languageCode = "zh";
    znHk.countryCode = "HK";

    LanguageSwitchModel enUs = LanguageSwitchModel();
    enUs.title = "English";
    enUs.languageCode = "en";
    enUs.countryCode = "US";
    languageAr.value=[znCn,znHk,enUs];
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


  //切换语言
  Future<bool?> switchLanguage(LanguageSwitchModel languageSwitchModel) async {
     await MyPref.getInstance()!.write(Constant.keyLanguage,languageSwitchModel.toJson());
     Locale locale = Locale(languageSwitchModel.languageCode!, languageSwitchModel.countryCode);
     Get.updateLocale(locale);
     languageAr.refresh();
    return true;
  }
}
