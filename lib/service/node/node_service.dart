
import 'package:dio/dio.dart';
import 'package:flutter_phpcoin/controller/page/app/app_controller.dart';
import 'package:flutter_phpcoin/service/api/node_api.dart';
import 'package:flutter_phpcoin/service/resp/node/create_wallet_resp.dart';

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

  ///查询节点信息
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
      QueryNodeInfoResp? resp=QueryNodeInfoResp.fromMap(result);

      return resp;
    }else{
      return null;
    }
  }



  //创建钱包
  Future<CreateWalletResp?> createWallet({CancelToken? cancelToken,Function? successCallBack,Function? errorCallBack}) async {
    var  requestData = {

    };

    dynamic result=await HttpUtil.getInstance()!.post(NodeApi.generateAccount,(data) {
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
      CreateWalletResp? resp=CreateWalletResp.fromMap(result);

      return resp;
    }else{
      return null;
    }
  }

}
