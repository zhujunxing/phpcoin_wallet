

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_create_import_data.dart';
import 'package:flutter_phpcoin/ui/dialog/input_content_dialog.dart';
import 'package:flutter_phpcoin/ui/page/wallet/wallet_select_page.dart';
import 'package:flutter_phpcoin/utils/toast_util.dart';


import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';


import '../../../controller/page/wallet/wallet_create_controller.dart';
import '../../../controller/page/wallet/wallet_create_import_controller.dart';
import '../../../controller/page/wallet/wallet_detail_controller.dart';
import '../../../controller/page/wallet/wallet_select_controller.dart';
import '../../../controller/page/wallet/wallet_watch_import_controller.dart';
import '../../../data/wallet/wallet_export_private_key_data.dart';
import '../../../db/entity/wallet_entity.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../widget/bar/app_bar.dart';
import '../../../widget/custom/back_button.dart';
import '../../../widget/custom/custom_button.dart';
import '../../../widget/custom/divider_line.dart';

///钱包导出私钥
// ignore: must_be_immutable
class WalletExportPrivateKeyPage extends StatelessWidget {
  WalletExportPrivateKeyData data;
  WalletExportPrivateKeyPage({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: BaseAppBar(
          title:Ids.backupPrivate.tr,
        ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Gaps.hGap10,),
          SliverToBoxAdapter(
            child:Container(
              decoration: BoxDecoration(
                color: Colours.redColor.withOpacity(0.1),
                borderRadius:
                  BorderRadius.circular(Dimens.sp4),
              ),
              margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15,0),
              padding: EdgeInsets.all(Dimens.dp15),
              child: Row(
                children: [
                  ImageIcon(AssetImage(ImageResource.warnExport),size: Dimens.sp24,
                  color: Colours.redColor,),
                  Gaps.wGap10,
                  Expanded(child: Text(Ids.backupPrivateTip.tr,style: TextStyle(
                    fontSize: Dimens.sp12,
                    color: Colours.redColor,
                    fontWeight: FontWeight.w500,
                  ),))
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: Gaps.hGap10,),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              child: SizedBox(
                child: QrImage(
                  data: "${data.privateKey}",
                  version: QrVersions.auto,
                  size: Dimens.dp200,
                ),
                width: Dimens.dp200,
                height: Dimens.dp200,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Gaps.hGap20,
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15,0),
              child: Row(
                children: [
                  Expanded(child: Container(
                    height: Dimens.dp05,
                    color: Colours.lineTextColor,
                  )),
                  Gaps.wGap10,
                  Text(Ids.plaintextPrivateKey.tr,style: TextStyle(
                    fontSize: Dimens.sp14,
                    color:Colours.grayColor,
                  ),),
                  Gaps.wGap10,
                  Expanded(child: Container(
                    height: Dimens.dp05,
                    color: Colours.lineTextColor,
                  )),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Gaps.hGap20,
          ),
          SliverToBoxAdapter(
            child:Container(
              decoration: BoxDecoration(
                color: Colours.blueColor.withOpacity(0.1),
                borderRadius:
                BorderRadius.circular(Dimens.sp4),
              ),
              margin: EdgeInsets.fromLTRB(Dimens.dp15, 0, Dimens.dp15,0),
              padding: EdgeInsets.all(Dimens.dp15),
              child: Text("${data.privateKey}",style: TextStyle(
                fontSize: Dimens.sp14,
                color: Colours.defaultTextColor.withOpacity(0.85),
              ),),
              alignment: Alignment.center,
            ),
          ),
          SliverToBoxAdapter(
            child: Gaps.hGap20,
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(Ids.copyPrivate.tr,
                    width: Dimens.dp220,
                    onPressed: (){
                      Clipboard.setData(ClipboardData(text:'${data.privateKey}'));
                      ToastUtil.toast(context, "${data.privateKey}${Ids.alreadyCopy.tr}");
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

