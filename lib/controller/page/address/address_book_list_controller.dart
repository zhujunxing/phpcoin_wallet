

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phpcoin/db/service/address_book_db_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../db/entity/address_book_entity.dart';



class AddressBookListController extends SuperController{

  RxList<AddressBook> dataAr=<AddressBook>[].obs;
  @override
  void onInit() {
    super.onInit();

  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onDetached() {

  }

  @override
  void onInactive() {
  }

  @override
  void onPaused() {

  }

  @override
  void onResumed() {

  }


  void queryAddressBookList()async{
    List<AddressBook> address=await AddressBookDbService.getInstance()!.findAll();
    dataAr.value=address;

  }


}
