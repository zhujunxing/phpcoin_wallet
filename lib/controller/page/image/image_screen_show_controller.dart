
import 'package:extended_image/extended_image.dart';

import 'package:get/get.dart';

import '../../../ui/page/image/image_screen_show_page.dart';
import '../../../utils/screen.dart';


class ImageScreenShowController extends SuperController{

  var position=0.obs;
  RxList<String> imageAr=<String>[].obs;
  ExtendedPageController? extendedPageController;
  double? width;
  ImageScreenData data;

   var opacity=0.0.obs;

  ImageScreenShowController(this.data);

  void initState(){
    position.value=data.position??0;
    imageAr.value=data.imageAr??[];
    width=Screen.width/3.toDouble();

  }


  @override
  void onInit() {
    super.onInit();



  }
  @override
  void onReady() {
    super.onReady();



  }

  @override
  void onClose() {
    super.onClose();
  }


  @override
  void onDetached() {

  }

  @override
  void onInactive() {
  }

  @override
  void onPaused() {

  }

  @override
  void onResumed() {

  }



}
