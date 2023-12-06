

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../lang/string.dart';
import '../../res/colors.dart';
import '../../res/style.dart';
///刷新底部
class RefreshFooter extends StatelessWidget {
  const RefreshFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   CustomFooter(
      builder: (BuildContext context,LoadStatus? mode){
        Widget body ;
        if(mode==LoadStatus.idle){
          body =  Text("${Ids.wait.tr}${Ids.pullRefresh.tr}",style: TextStyles.normalLightText,);
        }
        else if(mode==LoadStatus.loading){
          body =  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SpinKitCircle(
                color: Colours.grayColor,
                size: Dimens.sp24,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(Dimens.sp5,0, 0, 0),
                child: Text(
                  "${Ids.loading.tr}...",
                  style: TextStyle(
                      fontSize: Dimens.sp12,
                      color: Colours.grayColor
                  ),
                ),
              ),
            ],
          );
        }
        else if(mode == LoadStatus.failed){
          body = Text("${Ids.refresh.tr}${Ids.data.tr}${Ids.failure.tr}",style: TextStyles.normalLightText);
        }
        else if(mode == LoadStatus.noMore){
          body =  Text(Ids.noData.tr,style: TextStyles.normalLightText);
        }else if(mode == LoadStatus.canLoading){
          body =  Text("${Ids.prepare.tr}${Ids.pullRefresh.tr}",style: TextStyles.normalLightText);
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







