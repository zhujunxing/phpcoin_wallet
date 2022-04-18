import 'package:flutter_phpcoin/service/base_api.dart';

class NodeApi{

  //查询节点信息
  static String queryNodeInfo=BaseApi.baseNodeUrl+"/api.php?q=nodeInfo";

  //创建钱包
  static String generateAccount=BaseApi.baseNodeUrl+"/api.php?q=generateAccount";
  //通过地址获取公钥
  static String queryPublicKey=BaseApi.baseNodeUrl+"/api.php?q=getPublicKey";


  //查询余额
    static String queryBalance=BaseApi.baseNodeUrl+"/api.php?q=getBalance";


  //发送余额
  static String sendBalance=BaseApi.baseNodeUrl+"/api.php?q=send";



}