
/// status : "ok"
/// data : {"address":"PZMnKs82m2BxVCz9XPg5rfzesWbHfG8fSc","public_key":"PZ8Tyr4Nx8MHsRAGMpZmZ6TWY63dXWSCyGrUvKZhUtqBrjuKYveRSRdHt1UBwX1vPvTMmooMC5SVm6Xzuzv4T5HReoHbBP5r9bjWUvbEL5XHrGT8FRSZgYXi","private_key":"Lzhp9LopCMgsVqhC5sN7yCvPbHwQEi64BMUFDG4WAPorXhxGkhaxMQye9h84hoKXkuQtiwXGJjwndR4xNKDJyjC1U4hjWEVzR3dmmRaLEaQ9zNwE3jHnRcAUhtqX7ArEyyXHDFvSNyiQ5Yo68MrcgFScL4AEwdZap"}
/// coin : "phpcoin"
/// version : "1.0.3"
/// network : "mainnet-alpha"

class SendBalanceResp {
  String? status;
  String? data;
  String? coin;
  String? version;
  String? network;

  static SendBalanceResp fromMap(Map<String, dynamic> map) {

    SendBalanceResp queryBalanceRespBean = SendBalanceResp();
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