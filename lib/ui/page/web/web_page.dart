
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';



import 'package:webview_flutter/webview_flutter.dart';

import '../../../controller/page/web/web_controller.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../utils/url_util.dart';
import '../../../widget/bar/app_bar.dart';
import '../../../widget/custom/back_button.dart';
import '../../../widget/loading/my_loading.dart';


// ignore: must_be_immutable
class WebPage extends StatefulWidget {
 final String url;


   const WebPage(this.url,{Key? key}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
 late WebController controller;
 late WebViewController viewController;
   @override
  void initState() {

    super.initState();
    controller=Get.put(WebController());
    viewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            controller.setProgress(progress);
          },
          onPageStarted: (String url) {
            controller.setLoadingShow(false);
          },
          onPageFinished: (String url) {

            controller.controller!.runJavaScriptReturningResult("document.title").then((value) => {
                controller.setTitle(
                    value.toString().replaceAll("""\"""", "").replaceAll(
                        """\"""", ""))
            });

          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse('${widget.url}'));


   }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Obx((){
              return BaseAppBar(
                title:controller.title.value,
                titleAlignment:Alignment.centerLeft,
                leading: BackBt(
                  onPressed: (){
                    controller.canBack(context);
                  },
                ),
                actions: [
                  IconButton(
                    icon: ImageIcon(AssetImage(ImageResource.exit),size: Dimens.sp24,),
                    onPressed: () {
                     Get.back();
                    },
                  ),
                  IconButton(
                    icon: ImageIcon(AssetImage(ImageResource.moreV),size: Dimens.sp24,),
                    onPressed: () {
                      UrlUtil.launchURL(widget.url, context);
                    },
                  ),
                ],
              );
            }),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Theme.of(context).platform == TargetPlatform.iOS
                      ? CupertinoScrollbar(child: _buildWebView())
                      : Scrollbar(child: _buildWebView()),
                    Obx((){
                      return controller.isLoading.value? Align(
                        alignment: Alignment.center,
                        child:Container(
                          color: Colors.white,
                          child: const MyLoading(),
                          alignment: Alignment.center,
                          width: Screen.width,
                          height: Screen.height,
                        ),
                      ):const SizedBox();
                    }),
                  Obx((){
                    return controller.progress.value>0&&controller.progress.value<100? Align(
                      alignment: Alignment.topCenter,
                      child:SizedBox(
                        width: Screen.width,
                        height: Dimens.dp4,
                        child:LiquidLinearProgressIndicator(
                          value: (controller.progress.value*0.01).abs(),
                          valueColor: AlwaysStoppedAnimation(Colours.accentColor),
                          backgroundColor: Colors.transparent,
                          borderColor: Colors.transparent,
                          borderWidth:0,
                          borderRadius:0,
                          direction: Axis.horizontal,
                          center:const SizedBox(),
                        ),
                      ),
                    ):const SizedBox();
                  }),

                ],
              ),
            )
          ],
        ));
  }

 Widget _buildWebView() {


   return WebViewWidget(
     controller: viewController
   );
 }
}

