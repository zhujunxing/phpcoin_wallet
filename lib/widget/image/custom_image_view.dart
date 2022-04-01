import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../../res/resource.dart';
import '../../res/style.dart';



///自定义图片
class CustomImageView extends StatelessWidget {
 final Color? bgColor;
 final  double? width;
 final  double? height;
 final String? url;
 final  double? radius;
 final BorderRadius? borderRadius;
 final  BoxFit? fit;
 final  bool? cache;
 final  BoxShape? boxShape;
const  CustomImageView(this.url,
      {Key? key, this.width,
        this.height,
        this.bgColor,
        this.radius,
        this.borderRadius,this.fit,this.cache,this.boxShape}) : super(key: key);

  @override
  Widget build(BuildContext context) {

         double size=0;
         if(width!=null&&width!>0&&height!=null&&height!>0){

         }else{
           size=0;
         }

    return url!.isNotEmpty?ExtendedImage.network(
      "$url",
      width: width,
      height:height,
      fit:fit??BoxFit.cover,
      shape: boxShape??BoxShape.rectangle,
      cache:cache??true,
      cacheWidth: size>0?int.parse((width! * 2).toStringAsFixed(0)):null,
      cacheHeight: size>0?int.parse((height! * 2).toStringAsFixed(0)):null,
      clearMemoryCacheWhenDispose:true,
      enableMemoryCache: false,
      clearMemoryCacheIfFailed: true,
      borderRadius: borderRadius ?? BorderRadius.circular(radius??0),
      loadStateChanged: (state){
        if(state.extendedImageLoadState==LoadState.completed){
          return state.completedWidget;
        }
        else if(state.extendedImageLoadState==LoadState.loading){
          return _buildLoading();
        }
        else if(state.extendedImageLoadState==LoadState.failed){
          return _buildFail();
        }
        return _buildLoading();
      },

    ):_buildLoading();
  }

 Widget _buildLoading(){
   return Column(
     crossAxisAlignment: CrossAxisAlignment.center,
     mainAxisAlignment: MainAxisAlignment.center,
     mainAxisSize: MainAxisSize.min,
     children: [
       SizedBox(
         width: Dimens.dp15,
         height: Dimens.dp15,
         child: CircularProgressIndicator(
           color: Colours.accentColor,
         ),
       ),
     ],
   );
 }
 Widget _buildFail(){
   return Container(
     alignment: Alignment.center,
     width: width,
     child: Row(
       mainAxisSize: MainAxisSize.min,
       children: [
         Image.asset(
           ImageResource.imgLoadFail,
           fit: BoxFit.contain,
           width:width,
           cacheHeight:width!=null?int.parse((width!* 3).toStringAsFixed(0)):null,
           cacheWidth:width!=null?int.parse((width!* 3).toStringAsFixed(0)):null,
         )
       ],
     ),
   );
 }


}

