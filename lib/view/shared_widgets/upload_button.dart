import 'package:flutter/material.dart';
import 'package:task/view/shared_widgets/text_widget.dart';

import '../../core/colors.dart';
import '../../utils/localization/appLocalization.dart';
import 'custom_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadButton extends StatelessWidget {
final String text;
final Color? color;
final String? icon;
final Function()? onTap;

  const UploadButton({super.key, required this.text,
 this.color,this.onTap,this.icon});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        title: '',
        width: 145.w,
        radius: 16,
        backGroundColor: Colors.white,
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 28.w,
              height: 32.h,
              decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle
              ),
              child: Image.asset(icon!),
            ),
            SizedBox(width: 10.w,),
            TextWidget(
              '${AppLocalizations.of(context)!.translate(text)}',
              fontSize: 20.sp,
              fontFamily: 'BalooThambi2',
            ),

          ],
        )
    );
  }
}
