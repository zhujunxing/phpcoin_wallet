import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../../res/resource.dart';
import '../../res/style.dart';


class BackBt extends StatelessWidget {
  final Color? color;
  final AssetImage? image;
  final double? size;
  final VoidCallback? onPressed;
  final bool? isClose;
  const BackBt(
      {Key? key,
      this.color,
      this.image,
      this.size,
      this.onPressed,
      this.isClose})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: ImageIcon(
        AssetImage(
          isClose??false? ImageResource.exit : ImageResource.back,
        ),
        size: size ?? Dimens.sp18,
      ),
      color: color ?? Colours.defaultTextColor,
    );
  }
}
