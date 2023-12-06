import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/sp.dart';
import '../../../data/model/language/language_switch_model.dart';
import '../../../res/colors.dart';
import '../../../res/constant.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../widget/custom/divider_line.dart';




class LanguageSwitchItem extends StatefulWidget {
  final  LanguageSwitchModel item;

  const LanguageSwitchItem(this.item,{Key? key}) : super(key: key);

  @override
  State<LanguageSwitchItem> createState() => _LanguageSwitchItemState();
}

class _LanguageSwitchItemState extends State<LanguageSwitchItem> {
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
              Expanded(child:Text("${widget.item.title}",style: TextStyles.largeText,
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
      if (entity!.languageCode == widget.item.languageCode &&
          entity.countryCode == widget.item.countryCode) {
        isSelect = true;
      } else {
        isSelect = false;
      }
    } else {
        String languageCode=Get.deviceLocale!.languageCode;
        String countryCode=Get.deviceLocale!.countryCode??"";
      if (widget.item.countryCode ==countryCode && widget.item.languageCode == languageCode) {
        isSelect = true;
      } else {
        isSelect = false;
      }
    }
    return isSelect;
  }
}


