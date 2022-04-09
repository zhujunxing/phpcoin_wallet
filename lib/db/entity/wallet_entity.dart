
import 'package:floor/floor.dart';
@entity
class Wallet {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? walletName; //钱包名称
  String? walletType;  //钱包类型
  String? walletAddress;  //钱包地址
  String? walletPublicKey;   //钱包公钥
  String? walletPrivateKey;  //钱包私钥
  String? pwd; //密码
  String? pwdTip;//密码提示
  int? createDate; //创建时间
  String? mnemonic; //助记词
  int? updateDate; //更新时间
  int? watch; // 0 不是观察钱包 1 是观察钱包
  int? walletSelect;//0 没有选中 1 被选中
  Wallet(this.id,this.walletName, this.walletType, this.walletAddress, this.walletPublicKey,
      this.walletPrivateKey,this.pwd,this.pwdTip,this.createDate,this.mnemonic,this.updateDate,
      this.watch,this.walletSelect);

  @override
  int get hashCode => id.hashCode;


}