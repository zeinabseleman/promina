import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/repository/auth_repo.dart';
import 'package:task/utils/localization/appLocalization.dart';
import 'package:task/view/shared_widgets/custom_btn.dart';
import 'package:task/view/shared_widgets/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors.dart';
import '../../../provider/user_provider.dart';
import '../../../utils/custom_function.dart';
import '../../shared_widgets/auth_text_field.dart';
import '../../shared_widgets/login_cotainer.dart';
import '../gallery_pages/gallery_screen.dart';

class LoginScreen extends StatelessWidget {

  var loginFormKey = GlobalKey<FormState>();
  var loginScaffoldKey = GlobalKey<ScaffoldState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    return  SafeArea(
        child:Scaffold(
          key:loginScaffoldKey,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:AssetImage(
                        'assets/images/background.png'
                    ),
                  fit: BoxFit.fill
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 174.w,
                  child: TextWidget(
                    'My Gellary ',
                    fontSize: 50.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(height: 40.h,),
                 LoginContainer(
                  height: 345.h,
                  width: 388.w,
                  child: Padding(
                    padding:  EdgeInsetsDirectional.only(start: 31.w,end: 31.w),
                    child: Form(
                      key: loginFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextWidget(
                              '${AppLocalizations.of(context)!.translate('login')}',
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            AuthTextFormField(
                              formKey: loginFormKey,
                              errorMessage: 'enter_name',
                              controller: nameController,
                              hintText: 'user_name',
                            ),
                            AuthTextFormField(
                              formKey: loginFormKey,
                              errorMessage: 'Enter_password',
                              controller: passwordController,
                              hasPassword: true,
                              hintText: 'password',
                            ),
                            CustomButton(
                                title: '${AppLocalizations.of(context)!.translate('submit')}',
                                onPressed: (){
                                  if (
                                  loginFormKey.currentState!.validate() &&
                                      validateInputs(scaffoldKey: loginScaffoldKey)
                                  ) {
                                    //Login
                                    CustomViews.showLoadingDialog(context: context);
                                    userProvider
                                        .login(
                                        email: nameController.text,
                                        password: passwordController.text
                                    )
                                        .whenComplete(() =>
                                        CustomViews.dismissDialog(context: context))
                                        .then((value) async {
                                      if (userProvider.userModel?.token==null) {
                                        CustomViews.showSnackBar(
                                            message:
                                            'المستخدم غير موجود',
                                            scaffoldKey: loginScaffoldKey,
                                            context: context,
                                            color: AppColors.primaryColor);
                                      } else {
                                        log("Successful Login");
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) =>
                                            const GalleryScreen())
                                        );
                                      }
                                    });
                                  }

                                },
                               backGroundColor: AppColors.buttonColor,
                              fontWeight: FontWeight.bold,
                              textSize: 18.sp,

                            )
                          ],
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
  bool validateInputs({var scaffoldKey}) {
    return true;
  }
}
