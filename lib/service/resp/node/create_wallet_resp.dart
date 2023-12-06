/// status : "ok"
/// data : {"address":"PZMnKs82m2BxVCz9XPg5rfzesWbHfG8fSc","public_key":"PZ8Tyr4Nx8MHsRAGMpZmZ6TWY63dXWSCyGrUvKZhUtqBrjuKYveRSRdHt1UBwX1vPvTMmooMC5SVm6Xzuzv4T5HReoHbBP5r9bjWUvbEL5XHrGT8FRSZgYXi","private_key":"Lzhp9LopCMgsVqhC5sN7yCvPbHwQEi64BMUFDG4WAPorXhxGkhaxMQye9h84hoKXkuQtiwXGJjwndR4xNKDJyjC1U4hjWEVzR3dmmRaLEaQ9zNwE3jHnRcAUhtqX7ArEyyXHDFvSNyiQ5Yo68MrcgFScL4AEwdZap"}
/// coin : "phpcoin"
/// version : "1.0.3"
/// network : "mainnet-alpha"

class CreateWalletResp {
  String? status;
  CreateWalletDataBean? data;
  String? coin;
  String? version;
  String? network;

  static CreateWalletResp fromMap(Map<String, dynamic> map) {

    CreateWalletResp createWalletRespBean = CreateWalletResp();
    createWalletRespBean.status = map['status'];
    if(map['data']!=null){
      createWalletRespBean.data = CreateWalletDataBean.fromMap(map['data']);
    }

    createWalletRespBean.coin = map['coin'];
    createWalletRespBean.version = map['version'];
    createWalletRespBean.network = map['network'];
    return createWalletRespBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "coin": coin,
    "version": version,
    "network": network,
  };
}

/// address : "PZMnKs82m2BxVCz9XPg5rfzesWbHfG8fSc"
/// public_key : "PZ8Tyr4Nx8MHsRAGMpZmZ6TWY63dXWSCyGrUvKZhUtqBrjuKYveRSRdHt1UBwX1vPvTMmooMC5SVm6Xzuzv4T5HReoHbBP5r9bjWUvbEL5XHrGT8FRSZgYXi"
/// private_key : "Lzhp9LopCMgsVqhC5sN7yCvPbHwQEi64BMUFDG4WAPorXhxGkhaxMQye9h84hoKXkuQtiwXGJjwndR4xNKDJyjC1U4hjWEVzR3dmmRaLEaQ9zNwE3jHnRcAUhtqX7ArEyyXHDFvSNyiQ5Yo68MrcgFScL4AEwdZap"

class CreateWalletDataBean {
  String? address;
  String? publicKey;
  String? privateKey;

  static CreateWalletDataBean fromMap(Map<String, dynamic> map) {

    CreateWalletDataBean dataBean = CreateWalletDataBean();
    dataBean.address = map['address'];
    dataBean.publicKey = map['public_key'];
    dataBean.privateKey = map['private_key'];
    return dataBean;
  }

  Map toJson() => {
    "address": address,
    "public_key": publicKey,
    "private_key": privateKey,
  };
}