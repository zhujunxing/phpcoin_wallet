import 'dart:io';

import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:uri_to_file/uri_to_file.dart';
import 'package:uuid/uuid.dart';

import 'directory_util.dart';



class FileUtil {


  //将assets转到本地目录里面
  static Future<String> rawToPath(String assetsPath) async {

    String fileName="";
    fileName=assetsPath.substring(assetsPath.lastIndexOf("/")+1);

    final ByteData data = await rootBundle.load(assetsPath);
    Directory tempDir;
    if(Platform.isAndroid){
      tempDir=(await DirectoryUtil.createStorageDir(category:"raw"))!;
    }else{
      tempDir=(await DirectoryUtil.createStorageDir(category:"raw"))!;
    }
    File tempFile = File('${tempDir.path}/$fileName');
    bool exists=await tempFile.exists();
    if(exists){
      return tempFile.uri.toString();
    }
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);

    return tempFile.uri.toString();

  }

  static Future<XFile?> compressImage(String filePath) async {

    File oldFile=File(filePath);
    bool isExist=await oldFile.exists();
    if(!isExist){
      return XFile(oldFile.path);
    }
    String suffix="";
    CompressFormat compressFormat;
    if(oldFile.path.contains(".gif")||oldFile.path.contains(".GIF")){
      suffix=".gif";
      return XFile(oldFile.path);
    }else if(oldFile.path.contains(".png")||oldFile.path.contains(".PNG")){
      suffix=".png";
      compressFormat=CompressFormat.png;
    }else if(oldFile.path.contains(".jpg")||oldFile.path.contains(".JPG")){
      suffix=".jpg";
      compressFormat=CompressFormat.jpeg;
    }else if(oldFile.path.contains(".jpeg")||oldFile.path.contains(".JPEG")){
      suffix=".jpeg";
      compressFormat=CompressFormat.jpeg;
    }else if(oldFile.path.contains(".webp")||oldFile.path.contains(".WEBP")){
      suffix=".webp";
      compressFormat=CompressFormat.webp;
    }else if(oldFile.path.contains(".heic")||oldFile.path.contains(".HEIC")){
      suffix=".heic";
      compressFormat=CompressFormat.heic;
    }else{
      return XFile(oldFile.path);
    }
    Directory? tempDir;
    if (Platform.isIOS) {
      tempDir = await  DirectoryUtil.createTempDir( category: "picture");
    } else {
      tempDir = await DirectoryUtil.createTempDir( category: "picture");
    }

    String tempPath = tempDir!.path;
    var uuid = const Uuid();
    File f = File(tempPath +"/"+ uuid.v4() +suffix);

    XFile?   compressedFile = await FlutterImageCompress.compressAndGetFile(
        oldFile.path,
        f.path,
        format:compressFormat,
      );

   return compressedFile;
  }
  ///存储大小转换
  static sizeBytesTo(int size) {
    double kiloByte = size / 1024;
    if (kiloByte < 1) {
      return "${size.toStringAsFixed(2)}Byte";
    }

    double megaByte = kiloByte / 1024;
    if (megaByte < 1) {
      return "${kiloByte.toStringAsFixed(2)}KB";
    }

    double gigaByte = megaByte / 1024;
    if (gigaByte < 1) {
      return "${megaByte.toStringAsFixed(2)}MB";
    }

    double teraBytes = gigaByte / 1024;
    if (teraBytes < 1) {
      return "${gigaByte.toStringAsFixed(2)}GB";
    }

    return "${teraBytes.toStringAsFixed(2)}TB";
  }
  static Future<File?> convertUriToFile(String uriString) async {
    File? file;
    try {
       file = await toFile(uriString); // Converting uri to file
    }catch (e) {
      print(e); // General exception
    }
    return file;
  }

}
