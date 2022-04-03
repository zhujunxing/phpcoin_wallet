

import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/flutter_qr_reader.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../lang/string.dart';
import '../../../res/resource.dart';
import '../../../utils/file_util.dart';
import '../../../utils/toast_util.dart';


class ScanController extends SuperController{


  QrReaderViewController? _controller;
  bool isOne=true;


  AudioPlayer? audioPlayer;
  AudioCache? audioCache;



  final ImagePicker  _picker = ImagePicker();
  var isPermission=false.obs;


  Future<bool> requestPermission() async {
    var permission = await Permission.camera.status;
    var permission1 = await Permission.storage.status;


    if (permission.isGranted && permission1.isGranted) {
      return true;
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
        Permission.storage,
      ].request();
      if (statuses[Permission.camera]!.isGranted &&
          statuses[Permission.storage]!.isGranted) {
        return true;
      } else {
        bool isOpened = await openAppSettings();
        if (isOpened) {
          ToastUtil.toast(Get.context!, Ids.openHandlePermissionTip.tr);

        } else {
          ToastUtil.toast(Get.context!, Ids.openHandlePermissionTipError.tr);
        }
        return false;
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
      init();
  }
  void init()async{
    audioCache = AudioCache();
    audioPlayer = AudioPlayer();
    isOne=true;
    isPermission.value=await requestPermission();
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    if (audioPlayer != null) {
      audioPlayer!.stop();
      audioPlayer!.release();
    }
    isOne=true;

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

  void setController(QrReaderViewController controller) {
    _controller = controller;
  }

  void openClose() {
    _controller!.setFlashlight();
  }

  void startScan() async {

    Future.delayed(const Duration(milliseconds: 500),(){
      _controller!.startCamera(onScan);
    });
  }

  void onScan(String v, List<Offset> offsets) async {


    if(isOne){
      isOne=false;
      await playSound(v);
    }

  }


  Future<void> playSound(String data) async {

    if(Platform.isIOS){
      await audioCache!.play(RawResource.scanMusic
          .substring("assets/".length - 1, RawResource.scanMusic.length));
    }else{
      String path=await FileUtil.rawToPath(RawResource.scanMusic);
      await audioPlayer!.play(path);
    }
    Get.back(result: data);
  }

  void openAlbum(BuildContext context)async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery,imageQuality: 90);
     if(pickedFile==null){
       return;
     }
    File? compressImage =await FileUtil.compressImage(pickedFile.path);
    if(compressImage==null){
      return;
    }
    String data = await FlutterQrReader.imgScan(compressImage.path);
    if(isOne){
      isOne=false;
      await playSound(data);
    }
  }

}
