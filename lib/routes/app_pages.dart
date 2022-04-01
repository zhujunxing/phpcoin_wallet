
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../ui/page/home/home_page.dart';
import '../ui/page/image/image_screen_show_page.dart';
import '../ui/page/web/web_page.dart';



part 'app_routes.dart';

class AppPages {
  static const install = Routes.root;

  static final routes = [
    GetPage(
        name:install,
        page:()=>  HomePage(),
    ),


    GetPage(
      name: Routes.home,
      page:()=>  HomePage(),
    ),




    GetPage(
      name: Routes.web,
      page:()=>  WebPage(Get.arguments),
    ),

    GetPage(
      name: Routes.imageScreenShow,
      page:()=>  ImageScreenShowPage(Get.arguments),
      transition: Transition.fade,
    ),



  ];
}



