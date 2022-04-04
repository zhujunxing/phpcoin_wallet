import 'package:flutter_phpcoin/service/base_api.dart';

class NodeApi{

  //查询节点信息
  static String queryNodeInfo=BaseApi.baseNodeUrl+"/api.php?q=nodeInfo";

  //创建钱包
  static String generateAccount=BaseApi.baseNodeUrl+"/api.php?q=generateAccount";
}