import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/colors.dart';
import 'package:task/view/shared_widgets/login_cotainer.dart';
import 'package:task/view/shared_widgets/text_widget.dart';

import '../../../../utils/localization/appLocalization.dart';
import '../../../shared_widgets/custom_btn.dart';
import '../../../shared_widgets/upload_button.dart';
class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        UploadButton(
          text: 'log_out',
          color:AppColors.logoutButton ,
          icon: 'assets/icons/logout.png',
          onTap: (){},
        ),
        UploadButton(
          text: 'upload',
          color:AppColors.uploadButton ,
          icon: 'assets/icons/upload.png',
          onTap: (){
          },
        ),

      ],
    );
  }
}
