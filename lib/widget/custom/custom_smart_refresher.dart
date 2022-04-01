import 'package:flutter/material.dart';

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
  final ScrollController pageScrollController;

  final bool isCustomHeader;

 const  CustomSmartRefresher(
      {Key? key,
      required this.pageScrollController,
      required this.refreshController,
      required this.child,
      this.enablePullDown = true,
      this.enablePullUp = true,
      this.isCustomHeader = false,
        this.onRefresh,
        this.onLoading,
      }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      key: key,
      header:  isCustomHeader==true?const RefreshDotHeader():const RefreshHeader(),
      footer: const RefreshFooter(),
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      scrollController: pageScrollController,
      primary: false,
      controller: refreshController,
      onRefresh:onRefresh,
      onLoading: onLoading,
      child: child,
    );
  }
}
