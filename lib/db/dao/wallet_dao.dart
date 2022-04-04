import 'package:floor/floor.dart';

import '../entity/address_book_entity.dart';
import '../entity/wallet_entity.dart';



@dao
abstract class WalletDao {
  //查询所有
  @Query('SELECT * FROM Wallet order by id desc')
  Future<List<Wallet>?> findWalletAll();

  //查询分页
  @Query('SELECT * FROM Wallet order by id desc limit :startIndex,:pageSize')
  Future<List<Wallet>?> findWalletPage(int startIndex,int pageSize);


  //通过钱包类型查询
  @Query('SELECT * FROM Wallet WHERE walletType = :walletType order by id desc')
  Future<List<Wallet>?> findWalletByWalletType(String walletType);

  //通过钱包名称查询
  @Query('SELECT * FROM Wallet WHERE walletName = :walletName order by id desc')
  Future<List<Wallet>?> findWalletByWalletName(String walletName);

  //通过钱包地址查询
  @Query('SELECT * FROM Wallet WHERE walletAddress = :walletAddress order by id desc')
  Future<List<Wallet>?> findWalletByWalletAddress(String walletAddress);


  @Query('SELECT * FROM Wallet WHERE id = :id')
  Stream<Wallet?> findWalletById(int id);


  @Query('SELECT * FROM Wallet WHERE select = :select')
  Stream<Wallet?> findWalletBySelect(int select);


  @Query('DELETE FROM Wallet  WHERE  id = :id')
  Future<void> deleteWalletById(int id); // select multiple items

  @Query('DELETE FROM Wallet')
  Future<void> deleteWallet(); // select multiple items

  @insert
  Future<void> insertWallet(Wallet data);

  @update
  Future<void> updateWallet(Wallet data);
}
