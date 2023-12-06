import 'package:floor/floor.dart';

import '../entity/address_book_entity.dart';



@dao
abstract class AddressBookDao {
  //查询所有
  @Query('SELECT * FROM AddressBook order by id desc')
  Future<List<AddressBook>?> findAddressBookAll();

  //查询分页
  @Query('SELECT * FROM AddressBook order by id desc limit :startIndex,:pageSize')
  Future<List<AddressBook>?> findAddressBookPage(int startIndex,int pageSize);


  @Query('SELECT * FROM AddressBook WHERE id = :id')
  Stream<AddressBook?> findAddressBookById(int id);


  @Query('DELETE FROM AddressBook  WHERE  id = :id')
  Future<void> deleteAddressBookById(int id); // select multiple items

  @Query('DELETE FROM AddressBook')
  Future<void> deleteAddressBook(); // select multiple items

  @insert
  Future<void> insertAddressBook(AddressBook data);

  @update
  Future<void> updateAddressBook(AddressBook data);
}
