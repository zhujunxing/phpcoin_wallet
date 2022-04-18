

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpcoin/data/wallet/wallet_export_private_key_data.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/service/resp/node/query_public_key_resp.dart';
import 'package:flutter_phpcoin/utils/file_util.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

import '../../../data/wallet/wallet_create_import_data.dart';
import '../../../db/entity/wallet_entity.dart';
import '../../../db/service/wallet_db_service.dart';
import '../../../lang/string.dart';
import '../../../service/node/node_service.dart';
import '../../../utils/screen.dart';
import '../../../utils/toast_util.dart';
import '../../../widget/loading/loading_dialog.dart';
import '../app/app_controller.dart';
import '../home/assets/home_assets_have_wallet_controller.dart';
import '../home/home_assets_controller.dart';


class TransferRecordListController extends SuperController{


  @override
  void onInit() {
    super.onInit();

  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

  }


  @override
  void onDetached() {

  }

  @override
  void onInactive() {
  }

  @override
  void onPaused() {

  }

  @override
  void onResumed() {

  }




}
