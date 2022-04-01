

import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../lang/string.dart';
import '../../res/colors.dart';
import '../../res/style.dart';


///刷新头部
class RefreshHeader extends StatelessWidget {
  const RefreshHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   CustomHeader(
      builder: (BuildContext context,RefreshStatus? mode){
        Widget body ;
        if(mode==RefreshStatus.idle){
          body =  Text("${Ids.wait.tr}${Ids.downRefresh.tr}}",style: TextStyles.normalLightText,);
        }
        else if(mode==RefreshStatus.refreshing){
          body =  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SpinKitCircle(
                color: Colours.grayColor,
                size: Dimens.sp24,
              ),
              Gaps.wGap5,
              Text(
                "${Ids.loading.tr}...",
                style: TextStyle(
                    fontSize: Dimens.sp12,
                    color: Colours.grayColor
                ),
              ),
            ],
          );
        }
        else if(mode == RefreshStatus.failed){
          body = Text("${Ids.refresh.tr}${Ids.data.tr}${Ids.failure.tr}",style: TextStyles.normalLightText);
        }
        else if(mode == RefreshStatus.completed){
          body =  Text("${Ids.nowNewUpdate.tr}:${formatDate(DateTime.now(), [
            HH,
            (Ids.dot.tr),
            nn,
            (Ids.branch.tr)
          ])}",style: TextStyles.normalLightText);
        }else if(mode == RefreshStatus.canRefresh){
          body =  Text("${Ids.prepare.tr}${Ids.downRefresh.tr}",style: TextStyles.normalLightText);
        }
        else{
          body = Text(Ids.refreshing.tr,style: TextStyles.normalLightText);
        }
        return SizedBox(
          height: 55.0,
          child: Center(child:body),
        );
      },
    );
  }
}

class RefreshDotHeader extends StatelessWidget {
  const RefreshDotHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   CustomHeader(
      builder: (BuildContext context,RefreshStatus? mode){
        Widget body ;
        if(mode==RefreshStatus.idle){
          body =  Text("${Ids.wait.tr}${Ids.downRefresh.tr}",style: TextStyles.normalLightText,);
        }
        else if(mode==RefreshStatus.refreshing){
          body =  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SpinKitChasingDots(
                color: Colours.accentColor,
                size: Dimens.sp24,
              ),
            ],
          );
        }
        else if(mode == RefreshStatus.failed){
          body = Text("${Ids.refresh.tr}${Ids.data.tr}${Ids.failure.tr}",style: TextStyles.normalLightText);
        }
        else if(mode == RefreshStatus.completed){
          body =  Text("${Ids.nowNewUpdate.tr}:${formatDate(DateTime.now(), [
            HH,
            (Ids.dot.tr),
            nn,
            (Ids.branch.tr)
          ])}",style: TextStyles.normalLightText);
        }else if(mode == RefreshStatus.canRefresh){
          body =  Text("${Ids.prepare.tr}${Ids.downRefresh.tr}",style: TextStyles.normalLightText);
        }
        else{
          body = Text(Ids.refreshing.tr,style: TextStyles.normalLightText);
        }
        return SizedBox(
          height: Dimens.dp55,
          child: Center(child:body),
        );
      },
    );
  }
}









