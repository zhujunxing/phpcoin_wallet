import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../../res/resource.dart';
import '../../res/style.dart';


///头像图谱
class CircleAvatarImageView extends StatelessWidget {
 final Color? bgColor;
 final double? width;
 final String? url;

 final double? defaultAvatarPadding;
 final  BoxFit? fit;
 final  bool? cache;
 final bool? isCircle;
 final double? circlePadding;
 const CircleAvatarImageView(this.url,
      {Key? key, this.width,
        this.bgColor,this.defaultAvatarPadding,this.fit,this.cache,this.isCircle=false,this.circlePadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double size=0;
    if(width!=null&&width!>0){
      size=width!;
    }else{
      size=0;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        url!.isNotEmpty?ExtendedImage.network(
          '$url',
          fit:fit??BoxFit.cover,
          shape: BoxShape.circle,
          cache:cache??true,
          border: isCircle??false?Border.all(
            color: Colors.white,
            width:circlePadding??Dimens.sp2,
          ):null,
          cacheWidth: size>0?int.parse((size * 2).toStringAsFixed(0)):null,
          cacheHeight: size>0?int.parse((size * 2).toStringAsFixed(0)):null,
          clearMemoryCacheWhenDispose:true,
          enableMemoryCache: false,
          clearMemoryCacheIfFailed: true,
          loadStateChanged: (state){
            if(state.extendedImageLoadState==LoadState.completed){
              return state.completedWidget;
            }
            else if(state.extendedImageLoadState==LoadState.loading){
              return _buildLoading();
            }
            else if(state.extendedImageLoadState==LoadState.failed){
              return _buildError();
            }
            return _buildLoading();
          },
          width:width!-10,
          height:width!-10,
        ):_buildError()
      ],
    );
  }
  Widget _buildError(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            color:bgColor??Colours.loadingColor,
            shape: BoxShape.circle,
          ),
          padding:EdgeInsets.all(defaultAvatarPadding??Dimens.dp5),
          child:ImageIcon( AssetImage(ImageResource.iconAvatar),
            color: Colours.grayColor.withOpacity(0.2),),
        ),
      ],
    );
  }
  Widget _buildLoading(){
   return Container(
     color: Colours.loadingColor,
     alignment: Alignment.center,
     child: Column(
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
     ),
   );
 }
}


