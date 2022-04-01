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

}


abstract class Paths {
  static const root = '/';

  static const home = '/home';


  static const web = '/web';
  static const imageScreenShow = '/image/screenShow';


  static const userHome = '/user/home';


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

