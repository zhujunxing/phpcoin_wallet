

import 'package:dio/dio.dart';
import 'package:flutter_phpcoin/db/entity/wallet_entity.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../db/service/wallet_db_service.dart';
import '../../../service/node/node_service.dart';
import '../../../service/resp/node/query_balance_resp.dart';



class AssetsBItemController extends GetxController{


  Wallet wallet;
  var balance="0".obs;
  CancelToken cancelToken=CancelToken();
  AssetsBItemController(this.wallet);



  void queryBalance()async{
    QueryBalanceResp? resp=await NodeService.getInstance()!.queryBalance(wallet.walletAddress??"",wallet.walletPublicKey??"",cancelToken: cancelToken);
    if(resp==null){
      return;
    }
    if(resp.status=='ok'){
      balance.value="${double.parse(resp.data??"0")}";
    }
  }

}
