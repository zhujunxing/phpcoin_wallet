


import '../dao/address_book_dao.dart';
import '../db/address_book_database.dart';
import '../entity/address_book_entity.dart';

class AddressBookDbService {
  String tag = "addressBook";

  late AddressBookDatabase database;

  static AddressBookDbService? service;


  static AddressBookDbService? getInstance() {
    service ??= AddressBookDbService();

    return service;
  }

  ///初始化
  Future open() async {
    database =
    await $FloorAddressBookDatabase.databaseBuilder(AddressBookDatabase.dbName).build();
  }
  ///销毁
  Future close() async {
    database.close();
  }

  ///通过id更新
  Future<void> update(AddressBook data) async {

    return database.addressBookDao.updateAddressBook(data);
  }
  ///通过id添加
  Future<void> add(AddressBook data) async {

    return database.addressBookDao.insertAddressBook(data);
  }
  ///通过id删除
  Future<void> deleteById(int id) async {

    return database.addressBookDao.deleteAddressBookById(id);
  }
  ///查询分页
  Future<List<AddressBook>> findPage(int startIndex,int pageSize) async {

    List<AddressBook>? data=[];

    AddressBookDao dao = database.addressBookDao;
    data = await dao.findAddressBookPage(startIndex, pageSize);

    data ??= [];
    return data;
  }
  ///查询所有
  Future<List<AddressBook>> findAll() async {

    List<AddressBook>? data=[];

    AddressBookDao dao = database.addressBookDao;
    data = await dao.findAddressBookAll();

    data ??= [];
    return data;
  }

}
