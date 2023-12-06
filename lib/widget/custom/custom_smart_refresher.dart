import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/res/colors.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../refresh/footer.dart';
import '../refresh/header.dart';

///自定义下拉刷新
class CustomSmartRefresher extends StatelessWidget {

  final RefreshController refreshController;
  final Widget child;
  final bool enablePullDown,enablePullUp;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoading;
   ScrollController? pageScrollController;

  final bool isCustomHeader;

   CustomSmartRefresher(
      {
      required this.refreshController,
      required this.child,
      this.enablePullDown = true,
      this.enablePullUp = true,
      this.isCustomHeader = false,
        this.onRefresh,
        this.onLoading,
         this.pageScrollController,
      });
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      key: key,
      header:isCustomHeader==false? MaterialClassicHeader(color: Colours.accentColor,):const RefreshDotHeader(),
      footer: const RefreshFooter(),
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      controller: refreshController,
      scrollController: pageScrollController,
      onRefresh:onRefresh,
      onLoading: onLoading,
      child: child,
      primary: pageScrollController!=null?false:true,
    );
  }
}
