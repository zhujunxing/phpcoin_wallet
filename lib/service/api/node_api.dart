import 'package:flutter_phpcoin/service/base_api.dart';

class NodeApi{

  //查询节点信息
  static String queryNodeInfo=BaseApi.baseNodeUrl+"/api.php?q=nodeInfo";
}