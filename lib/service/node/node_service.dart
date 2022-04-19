
import 'package:dio/dio.dart';
import 'package:flutter_phpcoin/controller/page/app/app_controller.dart';
import 'package:flutter_phpcoin/service/api/node_api.dart';
import 'package:flutter_phpcoin/service/resp/node/create_wallet_resp.dart';
import 'package:flutter_phpcoin/service/resp/node/query_balance_resp.dart';
import 'package:flutter_phpcoin/service/resp/node/query_public_key_resp.dart';

import '../../utils/dio_util.dart';
import '../resp/node/query_node_info_resp.dart';
import '../resp/node/send_balance_resp.dart';

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



  //查询公钥
  Future<QueryPublicKeyResp?> queryPublicKey(String address,{CancelToken? cancelToken,Function? successCallBack,Function? errorCallBack}) async {
    var  requestData = {
      "address":address,
    };

    dynamic result=await HttpUtil.getInstance()!.post(NodeApi.queryPublicKey,(data) {
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
      QueryPublicKeyResp? resp=QueryPublicKeyResp.fromMap(result);

      return resp;
    }else{
      return null;
    }
  }




  //查询查询余额
  Future<QueryBalanceResp?> queryBalance(String address,String publicKey,{CancelToken? cancelToken,Function? successCallBack,Function? errorCallBack}) async {
    var  requestData = {
      "address":address,
      "publicKey":publicKey,
    };

    dynamic result=await HttpUtil.getInstance()!.post(NodeApi.queryBalance,(data) {
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
      QueryBalanceResp? resp=QueryBalanceResp.fromMap(result);

      return resp;
    }else{
      return null;
    }
  }




  //发送余额
  Future<SendBalanceResp?> sendBalance({CancelToken? cancelToken,Function? successCallBack,Function? errorCallBack,
    String? val,String? dst,String? publicKey,
    String? signature,String? date,String? message,
    String?  type,
    String? fee,
  }) async {
    var  requestData = {
      "val":val,
      "dst":dst,
      "public_key":publicKey,
      "signature":signature,
      "date":date,
      "message":message,
      "type":type,
      "fee":fee,
    };
    print(requestData.toString());

    dynamic result=await HttpUtil.getInstance()!.post(NodeApi.sendBalance,(data) {
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
      SendBalanceResp? resp=SendBalanceResp.fromMap(result);
      return resp;
    }else{
      return null;
    }

  }

}







