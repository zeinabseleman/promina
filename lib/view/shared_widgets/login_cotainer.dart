import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class LoginContainer extends StatelessWidget {
final double? height;
final double? width;
final Widget? child;

  const LoginContainer({super.key, this.height, this.width,this.child});

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      height:height ,
      width: width,
      blur: 10,
      elevation: 0,
      color: Colors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(32)),
      child: child!,
    );
  }
}

