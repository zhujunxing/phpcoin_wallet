
import 'package:floor/floor.dart';
import 'package:flutter_phpcoin/db/entity/address_book_entity.dart';

import '../dao/address_book_dao.dart';

// database.dart

// required package imports
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'address_book_database.g.dart';


@Database(version: 1, entities: [AddressBook])
abstract class AddressBookDatabase extends FloorDatabase {
  static String dbName = "db_address_book.db";

  AddressBookDao get addressBookDao;


}
