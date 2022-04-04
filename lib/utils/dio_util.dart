
import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import '../config/global.dart';
import '../service/constants.dart';


class HttpUtil {
  static  HttpUtil? instance;
   late Dio dio;
  late BaseOptions options;
  late CacheStore cacheStore;
  late CacheOptions cacheOptions;
  CancelToken cancelToken = CancelToken();

  static HttpUtil? getInstance() {
    instance ??= HttpUtil();
    return instance;
  }

  /*
   * config it and create
   */
  HttpUtil() {


    //BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    options = BaseOptions(
      //请求基地址,可以包含子路径
      baseUrl:"",
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 15000,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 15000,
      //Http请求头.
      headers: {
        //do something
        "version": "1.0.0",
        "appName": "PHPCoin",
      },
      //请求的Content-Type，默认值是"application/json; charset=utf-8",Headers.formUrlEncodedContentType会自动编码请求体.
      contentType: Headers.formUrlEncodedContentType,
      //表示期望以那种格式(方式)接受响应数据。接受四种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    //Cookie管理
    dio.interceptors.add(LogInterceptor(requestBody: true,responseBody: true)); //是否开启请求日志
    dio.interceptors.add(CookieManager(CookieJar()));
    dio.interceptors.add(InterceptorsWrapper(
       onRequest: (RequestOptions options,RequestInterceptorHandler handler) {

         return handler.next(options); //必须返回，否则不往下走，与教程不同，下同
       },
      onResponse: (Response response,ResponseInterceptorHandler handler) {


        // if(response.statusCode==200){
        //   Map<String, dynamic> dataMap = json.decode(response.data!);
        //   String status=dataMap['status'];
        //
        //     // switch(code){
        //     //   // case UserStatusConstant.Login_Error:
        //     //   case UserStatusConstant.Unknown_Account:
        //     //   case UserStatusConstant.Locked_Account:
        //     //   case UserStatusConstant.Account_Close:
        //     //   case UserStatusConstant.Already_Login_Client:
        //     //   case UserStatusConstant.Token_Expired:
        //     //      EventBusUtil.getInstance().fire(UserPopLoginEvent(data:message));
        //     //      return handler.next(response); //必须返回，否则不往下走，与教程不同，下同
        //     //   default:{
        //     //     return handler.next(response); //必须返回，否则不往下走，与教程不同，下同
        //     //   }
        //     // }
        // }else{
        //   return handler.next(response); //必须返回，否则不往下走，与教程不同，下同
        // }

        return handler.next(response);

      },
      onError: (DioError e,ErrorInterceptorHandler handler) {

        return handler.next(e);

      },
    ));
  }

  /*
   * get请求
   */
  get(url, Function successCallBack,
      {data, options, cancelToken, Function? errorCallBack}) async {
    Response<String> response;
    try {
      dio.options.connectTimeout = 15000;
      dio.options.receiveTimeout = 15000;
      dio.options.contentType="application/x-www-form-urlencoded";

      response = await dio.get(url,queryParameters: data, options: options, cancelToken: cancelToken);

         if(response.data!=null){
           Map<dynamic, dynamic> dataMap = json.decode(response.data!);
           successCallBack(dataMap);
         }
      Map<dynamic, dynamic> dataMap = json.decode(response.data!);
      return dataMap;
//      response.data; 响应体
//      response.headers; 响应头
//      response.request; 请求体
//      response.statusCode; 状态码

    } on DioError catch (error) {
      // 请求错误处理
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response!;
      } else {
        errorResponse = Response(requestOptions: RequestOptions(path: ''),statusCode: ResultCode.requestError
            ,statusMessage: "网络请求失败");
      }
      // 请求超时
      if (error.type == DioErrorType.connectTimeout) {
        errorResponse.statusCode = ResultCode.connectTimeOut;
      }
      // 一般服务器错误
      else if (error.type == DioErrorType.receiveTimeout) {
        errorResponse.statusCode = ResultCode.requestError;
      }

      // debug模式才打印
      if (GlobalConfig.isDebug) {
        print('请求异常: ' + error.toString());
        print('请求异常url: ' + url);
        print('请求头: ' + dio.options.headers.toString());
//        print('method: ' + dio.options.method);
      }

      if(errorCallBack!=null){
        _error(errorCallBack, error.message);
      }

      return null;
    }
  }

  _error(Function errorCallBack, String error) {
    errorCallBack(error);
  }

  /*
   * post请求
   */
  post(url, Function successCallBack,
      {Map<dynamic,dynamic>? data, options, cancelToken, Function? errorCallBack}) async {
    Response<String> response;
    try {

      dio.options.connectTimeout = 15000;
      dio.options.receiveTimeout = 15000;
      dio.options.contentType="application/json;charset=utf-8";
     Map<String,dynamic> query={};

     if(data!.isNotEmpty){
       print("循环start");
       data.forEach((key, value) {
           query.putIfAbsent("$key", () => value);
       });

       print("循环end");
     }



      response = await dio.post(url,data: data.isNotEmpty?data:null, options: options, cancelToken: cancelToken,queryParameters: query.isNotEmpty?query:null);

      if(response.data!=null){
        Map<dynamic, dynamic> dataMap = json.decode(response.data!);
        successCallBack(dataMap);
      }else{

      }

      Map<dynamic, dynamic> dataMap = json.decode(response.data!);
      return dataMap;
//      response.data; 响应体
//      response.headers; 响应头
//      response.request; 请求体
//      response.statusCode; 状态码

    } on DioError catch (error) {
      // 请求错误处理
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response!;
      } else {
        errorResponse = Response(requestOptions: RequestOptions(path: ''),statusCode: ResultCode.requestError
            ,statusMessage: "网络请求失败");
      }
      // 请求超时
      if (error.type == DioErrorType.connectTimeout) {
        errorResponse.statusCode = ResultCode.connectTimeOut;
      }
      // 一般服务器错误
      else if (error.type == DioErrorType.receiveTimeout) {
        errorResponse.statusCode = ResultCode.requestError;
      }

      // debug模式才打印
      if (GlobalConfig.isDebug) {
        print('请求异常: ' + error.toString());
        print('请求异常url: ' + url);
        print('请求头: ' + dio.options.headers.toString());
//        print('method: ' + dio.options.method);
      }
      if(errorCallBack!=null){
        _error(errorCallBack, error.message);
      }


      return null;
    }
  }

  /*
   * post请求
   */
  postFile(url, Function successCallBack,
      {data, options, cancelToken, Function? errorCallBack,ProgressCallback? sendProgress}) async {
    Response<String> response;
    try {
      dio.options.connectTimeout = 30000;
      dio.options.receiveTimeout = 10000;
      dio.options.contentType="multipart/form-data";

      response = await dio.post(url,
          onSendProgress: sendProgress,
          data: data, options: options, cancelToken: cancelToken);

      if(response.data!=null){
        Map<String, dynamic> dataMap = json.decode(response.data!);
        successCallBack(dataMap);
      }else{

      }
      Map<String, dynamic> dataMap = json.decode(response.data!);
      return dataMap;
    } on DioError catch (error) {
      // 请求错误处理
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response!;
      } else {
        errorResponse = Response(requestOptions: RequestOptions(path: ''),statusCode: ResultCode.requestError
            ,statusMessage: "网络请求失败");
      }
      // 请求超时
      if (error.type == DioErrorType.connectTimeout) {
        errorResponse.statusCode = ResultCode.connectTimeOut;
      }
      // 一般服务器错误
      else if (error.type == DioErrorType.receiveTimeout) {
        errorResponse.statusCode = ResultCode.requestError;
      }

      // debug模式才打印
      if (GlobalConfig.isDebug) {
        print('请求异常: ' + error.toString());
        print('请求异常url: ' + url);
        print('请求头: ' + dio.options.headers.toString());
//        print('method: ' + dio.options.method);
      }

      if(errorCallBack!=null){
        _error(errorCallBack, error.message);
      }
      return null;
    }
  }


  /*
   * post请求
   */
  postMessage(url, Function successCallBack,{data, options, cancelToken, Function? errorCallBack}) async {
    Response<String> response;
    try {
      dio.options.connectTimeout = 10000;
      dio.options.receiveTimeout = 10000;
      dio.options.contentType="application/x-www-form-urlencoded";

      response = await dio.post(url,data: data, options: options, cancelToken: cancelToken);

      if(response.data!=null){
        Map<String, dynamic> dataMap = json.decode(response.data!);
        successCallBack(dataMap);
      }else{

      }
      Map<String, dynamic> dataMap = json.decode(response.data!);
      return dataMap;
    } on DioError catch (error) {
      // 请求错误处理
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response!;
      } else {
        errorResponse = Response(requestOptions: RequestOptions(path: ''),statusCode: ResultCode.requestError
            ,statusMessage: "网络请求失败");
      }
      // 请求超时
      if (error.type == DioErrorType.connectTimeout) {
        errorResponse.statusCode = ResultCode.connectTimeOut;
      }
      // 一般服务器错误
      else if (error.type == DioErrorType.receiveTimeout) {
        errorResponse.statusCode = ResultCode.requestError;
      }

      // debug模式才打印
      if (GlobalConfig.isDebug) {
        print('请求异常: ' + error.toString());
        print('请求异常url: ' + url);
        print('请求头: ' + dio.options.headers.toString());
//        print('method: ' + dio.options.method);
      }
      if(errorCallBack!=null){
        _error(errorCallBack, error.message);
      }
      return null;
    }
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}
