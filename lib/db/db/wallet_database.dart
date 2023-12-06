
import 'package:floor/floor.dart';
import 'package:flutter_phpcoin/db/dao/wallet_dao.dart';
import 'package:flutter_phpcoin/db/entity/address_book_entity.dart';

import '../dao/address_book_dao.dart';

// database.dart

// required package imports
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../entity/wallet_entity.dart';

part 'wallet_database.g.dart';


@Database(version: 1, entities: [Wallet])
abstract class WalletDatabase extends FloorDatabase {
  static String dbName = "db_wallet.db";

  WalletDao get walletDao;


}
