

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';



import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

import '../lang/string.dart';
import 'toast_util.dart';
class UrlUtil {

  //打开
  static launchURL(String url, BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ToastUtil.toast(context,Ids.noOpenBrowser.tr);
      throw 'Could not launch $url';
    }
  }
  //打开电话
  static openPhone(String phone, BuildContext context) async {
    if(phone==''){
      return;
    }
    phone="tel:$phone";
    try{
      await launch(phone);
    }catch(e){
      throw 'Could not launch $phone';
    }

  }

  static htmlToText(String html) {
    RegExp regExp=RegExp("<[^>]+>");

    return html.replaceAll(regExp,"");
  }

  static bool isNetUrl(String url) {
    bool result = false;
    if (url.toLowerCase().startsWith("http") || url.toLowerCase().startsWith("rtsp") || url.toLowerCase().startsWith("mms")) {
      result = true;
    }
    return result;
  }
  //获取图片集合
  static List<String> getHtmlImg(String htmlContent){
    List<String> imgAr=[];
    if(htmlContent.isNotEmpty){
      Document  document=parse(htmlContent);
      var elementsByTagName = document.getElementsByTagName("img");
       if(elementsByTagName.isNotEmpty){
         for(int i=0;i<elementsByTagName.length;i++){
           String? img=elementsByTagName[i].attributes['src'];
           if(img!=null){
             imgAr.add(img);
           }

         }
       }
    }
    return imgAr;
  }



}
