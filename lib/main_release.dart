import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_phpcoin/db/service/address_book_db_service.dart';
import 'package:flutter_phpcoin/db/service/wallet_db_service.dart';
import 'package:get_storage/get_storage.dart';

import 'ui/page/app/app_page.dart';



///支持跳过https
class MyHttpOverrides extends HttpOverrides {

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }

}


//主函数
void main() async{

  runZonedGuarded((){
      init();
  },(error,stack){


  });

}
///初始化
void init()async{
  ///等待初始化
  WidgetsFlutterBinding.ensureInitialized();
  ///覆盖https配置
  HttpOverrides.global = MyHttpOverrides();

  ///初始化数据存储
  await GetStorage.init();
  await AddressBookDbService.getInstance()!.open();
  await WalletDbService.getInstance()!.open();
  /// 强制竖屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp])
      .then((_) {

    FlavorConfig(
      name: "",
      color: Colors.transparent,
      location: BannerLocation.topStart,
      variables: {
          "nodeUrl":"https://node1.phpcoin.net",
      },
    );
    runApp(FlavorBanner(
      child:  AppPage(),
    ));

    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  });
}
