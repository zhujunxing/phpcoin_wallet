
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/page/language/language_switch_controller.dart';
import '../../../data/model/language/language_switch_model.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../widget/bar/app_bar.dart';
import 'language_switch_item.dart';

// ignore: must_be_immutable
class LanguageSwitchPage extends StatelessWidget {
  late LanguageSwitchController controller;
   LanguageSwitchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller=Get.put(LanguageSwitchController());
    return Scaffold(
        backgroundColor: Colours.bgColor,
        appBar:BaseAppBar(
          bgColor: Colours.bgColor,
          title: Ids.languageSwitch.tr,
        ),
        body:Obx((){
          return ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(0),
            itemBuilder: (BuildContext context, int i) {
              LanguageSwitchModel data=controller.languageAr.toList()[i];
              return Material(
                color: Colors.white,
                child: InkWell(
                  child:LanguageSwitchItem(data),
                  onTap: (){
                    controller.switchLanguage(data);
                  },
                ),
              );
            },
            shrinkWrap: true,
            itemCount: controller.languageAr.length,
          );
        })
    );
  }
}



