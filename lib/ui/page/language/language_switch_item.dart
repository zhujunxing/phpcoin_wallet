import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/sp.dart';
import '../../../data/model/language/language_switch_model.dart';
import '../../../res/colors.dart';
import '../../../res/constant.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../widget/custom/divider_line.dart';




class LanguageSwitchItem extends StatelessWidget {
  final  LanguageSwitchModel item;

  const LanguageSwitchItem(this.item,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    bool isSelect=initLanguage();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
          child:Row(
            children: <Widget>[
              Expanded(child:Text("${item.title}",style: TextStyles.largeText,
              ),),
              Gaps.hGap5,
              isSelect
                  ? ImageIcon( AssetImage(ImageResource.selected),
                size: Dimens.sp20,
                color: Colours.blueColor,
              )
                  : const SizedBox(),
            ],
          ),
          height: Dimens.dp50,
        ),
        const DividerLine(),
      ],
    );
  }
  bool initLanguage() {
     bool isSelect=false;
    Map? map =MyPref.getInstance()!.read(Constant.keyLanguage);

    if (map!=null&&map.isNotEmpty) {
      LanguageSwitchModel? entity = LanguageSwitchModel.fromMap(map);
      if (entity!.languageCode == item.languageCode &&
          entity.countryCode == item.countryCode) {
        isSelect = true;
      } else {
        isSelect = false;
      }
    } else {
        String languageCode=Get.deviceLocale!.languageCode;
        String countryCode=Get.deviceLocale!.countryCode??"";
      if (item.countryCode ==countryCode && item.languageCode == languageCode) {
        isSelect = true;
      } else {
        isSelect = false;
      }
    }
    return isSelect;
  }
}


