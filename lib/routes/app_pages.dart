
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/ui/page/address/address_book_list_page.dart';
import 'package:flutter_phpcoin/ui/page/wallet/wallet_create_import_page.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../data/address/address_book_data.dart';
import '../ui/page/about/about_app_page.dart';
import '../ui/page/address/address_book_edit_page.dart';
import '../ui/page/assets/assets_main_page.dart';
import '../ui/page/home/home_page.dart';
import '../ui/page/image/image_screen_show_page.dart';
import '../ui/page/language/language_switch_page.dart';
import '../ui/page/scan/scan_page.dart';
import '../ui/page/set/system_set_page.dart';
import '../ui/page/wallet/wallet_create_page.dart';
import '../ui/page/wallet/wallet_select_page.dart';
import '../ui/page/web/web_page.dart';



part 'app_routes.dart';

class AppPages {
  static const install = Routes.root;

  static final routes = [
    GetPage(
        name:install,
        page:()=>  HomePage(),
    ),


    GetPage(
      name: Routes.home,
      page:()=>  HomePage(),
    ),
    GetPage(
      name: Routes.assetsMain,
      page:()=>  AssetsMainPage(),
    ),
    GetPage(
      name: Routes.addressBookList,
      page:()=>  AddressBookListPage(),
    ),
    GetPage(
      name: Routes.addressBookEdit,
      page:()=>  AddressBookEditPage(data:Get.arguments),
    ),



    GetPage(
      name: Routes.web,
      page:()=>  WebPage(Get.arguments),
    ),

    GetPage(
      name: Routes.imageScreenShow,
      page:()=>  ImageScreenShowPage(Get.arguments),
      transition: Transition.fade,
    ),

    GetPage(
      name: Routes.scan,
      page:()=>  ScanPage(),
    ),

    GetPage(
      name: Routes.aboutApp,
      page:()=> AboutAppPage(),
    ),

    GetPage(
      name: Routes.systemSet,
      page:()=> SystemSetPage(),
    ),
    GetPage(
      name: Routes.languageSwitch,
      page:()=> LanguageSwitchPage(),
    ),
    GetPage(
      name: Routes.walletSelect,
      page:()=> WalletSelectPage(selectType: Get.arguments,),
      transition: Transition.downToUp
    ),
    GetPage(
      name: Routes.walletCreateImport,
      page:()=> WalletCreateImportPage(Get.arguments,),
    ),
    GetPage(
      name: Routes.walletCreate,
      page:()=> WalletCreatePage(Get.arguments,),
    ),
  ];
}



