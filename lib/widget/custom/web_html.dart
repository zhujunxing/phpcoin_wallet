import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';

import '../../res/colors.dart';
import '../../res/style.dart';
import '../../routes/app_pages.dart';
import '../../ui/page/image/image_screen_show_page.dart';
import '../../utils/url_util.dart';

class WebHtml extends StatelessWidget {
  final String htmlContent;
  const WebHtml({Key? key,this.htmlContent=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String>  imgAr=UrlUtil.getHtmlImg(htmlContent);

    return  Html(
      style: {
        "html": Style(
            backgroundColor: Colors.white,
            fontSize: FontSize(Dimens.sp14),
            color: Colours.grayColor,
            padding:const EdgeInsets.all(0),
            alignment: Alignment.centerLeft),
        "p": Style(
          fontSize: FontSize(Dimens.sp14),
          color:Colours.grayColor,
        ),
        "a": Style(
          color: Colours.redColor,
        ),
      },
      data:htmlContent,
      onLinkTap: (String? url,
          RenderContext rc,
          Map<String, String> attributes,element){
        Get.toNamed(Routes.web,arguments: url);
      },
      onImageTap: (String? url,
          RenderContext rc,
          Map<String, String> attributes,element){

        List<String> image=imgAr;

        var indexOf = imgAr.indexOf(url!);

         int position=0;
        if(indexOf>=0){
          position=indexOf;
        }else{
          position=0;
        }
        ImageScreenShowPage.to(context, ImageScreenData(image,position: position));

      },
      customImageRenders: {
        networkSourceMatcher(): networkImageRender(
          loadingWidget: () => Center(
            child:CircularProgressIndicator(
              color: Colours.accentColor,
            ),
          ),
        ),



      },
    );
  }
}
