import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/lang/en_US.dart';
import 'package:flutter_phpcoin/lang/zh_CN.dart';
import 'package:flutter_phpcoin/lang/zh_HK.dart';
import 'package:get/get.dart';

import 'string.dart';


class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static  Locale fallbackLocale =  const Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': zhCn,
        'zh_HK': zhHK,
        'en_US': enUs,
      };
}
