

import 'package:flutter_phpcoin/db/entity/address_book_entity.dart';

class AddressBookData{
  int? type;
  AddressBook? data;
  Function? refresh;
  AddressBookData({this.type,this.data,this.refresh});
}