import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/view/shared_widgets/text_widget.dart';

class GalleryAppBar extends StatelessWidget {
  const GalleryAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 142.w,
          child: TextWidget(
            'Welcome Mina',
            fontSize: 32.sp,
            fontFamily: 'BalooThambi2',
            align: TextAlign.left,
          ),
        ),
        SizedBox(
            width: 66.w,
            height: 66.h,
            child: Image.asset('assets/images/profile.png'))

      ],
    );
  }
}
