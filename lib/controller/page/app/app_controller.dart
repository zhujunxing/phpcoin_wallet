import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../config/sp.dart';
import '../../../data/model/language/language_switch_model.dart';
import '../../../lang/translation_service.dart';
import '../../../res/constant.dart';
import 'package:logger/logger.dart';

///日志
var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);


class AppController extends SuperController {




  @override
  void onInit() {
    super.onInit();
    _initAsync();
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


  void _initAsync()  {

  }

  ///获取语言
  Locale loadLocale() {
    logger.i("初始化主题，语言");
    Locale locale;
    Map<dynamic,dynamic>? map =MyPref.getInstance()!.read(Constant.keyLanguage);

    if(map!=null){
      LanguageSwitchModel? language = LanguageSwitchModel.fromMap(map);
      locale = Locale(language!.languageCode!, language.countryCode!);
    }else{
      locale = TranslationService.locale??const Locale("zh", "CN");
    }
    logger.i("当前语言:${locale.languageCode} ${locale.countryCode}");
    return locale;
  }
}
