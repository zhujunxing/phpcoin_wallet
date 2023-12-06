/// status : "ok"
/// data : "0.00000000"
/// coin : "phpcoin"
/// version : "1.0.3"
/// network : "mainnet-alpha"

class QueryBalanceResp {
  String? status;
  String? data;
  String? coin;
  String? version;
  String? network;

  static QueryBalanceResp fromMap(Map<String, dynamic> map) {

    QueryBalanceResp queryBalanceRespBean = QueryBalanceResp();
    queryBalanceRespBean.status = map['status'];
    queryBalanceRespBean.data = map['data'];
    queryBalanceRespBean.coin = map['coin'];
    queryBalanceRespBean.version = map['version'];
    queryBalanceRespBean.network = map['network'];
    return queryBalanceRespBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "coin": coin,
    "version": version,
    "network": network,
  };
}