
import 'package:floor/floor.dart';
@entity
class AddressBook {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? name;
  String? remarks;
  String? walletType;
  String? walletAddress;
  int?  isDefault;
  int?  createDate;
  AddressBook(this.id,this.name, this.remarks, this.walletType, this.walletAddress,
      this.isDefault,this.createDate);

  @override
  int get hashCode => id.hashCode;


}