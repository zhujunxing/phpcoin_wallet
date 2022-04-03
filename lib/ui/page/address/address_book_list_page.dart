
import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phpcoin/routes/app_pages.dart';
import 'package:flutter_phpcoin/ui/page/address/address_book_edit_page.dart';
import 'package:flutter_phpcoin/ui/page/address/address_book_item.dart';
import 'package:flutter_phpcoin/ui/page/assets/assets_b_item.dart';
import 'package:flutter_phpcoin/widget/custom/back_button.dart';
import 'package:flutter_phpcoin/widget/custom/no_data.dart';
import 'package:get/get.dart';

import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../controller/page/address/address_book_list_controller.dart';
import '../../../controller/page/assets/assets_main_controller.dart';
import '../../../controller/page/home/home_assets_controller.dart';
import '../../../controller/page/home/home_myself_controller.dart';
import '../../../data/address/address_book_data.dart';
import '../../../db/entity/address_book_entity.dart';
import '../../../lang/string.dart';
import '../../../res/colors.dart';
import '../../../res/resource.dart';
import '../../../res/style.dart';
import '../../../utils/screen.dart';
import '../../../widget/bar/app_bar.dart';
import '../../../widget/custom/custom_smart_refresher.dart';
import '../../../widget/custom/divider_line.dart';


//总资产
// ignore: must_be_immutable
class AddressBookListPage extends StatelessWidget {
  late AddressBookListController controller;
  AddressBookListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller=AddressBookListController();
    controller.queryAddressBookList();
    return Scaffold(
        backgroundColor:  Colors.white,
        appBar:BaseAppBar(
          leading: BackBt(onPressed: (){
            Get.back();
          },),
          title:Ids.addressBook.tr,
          bgColor: Colors.white,
        ),
      body:Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child:CustomScrollView(
              slivers: [
               Obx((){
                 return  SliverList(
                   delegate: SliverChildBuilderDelegate((content, index) {
                     AddressBook  item=controller.dataAr.toList().elementAt(index);
                     return Material(
                       color: Colors.white,
                       child: InkWell(
                         onTap: ()async{

                          Get.toNamed(Routes.addressBookEdit,arguments: AddressBookData(
                               type: AddressBookType.modify,
                               data: item,
                               refresh:(){
                                 controller.queryAddressBookList();
                               }
                           ));

                         },
                         child: AddressBookItem(item,index),
                       ),
                     );
                   }, childCount: controller.dataAr.length),
                 );
               }),
                 Obx((){
                   return SliverToBoxAdapter(
                     child: controller.dataAr.isNotEmpty?const SizedBox():const NoData(),
                   );
                 }),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(Dimens.dp20, 0, Dimens.dp20, 0),
                          height: Dimens.dp40,
                          child: Text(Ids.createContact.tr,style: TextStyle(
                            fontSize: Dimens.sp14,
                            color: Colors.white,
                          ),),
                          decoration: BoxDecoration(
                            color: Colours.accentColor,
                            borderRadius: BorderRadius.circular(Dimens.sp20),
                          ),
                          alignment: Alignment.center,
                        ),
                    ],
                  ),
                  onTap: ()async{
                    Get.toNamed(Routes.addressBookEdit,arguments: AddressBookData(
                        type: AddressBookType.add,
                        refresh:(){
                          controller.queryAddressBookList();
                        }
                    ));

                  },
                ),
                Container(
                  height: Screen.bottomBarHeight+Dimens.dp20,
                ),
              ],
            ),
          ),

        ],
      ),

    );
  }

}




