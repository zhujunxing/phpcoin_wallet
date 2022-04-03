

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qr_reader/flutter_qr_reader.dart';


import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../controller/page/scan/scan_controller.dart';
import '../../../lang/string.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../widget/bar/app_bar.dart';




// ignore: must_be_immutable
class ScanPage extends StatelessWidget {

  late ScanController controller=Get.put(ScanController());
   ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Stack(
        children: <Widget>[
          Obx((){
            return controller.isPermission.value?Align(
                alignment: Alignment.center,
                child:QrReaderView(
                  autoFocusIntervalInMs: 3000,
                  width: Screen.width,
                  height:Screen.height,
                  torchEnabled: true,
                  callback: (container) {

                    start(container);
                  },
                )):const SizedBox();
          }),
          Align(
            alignment: Alignment.topCenter,
            child:BaseAppBar(
              leading: Container(),
              systemOverlayStyle: SystemUiOverlayStyle.light,
              bgColor: Colors.transparent,
              centerWidget:Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(Dimens.dp8),
                      width: Dimens.dp40,
                      height:  Dimens.dp40,
                      child: Image.asset(ImageResource.back, width: Dimens.dp14, height: Dimens.dp14,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  Gaps.wGap60,
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(Dimens.dp8),
                      width: Dimens.dp40,
                      height:  Dimens.dp40,
                      child: ImageIcon(AssetImage(ImageResource.whiteFlash),size:  Dimens.sp14, color: Colors.white,),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    onTap: () {
                       controller.openClose();
                    },
                  ),
                  Gaps.wGap60,
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(Dimens.dp8),
                      width: Dimens.dp40,
                      height:  Dimens.dp40,
                      alignment: Alignment.center,
                      child: ImageIcon(AssetImage(ImageResource.album),size: Dimens.sp18, color: Colors.white,),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    onTap: () {
                      controller.openAlbum(context);

                    },
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0,Screen.bottomBarHeight+Dimens.dp50),
              padding: EdgeInsets.fromLTRB(Dimens.dp5, Dimens.dp2, Dimens.dp5, Dimens.dp2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(Ids.scanTip1.tr, style: TextStyles.normalWhiteText,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }


  void start(QrReaderViewController container)async{
    controller.setController(container);

    controller.startScan();
  }




}





