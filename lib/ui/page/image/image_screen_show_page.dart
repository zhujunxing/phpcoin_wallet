import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/utils/dio_util.dart';
import 'package:get/get.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

import '../../../controller/page/image/image_screen_show_controller.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/screen.dart';
import '../../../utils/toast_util.dart';
import '../../../utils/url_util.dart';
import '../../../widget/bar/app_bar.dart';
import '../../../widget/image/hero.dart';
import '../../dialog/select_bottom_dialog.dart';


// ignore: must_be_immutable
class ImageScreenShowPage extends StatefulWidget {

 final ImageScreenData data;

   const ImageScreenShowPage(this.data,{Key? key}) : super(key: key);

 static to(BuildContext context,ImageScreenData data){
   Navigator.of(context).push(FadeRoute(
       page: ImageScreenShowPage(data)));
   }

  @override
  State<ImageScreenShowPage> createState() => _ImageScreenShowPageState();
}

class _ImageScreenShowPageState extends State<ImageScreenShowPage> {
 late ImageScreenShowController controller=ImageScreenShowController(widget.data);

 final GlobalKey<ExtendedImageSlidePageState> slidePageKey =
 GlobalKey<ExtendedImageSlidePageState>();

 @override
  Widget build(BuildContext context) {
   controller=ImageScreenShowController(widget.data);
   controller.initState();

    return  Material(
      color: Colors.transparent,
      child: ExtendedImageSlidePage(
        key: slidePageKey,
        slideAxis: SlideAxis.both,
        slideType: SlideType.onlyImage,
        slidePageBackgroundHandler: (Offset offset, Size pageSize) {

          controller.opacity.value = offset.distance /
              (Offset(pageSize.width, pageSize.height).distance / 2.0);

          return Colors.transparent;
        },
        onSlidingPage: (state) {
          ///you can change other widgets' state on page as you want
          ///base on offset/isSliding etc
          //var offset= state.offset;
          // var showSwiper = !state.isSliding;
        },
        child:Stack(
          children: <Widget>[
            Positioned.fill(child: Obx((){
              return Container(
                width: Screen.width,
                height: Screen.height,
                color:Colors.black.withOpacity(min(1.0, max(1.0 - controller.opacity.value, 0.0))),
              );
            })),
            Align(
              child: ExtendedImageGesturePageView.builder(
                itemBuilder: (BuildContext context, int index) {
                  var item = controller.imageAr[index];
                  bool isNet=UrlUtil.isNetUrl(item);
                  Widget image;
                  if(isNet){
                    image = ExtendedImage.network(
                      item,
                       fit: BoxFit.contain,
                       mode: ExtendedImageMode.gesture,
                       enableSlideOutPage: true,
                       clearMemoryCacheWhenDispose:true,
                       enableMemoryCache: false,
                       loadStateChanged: (state){
                        return getImage(state);
                        },
                    );
                  }else{

                    File data=File(item);
                    image = ExtendedImage.file(
                      data,
                      fit: BoxFit.contain,
                      mode: ExtendedImageMode.gesture,
                      enableSlideOutPage: true,
                      clearMemoryCacheWhenDispose:true,
                      enableMemoryCache: false,
                      loadStateChanged: (state){
                        return getImage(state);
                      },
                      // loadStateChanged: (state){
                      //
                      //   return getImage(state);
                      // },
                    );
                  }

                  image = Container(
                    child: image,
                    padding: EdgeInsets.fromLTRB(0,Dimens.dp5,0,Dimens.dp5),
                  );

                  if (index ==controller.position.value) {
                    return GestureDetector(
                      child: HeroWidget(
                        child: image,
                        tag: item + index.toString(),
                        slideType: SlideType.onlyImage,
                        slidePageKey: slidePageKey,
                      ),
                      onTap: () {
                        slidePageKey.currentState!.popPage();
                        Get.back();
                      },
                    );
                  } else {
                    return image;
                  }
                },
                itemCount:controller.imageAr.length,
                onPageChanged: (int index) {
                  controller.position.value=index;

                },
                controller:controller.extendedPageController=ExtendedPageController(initialPage: controller.position.value),
                scrollDirection: Axis.horizontal,

              ),
              alignment: Alignment.center,
            ),
            controller.imageAr.isNotEmpty&&controller.imageAr.length>1?Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.fromLTRB(Dimens.dp15, Dimens.dp5,Dimens.dp15,Dimens.dp5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(Dimens.sp4),
                  ),
                  margin: EdgeInsets.fromLTRB(Dimens.dp15, 0,0,Dimens.dp20+Screen.bottomBarHeight),
                  child: Obx((){
                    return Text(
                      "${controller.position.value+1}  /  ${controller.imageAr.length}",
                      style: TextStyle(
                        fontSize: Dimens.sp14,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    );
                  }),
                )
            ):const SizedBox(),
            Align(
              alignment: Alignment.topCenter,
              child: BaseAppBar(
                bgColor:Colors.transparent,
                backBtColor: Colors.white,
                systemOverlayStyle: SystemUiOverlayStyle.light,
                actions: [
                  IconButton(onPressed: (){
                    if(controller.imageAr.isEmpty){
                      return;
                    }
                    List<String> ar=["${Ids.save.tr}${Ids.originImage.tr}"];
                    Get.bottomSheet(SelectBottomDialog(ar,selectCallback: (index){
                      if(index==0){
                        saveImageToPhoto(context,controller.imageAr.toList().elementAt(controller.position.value));
                      }
                    },),backgroundColor: Colors.transparent);
                  },
                      icon:ImageIcon( AssetImage(ImageResource.moreV),color: Colors.white,size: Dimens.sp24,))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 Widget getImage(ExtendedImageState state){
   if(state.extendedImageLoadState==LoadState.completed){
     return state.completedWidget;
   }
   else if(state.extendedImageLoadState==LoadState.loading){
     return Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
       mainAxisSize: MainAxisSize.min,
       children: [
         SizedBox(
           width: Dimens.dp15,
           height: Dimens.dp15,
           child: CircularProgressIndicator(
             color: Colours.loadingColor,
           ),
         ),
       ],
     );
   }
   else if(state.extendedImageLoadState==LoadState.failed){
     return Container(
       alignment: Alignment.center,
       child: Row(
         mainAxisSize: MainAxisSize.min,
         children: [
           Image.asset(
             ImageResource.imgLoadFail,
             fit: BoxFit.contain,
             width:controller.width,
             cacheHeight: controller.width!=null?int.parse((controller.width!* 3).toStringAsFixed(0)):null,
             cacheWidth: controller.width!=null?int.parse((controller.width!* 3).toStringAsFixed(0)):null,
           )
         ],
       ),
     );
   }
   return Column(
     crossAxisAlignment: CrossAxisAlignment.center,
     mainAxisAlignment: MainAxisAlignment.center,
     mainAxisSize: MainAxisSize.min,
     children: [
       SizedBox(
         width: Dimens.dp15,
         height: Dimens.dp15,
         child: CircularProgressIndicator(
           color: Colours.loadingColor,
         ),
       ),
     ],
   );
 }

 void   saveImageToPhoto(BuildContext context,String url)async{

   bool isPermission=await requestPermission(context);
   if(isPermission){
     if(UrlUtil.isNetUrl(url)){

       String imgPath='${(await getTemporaryDirectory()).path}${Uuid()}.png';
      Response response=await HttpUtil.getInstance()?.downFile(url,(response){




      },savePath: imgPath);
      if(response.isOk){
        var saveFile =await ImageGallerySaver.saveFile(imgPath);

        if(saveFile['isSuccess']){
          ToastUtil.toast(context,"${Ids.save.tr}${Ids.image.tr}${Ids.success.tr}");
        }else{
          ToastUtil.toast(context,"${Ids.save.tr}${Ids.image.tr}${Ids.failure.tr}");
        }
      }else{
        ToastUtil.toast(context,"${Ids.save.tr}${Ids.image.tr}${Ids.failure.tr}");
      }


     }else{
       var saveFile =await ImageGallerySaver.saveFile(url);
       if(saveFile['isSuccess']){
         ToastUtil.toast(context,"${Ids.save.tr}${Ids.image.tr}${Ids.success.tr}");
       }else{
         ToastUtil.toast(context,"${Ids.save.tr}${Ids.image.tr}${Ids.failure.tr}");
       }
     }
   }

 }

 Future<bool> requestPermission(BuildContext context) async {
   var permission = await Permission.storage.status;
   if(permission.isGranted){
     return true;
   }else{
     Map<Permission, PermissionStatus> statuses = await [
       Permission.storage,
     ].request();
     if(statuses[Permission.storage]!.isGranted){
       return true;
     }else{
       bool isOpened = await openAppSettings();
       if (isOpened) {
         ToastUtil.toast(context,Ids.openHandlePermissionTip.tr);
       } else {
         ToastUtil.toast(context,Ids.openHandlePermissionTipError.tr);
       }
     }

   }
   return false;

 }
}


class ImageScreenData{

  List<String>? imageAr;
  int? position;
  ImageScreenData(this.imageAr,{this.position});
}

