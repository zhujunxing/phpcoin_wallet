


import '../../db/entity/wallet_entity.dart';

class WalletTokenDetailData{
  Wallet? wallet;
  String? tokenAddress;
  String? tokenName;
  WalletTokenDetailData({required this.wallet,required this.tokenAddress,this.tokenName});
}