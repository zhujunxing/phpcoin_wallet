import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../lang/string.dart';
import '../../res/colors.dart';
import '../../res/style.dart';

///更多刷新
class MoreLoading extends StatelessWidget {
  final Color? loadingColor;
  const  MoreLoading({Key? key,this.loadingColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
      height: Dimens.dp50,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitCircle(
            color: loadingColor?? Colours.grayColor,
            size: Dimens.sp24,
          ),
          Gaps.wGap5,
          Text(
            "${Ids.loading.tr}...",
            style: TextStyle(
                fontSize: Dimens.sp12,
                 color: loadingColor?? Colours.grayColor,
            ),
          )
        ],
      ),
    );
  }
}



