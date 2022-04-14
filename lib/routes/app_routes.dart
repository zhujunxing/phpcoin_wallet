part of 'app_pages.dart';

abstract class Routes {
  ///根节点
  static const root =Paths.root;


  ///在线网址
  static const web=Paths.web;

  ///图片全屏浏览
  static const imageScreenShow=Paths.imageScreenShow;


  ///主页
  static const home=Paths.home;

  ///总资产
  static const assetsMain=Paths.assetsMain;

  ///地址薄列表
  static const addressBookList=Paths.addressBookList;
  ///地址薄编辑
  static const addressBookEdit=Paths.addressBookEdit;
  ///扫码
  static const scan=Paths.scan;

  ///关于app
  static const aboutApp=Paths.aboutApp;
  ///系统设置
  static const systemSet=Paths.systemSet;

  ///语言切换
  static const  languageSwitch=Paths.languageSwitch;

  ///钱包选择
  static const  walletSelect=Paths.walletSelect;
  ///钱包选择创建，导入
  static const  walletCreateImport=Paths.walletCreateImport;

  ///钱包-创建钱包
  static const  walletCreate=Paths.walletCreate;

  ///钱包-观察钱包
  static const  walletWatchImport=Paths.walletWatchImport;

  ///钱包-私钥导入
  static const  walletPrivateImport=Paths.walletPrivateImport;
  ///钱包-钱包详情
  static const  walletDetail=Paths.walletDetail;
  ///钱包-钱包导出私钥
  static const  walletExportPrivateKey=Paths.walletExportPrivateKey;

  ///钱包-钱包密码修改
  static const  walletPwdModify=Paths.walletPwdModify;
  ///钱包-钱包密码修改-私钥修改
  static const  walletPwdPrivateKeyModify=Paths.walletPwdPrivateKeyModify;


  ///转账接受二维码
  static const  transferReceiveErWei=Paths.transferReceiveErWei;

  ///转账接受二维码
  static const  walletManager=Paths.walletManager;


}


abstract class Paths {
  static const root = '/';

  static const home = '/home';


  static const web = '/web';
  static const imageScreenShow = '/image/screenShow';

  static const assetsMain = '/assets/main';

  static const addressBookList = '/address/book/list';

  static const addressBookEdit = '/address/book/edit';

  static const scan = '/scan';

  static const aboutApp = '/about/app';

  static const systemSet = '/system/set';
  static const languageSwitch = '/language/switch';

  static const walletSelect = '/wallet/select';

  static const walletCreateImport = '/wallet/createImport';
  static const walletCreate = '/wallet/create';

  static const walletWatchImport = '/wallet/watch/import';
  static const walletPrivateImport = '/wallet/private/import';

  static const walletDetail= '/wallet/detail';
  static const walletExportPrivateKey= '/wallet/export/private/key';
  static const walletPwdModify= '/wallet/pwd/modify';

  static const walletPwdPrivateKeyModify= '/wallet/pwd/private/key/modify';

  static const transferReceiveErWei= '/transfer/receive/erWei';


  static const walletManager= '/wallet/manager';

}


class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,

        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
    opaque: false,
    barrierColor: const Color(0x00000001),
  );
}

class PopRoute extends PopupRoute {
  final Duration _duration = const Duration(milliseconds: 300);
  Widget child;

  PopRoute({required this.child});

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}

