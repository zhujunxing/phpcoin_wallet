import 'package:flutter_phpcoin/lang/string.dart';

/// status : "ok"
/// data : {"hostname":"https://node1.phpcoin.net","version":"1.0.3","network":"mainnet-alpha","dbversion":"10","accounts":5533,"transactions":386148,"mempool":0,"masternodes":61,"peers":21,"height":179284,"block":"HazhS7mz76RxmWhP1p5ybrUrNqnkww4Rveu13PrLzS6x","time":1648905096,"generator":null,"miner":null,"masternode":null,"totalSupply":103200000,"avgBlockTime10":73.4,"avgBlockTime100":70.47,"hashRate10":1499.8,"hashRate100":1439.93,"lastBlockTime":1648905078}
/// coin : "phpcoin"
/// version : "1.0.3"
/// network : "mainnet-alpha"

class QueryNodeInfoResp {
  String? status;
  NodeInfoDataBean? data;
  String? coin;
  String? version;
  String? network;

  static QueryNodeInfoResp? fromMap(Map<String, dynamic> map) {

    QueryNodeInfoResp queryNodeInfoRespBean = QueryNodeInfoResp();
    queryNodeInfoRespBean.status = map['status'];
    if(map['data']!=null){
      queryNodeInfoRespBean.data = NodeInfoDataBean.fromMap(map['data']);
    }

    queryNodeInfoRespBean.coin = map['coin'];
    queryNodeInfoRespBean.version = map['version'];
    queryNodeInfoRespBean.network = map['network'];
    return queryNodeInfoRespBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "coin": coin,
    "version": version,
    "network": network,
  };
}

/// hostname : "https://node1.phpcoin.net"
/// version : "1.0.3"
/// network : "mainnet-alpha"
/// dbversion : "10"
/// accounts : 5533
/// transactions : 386148
/// mempool : 0
/// masternodes : 61
/// peers : 21
/// height : 179284
/// block : "HazhS7mz76RxmWhP1p5ybrUrNqnkww4Rveu13PrLzS6x"
/// time : 1648905096
/// generator : null
/// miner : null
/// masternode : null
/// totalSupply : 103200000
/// avgBlockTime10 : 73.4
/// avgBlockTime100 : 70.47
/// hashRate10 : 1499.8
/// hashRate100 : 1439.93
/// lastBlockTime : 1648905078

class NodeInfoDataBean {
  String? hostname;
  String? version;
  String? network;
  String? dbversion;
  int? accounts;
  int? transactions;
  int? mempool;
  int? masternodes;
  int? peers;
  int? height;
  String? block;
  int? time;
  dynamic generator;
  dynamic miner;
  dynamic masternode;
  double? totalSupply;
  double? avgBlockTime10;
  double? avgBlockTime100;
  double? hashRate10;
  double? hashRate100;
  int? lastBlockTime;
  double? currentSupply;
  static NodeInfoDataBean? fromMap(Map<String, dynamic> map) {

    NodeInfoDataBean dataBean = NodeInfoDataBean();
    dataBean.hostname = map['hostname'];
    dataBean.version = map['version'];
    dataBean.network = map['network'];
    dataBean.dbversion = map['dbversion'];
    dataBean.accounts = map['accounts'];
    dataBean.transactions = map['transactions'];
    dataBean.mempool = map['mempool'];
    dataBean.masternodes = map['masternodes'];
    dataBean.peers = map['peers'];
    dataBean.height = map['height'];
    dataBean.block = map['block'];
    dataBean.time = map['time'];
    dataBean.generator = map['generator'];
    dataBean.miner = map['miner'];
    dataBean.masternode = map['masternode'];
    dataBean.totalSupply = double.parse(map['totalSupply'].toString());
    dataBean.avgBlockTime10 =double.parse(map['avgBlockTime10'].toString());
    dataBean.avgBlockTime100 = double.parse(map['avgBlockTime100'].toString());
    dataBean.hashRate10 = double.parse(map['hashRate10'].toString());
    dataBean.hashRate100 = double.parse(map['hashRate100'].toString());
    dataBean.lastBlockTime = map['lastBlockTime'];
    dataBean.currentSupply=double.parse(map['currentSupply'].toString());
    return dataBean;
  }

  Map toJson() => {
    "hostname": hostname,
    "version": version,
    "network": network,
    "dbversion": dbversion,
    "accounts": accounts,
    "transactions": transactions,
    "mempool": mempool,
    "masternodes": masternodes,
    "peers": peers,
    "height": height,
    "block": block,
    "time": time,
    "generator": generator,
    "miner": miner,
    "masternode": masternode,
    "totalSupply": totalSupply,
    "avgBlockTime10": avgBlockTime10,
    "avgBlockTime100": avgBlockTime100,
    "hashRate10": hashRate10,
    "hashRate100": hashRate100,
    "lastBlockTime": lastBlockTime,
  };
}