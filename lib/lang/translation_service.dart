import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'string.dart';


class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static  Locale fallbackLocale =  const Locale('zh', 'CN');
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': localizedDefaultValues['zh']!['CN']!,
        'zh_HK': localizedDefaultValues['zh']!['HK']!,
        'en_US':localizedDefaultValues['en']!['US']!,
      };
}