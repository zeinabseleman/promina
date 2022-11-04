
import 'package:flutter/material.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/colors.dart';
import '../../utils/localization/appLocalization.dart';

class AuthTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String errorMessage;
  final bool hasPassword;
  final bool isEditable;
  final bool isNotes;
  final GlobalKey<FormState>? formKey;
  final  FocusNode? focusNode;
  final String hintText;
  final VoidCallback? onTap;
  const AuthTextFormField({
    Key? key,
    this.isEditable = true,
    this.isNotes = false,
    this.hasPassword = false,
     this.controller,
     this.errorMessage='',
     this.formKey,
    this.focusNode,
     required this.hintText,
    this.onTap,
  }) : super(key: key);

  @override
  State<AuthTextFormField> createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {

  bool showPassword = true;


  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.translate(widget.errorMessage);
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,

      controller: widget.controller,
      enabled: widget.isEditable,
      onEditingComplete: () {
        widget.formKey?.currentState?.validate();
      },
      textInputAction: TextInputAction.next,
      focusNode: widget.focusNode,
      autofocus: false,
      onTap: widget.onTap,
      showCursor: false,
      obscureText: (widget.hasPassword) ? showPassword : widget.hasPassword,
      maxLines: (widget.isNotes) ? 3 : 1,
      autocorrect: false,
      textAlign:
          (locale!.locale.languageCode == "ar")
          ? TextAlign.right
          : TextAlign.left,

      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor:AppColors.textFieldColor,
        hintText: AppLocalizations.of(context)!.translate(widget.hintText),
        hintStyle:
        TextStyle(
          color: AppColors.hintColor,
          height: 0,
            fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius. circular(22.0),

        ),
       contentPadding: EdgeInsetsDirectional.only(top: 11.h,bottom: 13.h,start: 21.w,end: 21.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius. circular(22.0),
          borderSide:  const BorderSide(color: Colors.transparent),
        ),
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius. circular(22.0),
          borderSide:  const BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(22)),
          borderSide: BorderSide(width: 2, color: Colors.red),
        ),
        disabledBorder: InputBorder.none,
        errorStyle: TextStyle(
          fontSize: 12.sp,
         height:0.5,
        ),

      ),
    );
  }
}


