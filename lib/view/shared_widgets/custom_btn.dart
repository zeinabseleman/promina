import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/view/shared_widgets/text_widget.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    this.backGroundColor ,
    required this.onPressed,
    this.textColor = Colors.white,
    this.isOpen = true,
    this.width,
    this.height,
    this.textSize,
    this.fontWeight,
    this.radius=10,
    this.child,

  }) : super(key: key);
  final String title;
  final Color? backGroundColor;
  final Color textColor;
  final double? textSize;
  final VoidCallback? onPressed;
  final bool isOpen;
  final double? width;
  final double? height;
  final FontWeight? fontWeight;
  final double radius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        width: width,
        height: (height==null)?46.h:height,
        child: TextButton(
          style:  ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
              primary: backGroundColor,
              shape:   RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
          ),
          onPressed: onPressed,
          child:
          Center(
            child: (child==null)
            ?TextWidget(
              title,
              color: textColor,
              fontSize: textSize!,
              fontWeight: fontWeight!,
           // height: 1.2,
            ):child
          ),
        ),
      );
  }

}
