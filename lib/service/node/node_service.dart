
import 'package:dio/dio.dart';
import 'package:flutter_phpcoin/controller/page/app/app_controller.dart';
import 'package:flutter_phpcoin/service/api/node_api.dart';

import '../../utils/dio_util.dart';
import '../resp/node/query_node_info_resp.dart';

class NodeService {
  static  NodeService? _service;

  static NodeService? getInstance() {
     if(_service==null){
       return _service= NodeService();
     }else{
       return _service;
     }

  }

  ///用户设置-查询用户设置信息
  Future<QueryNodeInfoResp?> queryNodeInfo({CancelToken? cancelToken,Function? successCallBack,Function? errorCallBack}) async {
    var  requestData = {

    };

    dynamic result=await HttpUtil.getInstance()!.post(NodeApi.queryNodeInfo,(data) {
      if(successCallBack!=null){
        successCallBack(data);
      }
    },
        cancelToken: cancelToken,
        data: requestData,
        errorCallBack: (error) {
          if(errorCallBack!=null){
            errorCallBack(error);
          }
        });

    if(result!=null){
      QueryNodeInfoResp? resp;
      try{
        resp=QueryNodeInfoResp.fromMap(result);
      }catch(e){
        print("e:${e}");
      }
      return resp;
    }else{
      return null;
    }
  }

}
