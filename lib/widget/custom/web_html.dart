import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_all/flutter_html_all.dart';

import 'package:get/get.dart';

import '../../res/colors.dart';
import '../../res/style.dart';
import '../../routes/app_pages.dart';
import '../../ui/page/image/image_screen_show_page.dart';
import '../../utils/url_util.dart';

class WebHtml extends StatefulWidget {
  final String htmlContent;
  const WebHtml({Key? key,this.htmlContent=''}) : super(key: key);

  @override
  State<WebHtml> createState() => _WebHtmlState();
}

class _WebHtmlState extends State<WebHtml> {
  @override
  Widget build(BuildContext context) {

    List<String>  imgAr=UrlUtil.getHtmlImg(widget.htmlContent);

    return  Html(
      extensions: const [
        AudioHtmlExtension(),
        VideoHtmlExtension(),
        TableHtmlExtension(),
        SvgHtmlExtension(),
      ],
      style: {
        "html": Style(
            backgroundColor: Colors.white,
            fontSize: FontSize(Dimens.sp14),
            color: Colours.grayColor,
            padding:HtmlPaddings(
              left: HtmlPadding.zero(),
              right:  HtmlPadding.zero(),
              top: HtmlPadding.zero(),
              bottom: HtmlPadding.zero(),
            ),
            alignment: Alignment.centerLeft),
        "p": Style(
          fontSize: FontSize(Dimens.sp14),
          color:Colours.grayColor,
        ),
        "a": Style(
          color: Colours.redColor,
        ),
      },
      data:widget.htmlContent,
      onLinkTap: (String? url,

          Map<String, String> attributes,element){
        Get.toNamed(Routes.web,arguments: url);
      },


    );
  }
}
