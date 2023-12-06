
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/ui/page/home/assets/home_assets_no_wallet.dart';
import 'package:get/get.dart';

import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../controller/page/home/home_assets_controller.dart';
import '../../../res/colors.dart';
import '../../../widget/bar/app_bar.dart';
import 'assets/home_assets_have_wallet.dart';


//资产
// ignore: must_be_immutable
class HomeAssetsPage extends StatefulWidget {

  HomeAssetsPage({Key? key}) : super(key: key);

  @override
  State<HomeAssetsPage> createState() => _HomeAssetsPageState();
}

class _HomeAssetsPageState extends State<HomeAssetsPage> {
  late HomeAssetsController controller=Get.find();

  @override
  Widget build(BuildContext context) {


    return Obx((){
      return controller.isHaveWallet.value? HomeAssetsHaveWallet():const HomeAssetsNoWallet();
    });
  }
}




