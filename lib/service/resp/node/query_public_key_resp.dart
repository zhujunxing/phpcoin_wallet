/// status : "ok"
/// data : "PZ8Tyr4Nx8MHsRAGMpZmZ6TWY63dXWSCy1Y17B9sUHULhM44j9LK4zwbzhxaQv921Ycr13DJgDV3DfpBQtWF1d7r9CnLWcEr2QAqRasA2iaqqcvXUBLE84PX"
/// coin : "phpcoin"
/// version : "1.0.3"
/// network : "mainnet-alpha"

class QueryPublicKeyResp {
  String? status;
  String? data;
  String? coin;
  String? version;
  String? network;

  static QueryPublicKeyResp fromMap(Map<String, dynamic> map) {
    QueryPublicKeyResp queryPublicKeyRespBean = QueryPublicKeyResp();
    queryPublicKeyRespBean.status = map['status'];
    queryPublicKeyRespBean.data = map['data'];
    queryPublicKeyRespBean.coin = map['coin'];
    queryPublicKeyRespBean.version = map['version'];
    queryPublicKeyRespBean.network = map['network'];
    return queryPublicKeyRespBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "coin": coin,
    "version": version,
    "network": network,
  };
}