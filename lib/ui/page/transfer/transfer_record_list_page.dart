

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_create_import_data.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/ui/dialog/input_content_dialog.dart';
import 'package:flutter_phpcoin/ui/dialog/sure_is_dialog.dart';
import 'package:flutter_phpcoin/ui/page/wallet/wallet_select_page.dart';
import 'package:flutter_phpcoin/utils/toast_util.dart';


import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';


import '../../../controller/page/transfer/transfer_receive_erwei_controller.dart';
import '../../../controller/page/transfer/transfer_record_list_controller.dart';
import '../../../controller/page/wallet/wallet_create_controller.dart';
import '../../../controller/page/wallet/wallet_create_import_controller.dart';
import '../../../controller/page/wallet/wallet_detail_controller.dart';
import '../../../controller/page/wallet/wallet_select_controller.dart';
import '../../../controller/page/wallet/wallet_watch_import_controller.dart';
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

///转账交易-交易列表
// ignore: must_be_immutable
class TransferRecordListPage extends StatelessWidget {
   TransferRecordListController controller=TransferRecordListController();


   TransferRecordListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [

          ],
        )
    );
  }

}

