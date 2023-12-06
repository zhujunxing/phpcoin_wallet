
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_phpcoin/utils/url_util.dart';

import 'package:get/get.dart';



import '../../../controller/page/about/about_app_controller.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../widget/bar/app_bar.dart';
import '../../../widget/custom/divider_line.dart';
import '../../../widget/custom/join_right.dart';

// ignore: must_be_immutable
class AboutAppPage extends StatefulWidget {

   AboutAppPage({Key? key}) : super(key: key);

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  late AboutAppController controller;
  @override
  void initState() {

    super.initState();
    controller=Get.put(AboutAppController());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colours.bgColor,
        appBar:BaseAppBar(
          bgColor: Colors.white,
          title:Ids.aboutApp.tr,

        ),
        body:CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Gaps.hGap15,
            ),
            SliverToBoxAdapter(
              child:Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width:Dimens.dp60,
                      height: Dimens.dp60,
                      decoration:  BoxDecoration(
                        image:   DecorationImage(
                          image: AssetImage(ImageResource.iconRound),
                          fit: BoxFit.cover,
                        ),
                        borderRadius:BorderRadius.all(Radius.circular(Dimens.dp10),
                        ),
                      ),
                    )
                  ],
                ),
                alignment: Alignment.center,
              ),
            ),
            SliverToBoxAdapter(
              child: Gaps.hGap15,
            ),
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                child:Obx((){
                  return Text(
                      "For ${controller.operation.value} v${controller.version.value} build ${controller.build.value}",
                      style: TextStyles.normalLightText);
                })
              ),
            ),
            SliverToBoxAdapter(
              child: Gaps.hGap20,
            ),
            SliverToBoxAdapter(
              child: Material(
                child: InkWell(
                  child: Container(
                    height: Dimens.dp50,
                    padding: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: Text(Ids.officialWebsite.tr,
                            style: TextStyles.largeText,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        Align(
                          child:  JoinRight(size:Dimens.sp12,),
                          alignment: Alignment.centerRight,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    UrlUtil.launchURL("https://phpcoin.net/", context);
                  },
                ),
                color: Colors.white,
              ),
            ),
            const SliverToBoxAdapter(
              child: DividerLine(),
            ),
            SliverToBoxAdapter(
              child: Material(
                child: InkWell(
                  child: Container(
                    height: Dimens.dp50,
                    padding: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: Text(Ids.discord.tr,
                            style: TextStyles.largeText,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        Align(
                          child:  JoinRight(size:Dimens.sp12,),
                          alignment: Alignment.centerRight,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    UrlUtil.launchURL("https://discord.com/invite/2H2YvFexQq", context);
                  },
                ),
                color: Colors.white,
              ),
            ),
            const SliverToBoxAdapter(
              child: DividerLine(),
            ),
            SliverToBoxAdapter(
              child: Material(
                child: InkWell(
                  child: Container(
                    height: Dimens.dp50,
                    padding: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15, 0),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: Text(Ids.twitter.tr,
                            style: TextStyles.largeText,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        Align(
                          child:  JoinRight(size:Dimens.sp12,),
                          alignment: Alignment.centerRight,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    UrlUtil.launchURL("https://twitter.com/phpcoin", context);
                  },
                ),
                color: Colors.white,
              ),
            ),

          ],
        ));
  }
}

