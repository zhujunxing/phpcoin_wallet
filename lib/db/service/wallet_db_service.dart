


import 'package:flutter_phpcoin/db/dao/wallet_dao.dart';
import 'package:flutter_phpcoin/db/entity/wallet_entity.dart';

import '../db/wallet_database.dart';

class WalletDbService {
  String tag = "addressBook";

  late WalletDatabase database;

  static WalletDbService? service;


  static WalletDbService? getInstance() {
    service ??= WalletDbService();

    return service;
  }

  ///初始化
  Future open() async {
    database =
    await $FloorWalletDatabase.databaseBuilder(WalletDatabase.dbName).build();
  }
  ///销毁
  Future close() async {
    database.close();
  }

  ///通过id更新
  Future<void> update(Wallet data) async {

    return database.walletDao.updateWallet(data);
  }
  ///通过id添加
  Future<void> add(Wallet data) async {

    return database.walletDao.insertWallet(data);
  }
  ///通过id删除
  Future<void> deleteById(int id) async {

    return database.walletDao.deleteWalletById(id);
  }
  ///查询分页
  Future<List<Wallet>> findPage(int startIndex,int pageSize) async {

    List<Wallet>? data=[];

    WalletDao dao = database.walletDao;
    data = await dao.findWalletPage(startIndex, pageSize);

    data ??= [];
    return data;
  }

  Future<List<Wallet>> findWalletByWalletName(String walletName) async {

    List<Wallet>? data=[];

    WalletDao dao = database.walletDao;
    data = await dao.findWalletByWalletName(walletName);

    data ??= [];
    return data;
  }
  Future<List<Wallet>> findWalletByWalletAddress(String walletAddress) async {

    List<Wallet>? data=[];

    WalletDao dao = database.walletDao;
    data = await dao.findWalletByWalletAddress(walletAddress);

    data ??= [];
    return data;
  }

  Future<List<Wallet>> findWalletByWalletType(String walletType) async {

    List<Wallet>? data=[];

    WalletDao dao = database.walletDao;
    data = await dao.findWalletByWalletType(walletType);

    data ??= [];
    return data;
  }


  ///查询所有
  Future<List<Wallet>> findAll() async {

    List<Wallet>? data=[];

    WalletDao dao = database.walletDao;
    data = await dao.findWalletAll();

    data ??= [];
    return data;
  }



  ///查询选中钱包，如果选中钱包被删除就会默认选中
  Future<Wallet?> findSelect() async {

    List<Wallet>? data=[];

    WalletDao dao = database.walletDao;
    data = await dao.findWalletBySelect();

    data ??= [];

    if(data.isNotEmpty){
      return data.first;
    }else{
      return null;
    }
  }


  ///查询密码
  Future<Wallet?> findWalletByPwdAddress(String  pwd,String address) async {


    WalletDao dao = database.walletDao;
    Wallet?  data = await dao.findWalletByPwdAddress(pwd,address);

    return data;
  }

  ///查询私钥
  Future<Wallet?> findWalletByPrivateKeyAddress(String  walletPrivateKey,String address) async {


    WalletDao dao = database.walletDao;
    Wallet?  data = await dao.findWalletByPrivateKeyAddress(walletPrivateKey,address);

    return data;
  }

  ///更新
  Future<void> updateAllSelect(int  walletSelect) async {


    WalletDao dao = database.walletDao;
      await dao.updateAllSelect(walletSelect);
      return;
  }
}
