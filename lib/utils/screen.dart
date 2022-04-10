/*
 * @author wyp
 * @create 21-03-28
 * @desc 获取手机屏幕宽高 及 底部 顶部安全高度
 */
import 'dart:async';
import 'dart:ui' as ui show window;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/utils/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

import 'package:image_gallery_saver/image_gallery_saver.dart';
class Screen {
  ///默认设计稿尺寸（单位 dp or pt）
  static  double designW = 360.0;
  static   double designH = 690.0;
  double designD = 3.0;

  /// 配置设计稿尺寸 屏幕 宽，高，密度。
  /// Configuration design draft size  screen width, height, density.
  void setDesignWHD(double? w, double? h, {double? density = 3.0}) {
    designW = w ?? designW;
    designH = h ?? designH;
    designD = density ?? designD;
  }
  static double get width {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.width;
  }

  static double get height {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.height;
  }

  static double get scale {

    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.devicePixelRatio;
  }

  static double get textScaleFactor {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.textScaleFactor;
  }

  static double get statusBarHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top;
  }
  static double get appBarHeight {
    return kToolbarHeight;
  }


  static double get bottomBarHeight {

    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.bottom;
  }

  static updateStatusBarStyle(SystemUiOverlayStyle style) {
    SystemChrome.setSystemUIOverlayStyle(style);
  }

  static scrollTitleBackBarHeight() {
    return 50.w;
  }

  static commonTitleBarHeight() {
    return 50.w;
  }

  static appbarBottomHeight() {
    return 40.w;
  }
  /// 当前屏幕 宽
  static double getScreenW(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.width;
  }

  /// screen height
  /// 当前屏幕 高
  static double getScreenH(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.height;
  }
  /// 仅支持纵屏。
  /// returns the size after adaptation according to the screen height.(unit dp or pt)
  /// 返回根据屏幕高适配后尺寸 （单位 dp or pt）
  /// size unit dp or pt
  static double getScaleH(BuildContext context, double size) {
    if (getScreenH(context) == 0.0) return size;
    return size * getScreenH(context) / designH;
  }

  /// 仅支持纵屏。
  /// returns the font size after adaptation according to the screen density.
  /// 返回根据屏幕宽适配后字体尺寸
  /// fontSize 字体尺寸
  static double getScaleSp(BuildContext context, double fontSize) {
    if (getScreenW(context) == 0.0) return fontSize;
    return fontSize * getScreenW(context) / designW;
  }

  /// Orientation
  /// 设备方向(portrait, landscape)
  static Orientation getOrientation(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.orientation;
  }


  static double aspectRatio(double  width,double height) {
    if (width == 0 ||height == 0) {
      return 1.0;
    }
    final double aspectRatio=width/ height;
    if (aspectRatio <= 0) {
      return 1.0;
    }
    if (aspectRatio <= 0) {
      return 1.0;
    }
    return aspectRatio;
  }
  static Future<dynamic> saveScreen(GlobalKey rootWidgetKey,BuildContext context) async {

    RenderRepaintBoundary boundary = rootWidgetKey.currentContext
        !.findRenderObject() as RenderRepaintBoundary;

    ui.Image image = await boundary.toImage(pixelRatio: 3);


      ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
      dynamic result = await ImageGallerySaver.saveImage(
          byteData!.buffer.asUint8List(),
          quality: 100);

      return result;


  }
}
